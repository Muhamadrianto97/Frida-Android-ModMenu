.class public final synthetic Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/maars/fmenu/Menu;

.field public final synthetic f$1:Lcom/maars/fmenu/PInteger;

.field public final synthetic f$2:I

.field public final synthetic f$3:Landroid/widget/TextView;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PInteger;ILandroid/widget/TextView;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$0:Lcom/maars/fmenu/Menu;

    iput-object p2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$1:Lcom/maars/fmenu/PInteger;

    iput p3, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$2:I

    iput-object p4, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$3:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$4:Ljava/lang/String;

    iput-object p6, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$5:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    iget-object v0, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$0:Lcom/maars/fmenu/Menu;

    iget-object v1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$1:Lcom/maars/fmenu/PInteger;

    iget v2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$2:I

    iget-object v3, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$3:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$4:Ljava/lang/String;

    iget-object v5, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;->f$5:[Ljava/lang/String;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lcom/maars/fmenu/Menu;->lambda$RadioButton$11$com-maars-fmenu-Menu(Lcom/maars/fmenu/PInteger;ILandroid/widget/TextView;Ljava/lang/String;[Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
