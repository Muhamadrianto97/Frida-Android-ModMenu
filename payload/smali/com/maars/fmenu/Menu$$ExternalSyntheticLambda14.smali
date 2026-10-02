.class public final synthetic Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/maars/fmenu/Menu;

.field public final synthetic f$1:Lcom/maars/fmenu/PBoolean;

.field public final synthetic f$2:Landroid/widget/Button;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PBoolean;Landroid/widget/Button;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;->f$0:Lcom/maars/fmenu/Menu;

    iput-object p2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;->f$1:Lcom/maars/fmenu/PBoolean;

    iput-object p3, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;->f$2:Landroid/widget/Button;

    iput-object p4, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;->f$0:Lcom/maars/fmenu/Menu;

    iget-object v1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;->f$1:Lcom/maars/fmenu/PBoolean;

    iget-object v2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;->f$2:Landroid/widget/Button;

    iget-object v3, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;->f$3:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/maars/fmenu/Menu;->lambda$ButtonOnOff$1$com-maars-fmenu-Menu(Lcom/maars/fmenu/PBoolean;Landroid/widget/Button;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
