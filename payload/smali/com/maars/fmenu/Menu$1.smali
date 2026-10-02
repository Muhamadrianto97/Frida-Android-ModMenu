.class Lcom/maars/fmenu/Menu$1;
.super Ljava/lang/Object;
.source "Menu.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/maars/fmenu/Menu;->SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/maars/fmenu/Menu;

.field final synthetic val$featName:Ljava/lang/String;

.field final synthetic val$min:I

.field final synthetic val$step:I

.field final synthetic val$textView:Landroid/widget/TextView;

.field final synthetic val$value:Lcom/maars/fmenu/PInteger;


# direct methods
.method constructor <init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PInteger;IILandroid/widget/TextView;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/maars/fmenu/Menu;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 257
    iput-object p1, p0, Lcom/maars/fmenu/Menu$1;->this$0:Lcom/maars/fmenu/Menu;

    iput-object p2, p0, Lcom/maars/fmenu/Menu$1;->val$value:Lcom/maars/fmenu/PInteger;

    iput p3, p0, Lcom/maars/fmenu/Menu$1;->val$step:I

    iput p4, p0, Lcom/maars/fmenu/Menu$1;->val$min:I

    iput-object p5, p0, Lcom/maars/fmenu/Menu$1;->val$textView:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/maars/fmenu/Menu$1;->val$featName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "val"    # I
    .param p3, "b"    # Z

    .line 260
    iget-object v0, p0, Lcom/maars/fmenu/Menu$1;->val$value:Lcom/maars/fmenu/PInteger;

    iget v1, p0, Lcom/maars/fmenu/Menu$1;->val$step:I

    mul-int v1, v1, p2

    iget v2, p0, Lcom/maars/fmenu/Menu$1;->val$min:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/maars/fmenu/PInteger;->set(I)V

    .line 261
    iget-object v0, p0, Lcom/maars/fmenu/Menu$1;->val$value:Lcom/maars/fmenu/PInteger;

    invoke-virtual {v0}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/maars/fmenu/Menu$1;->this$0:Lcom/maars/fmenu/Menu;

    invoke-static {v0}, Lcom/maars/fmenu/Menu;->access$000(Lcom/maars/fmenu/Menu;)Lcom/maars/fmenu/Config;

    move-result-object v0

    iget v0, v0, Lcom/maars/fmenu/Config;->SEEKBAR_NUMBER_NEG_COLOR:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/maars/fmenu/Menu$1;->this$0:Lcom/maars/fmenu/Menu;

    invoke-static {v0}, Lcom/maars/fmenu/Menu;->access$000(Lcom/maars/fmenu/Menu;)Lcom/maars/fmenu/Config;

    move-result-object v0

    iget v0, v0, Lcom/maars/fmenu/Config;->SEEKBAR_NUMBER_POS_COLOR:I

    .line 262
    .local v0, "color":I
    :goto_0
    iget-object v1, p0, Lcom/maars/fmenu/Menu$1;->val$textView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/maars/fmenu/Menu$1;->val$featName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": <font color=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/maars/fmenu/Menu$1;->val$value:Lcom/maars/fmenu/PInteger;

    invoke-virtual {v3}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</font>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 268
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 273
    return-void
.end method
