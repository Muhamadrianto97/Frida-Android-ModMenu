<#
Frida ModMenu Template - build & inject pipeline.

Contoh:
  .\tools\build.ps1 -Project "E:\Mod\APKToolGUI\Game\Game_mod" -Out "E:\Mod\APKToolGUI\Game\out\Game_ModMenu.apk"
  .\tools\build.ps1 -Project ... -Out ... -Install -Device 192.168.1.10:5555
  .\tools\build.ps1 -Project ... -Out ... -Listen     # mode dev, script di-load dari PC

Langkah:
  1. Compile script/src/index.ts -> script/dist/index.js
  2. Copy gadget + config + script (lib<ScriptLib>.so) ke lib/<Abi>
  3. Copy smali menu com.maars.fmenu ke smali_classesN baru (sekali saja)
  4. Patch onCreate activity utama: System.loadLibrary("frida-gadget") (sekali saja)
  5. apktool b -> zipalign -> apksigner (testkey) -> opsional adb install
#>
param(
  [Parameter(Mandatory)] [string] $Project,
  [Parameter(Mandatory)] [string] $Out,
  [string] $Activity = "com.unity3d.player.UnityPlayerActivity",
  [string] $ScriptLib = "modmenu",
  [string] $Entry = "src/index.ts",
  [string] $Abi = "arm64-v8a",
  [string] $Resources = "E:\Mod\APKToolGUI\Resources",
  [switch] $SkipCompile,
  [switch] $Install,
  [switch] $Listen,
  [string] $Device
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$scriptDir = Join-Path $root "script"
$payload = Join-Path $root "payload"

function Step($msg) { Write-Host "==> $msg" -ForegroundColor Cyan }

if (-not (Test-Path -LiteralPath (Join-Path $Project "apktool.yml"))) {
  throw "Project bukan folder hasil apktool d: $Project"
}

if (-not $SkipCompile) {
  Step "Compile script"
  Push-Location $scriptDir
  try {
    New-Item -ItemType Directory -Force dist | Out-Null
    node node_modules\frida-compile\dist\cli.js $Entry -o dist/index.js -c
    if ($LASTEXITCODE -ne 0) { throw "frida-compile gagal" }
  } finally { Pop-Location }
}

Step "Copy gadget + script ke lib\$Abi"
$lib = Join-Path $Project "lib\$Abi"
New-Item -ItemType Directory -Force $lib | Out-Null
Copy-Item -LiteralPath (Join-Path $payload "gadget\libfrida-gadget.so") -Destination (Join-Path $lib "libfrida-gadget.so") -Force
Copy-Item -LiteralPath (Join-Path $scriptDir "dist\index.js") -Destination (Join-Path $lib "lib$ScriptLib.so") -Force
if ($Listen) {
  Write-Host "    mode LISTEN (dev): attach dari PC dengan  frida -U Gadget -l script\dist\index.js" -ForegroundColor Yellow
  $config = @"
{
  "interaction": {
    "type": "listen",
    "address": "127.0.0.1",
    "port": 27042,
    "on_load": "wait"
  }
}
"@
} else {
  $config = @"
{
  "interaction": {
    "type": "script",
    "path": "lib$ScriptLib.so",
    "on_load": "resume"
  }
}
"@
}
[IO.File]::WriteAllText((Join-Path $lib "libfrida-gadget.config.so"), $config)

Step "Inject smali menu"
$smaliDirs = Get-ChildItem -LiteralPath $Project -Directory | Where-Object { $_.Name -match '^smali(_classes\d+)?$' }
$existing = $smaliDirs | Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName "com\maars\fmenu\Menu.smali") } | Select-Object -First 1
if ($existing) {
  Copy-Item -Path (Join-Path $payload "smali\com\maars\fmenu\*.smali") -Destination (Join-Path $existing.FullName "com\maars\fmenu") -Force
  Write-Host "    update di $($existing.Name)"
} else {
  $max = ($smaliDirs | ForEach-Object { if ($_.Name -match '_classes(\d+)$') { [int]$Matches[1] } else { 1 } } | Measure-Object -Maximum).Maximum
  $target = Join-Path $Project ("smali_classes{0}\com\maars\fmenu" -f ($max + 1))
  New-Item -ItemType Directory -Force $target | Out-Null
  Copy-Item -Path (Join-Path $payload "smali\com\maars\fmenu\*.smali") -Destination $target -Force
  Write-Host "    -> $target"
}

Step "Patch onCreate $Activity"
$rel = ($Activity -replace '\.', '\') + ".smali"
$actFile = $smaliDirs | ForEach-Object { Join-Path $_.FullName $rel } | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
if (-not $actFile) { throw "Activity smali tidak ketemu: $rel" }
$src = [IO.File]::ReadAllText($actFile)
if ($src.Contains('"frida-gadget"')) {
  Write-Host "    sudah di-patch, dilewati"
} else {
  $pattern = '(\.method (?:public|protected) onCreate\(Landroid/os/Bundle;\)V\r?\n\s*\.locals )(\d+)(\r?\n)'
  $match = [regex]::Match($src, $pattern)
  if (-not $match.Success) { throw "onCreate(Bundle) dengan .locals tidak ketemu di $actFile" }
  $locals = [Math]::Max(1, [int]$match.Groups[2].Value)
  $nl = $match.Groups[3].Value
  $inject = "$($match.Groups[1].Value)$locals$nl$nl    const-string v0, `"frida-gadget`"$nl$nl    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V$nl"
  $src = $src.Substring(0, $match.Index) + $inject + $src.Substring($match.Index + $match.Length)
  [IO.File]::WriteAllText($actFile, $src)
  Write-Host "    -> $actFile"
}

$manifest = Join-Path $Project "AndroidManifest.xml"
$xml = [IO.File]::ReadAllText($manifest)
if ($xml.Contains('android:extractNativeLibs="false"')) {
  Step "Set extractNativeLibs=true (gadget butuh config di disk)"
  [IO.File]::WriteAllText($manifest, $xml.Replace('android:extractNativeLibs="false"', 'android:extractNativeLibs="true"'))
}

$outDir = Split-Path -Parent $Out
New-Item -ItemType Directory -Force $outDir | Out-Null
$unsigned = Join-Path $outDir "_unsigned.apk"
$aligned = Join-Path $outDir "_aligned.apk"

Step "apktool b"
java -jar (Join-Path $Resources "apktool.jar") b $Project -o $unsigned
if ($LASTEXITCODE -ne 0) { throw "apktool build gagal" }

Step "zipalign"
& (Join-Path $Resources "zipalign.exe") -f -p 4 $unsigned $aligned
if ($LASTEXITCODE -ne 0) { throw "zipalign gagal" }

Step "apksigner"
java -jar (Join-Path $Resources "apksigner.jar") sign --key (Join-Path $Resources "testkey.pk8") --cert (Join-Path $Resources "testkey.x509.pem") --out $Out $aligned
if ($LASTEXITCODE -ne 0) { throw "apksigner gagal" }
Remove-Item -LiteralPath $unsigned, $aligned -Force -ErrorAction SilentlyContinue
Write-Host "APK: $Out" -ForegroundColor Green

if ($Install) {
  $adb = Join-Path $Resources "adb.exe"
  $adbArgs = @()
  if ($Device) { & $adb connect $Device | Out-Null; $adbArgs = @("-s", $Device) }
  Step "adb install"
  & $adb @adbArgs install -r $Out
}
