<#
Konversi gambar (PNG/JPG) jadi file TypeScript berisi base64 untuk ikon menu.
Gambar otomatis di-resize ke ukuran persegi (-Size, default 192 px) dan disimpan sebagai PNG
supaya script tetap kecil.

  .\tools\icon-to-ts.ps1 -Image .\my-icon.jpg
  .\tools\icon-to-ts.ps1 -Image .\my-icon.png -Size 256
  -> script\src\icon.ts  (export const ICON = "...")

Lalu di index.ts:
  import { ICON } from "./icon";
  new ModMenu(activity, { icon: ICON });
#>
param(
  [Parameter(Mandatory)] [string] $Image,
  [int] $Size = 192,
  [string] $Out
)
$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing
$root = Split-Path -Parent $PSScriptRoot
if (-not $Out) { $Out = Join-Path $root "script\src\icon.ts" }

$src = [System.Drawing.Image]::FromFile((Resolve-Path -LiteralPath $Image))
try {
  $bmp = New-Object System.Drawing.Bitmap $Size, $Size
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
  $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
  $side = [Math]::Min($src.Width, $src.Height)
  $srcRect = New-Object System.Drawing.Rectangle ([int](($src.Width - $side) / 2)), ([int](($src.Height - $side) / 2)), $side, $side
  $g.DrawImage($src, (New-Object System.Drawing.Rectangle 0, 0, $Size, $Size), $srcRect, [System.Drawing.GraphicsUnit]::Pixel)
  $g.Dispose()
  $ms = New-Object System.IO.MemoryStream
  $bmp.Save($ms, [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
  $b64 = [Convert]::ToBase64String($ms.ToArray())
} finally { $src.Dispose() }

[IO.File]::WriteAllText($Out, "export const ICON = `"$b64`";`n")
Write-Host ("OK: {0} ({1}x{1} PNG, {2:N1} KB base64)" -f $Out, $Size, ($b64.Length / 1KB))
