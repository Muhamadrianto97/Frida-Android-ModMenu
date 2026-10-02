.class public final synthetic Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/maars/fmenu/Menu;

.field public final synthetic f$1:Lcom/maars/fmenu/PString;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Landroid/widget/Button;

.field public final synthetic f$4:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PString;Landroid/widget/EditText;Landroid/widget/Button;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$0:Lcom/maars/fmenu/Menu;

    iput-object p2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$1:Lcom/maars/fmenu/PString;

    iput-object p3, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$3:Landroid/widget/Button;

    iput-object p5, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$4:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    iget-object v0, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$0:Lcom/maars/fmenu/Menu;

    iget-object v1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$1:Lcom/maars/fmenu/PString;

    iget-object v2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$3:Landroid/widget/Button;

    iget-object v4, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;->f$4:Ljava/lang/String;

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lcom/maars/fmenu/Menu;->lambda$InputText$8$com-maars-fmenu-Menu(Lcom/maars/fmenu/PString;Landroid/widget/EditText;Landroid/widget/Button;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
