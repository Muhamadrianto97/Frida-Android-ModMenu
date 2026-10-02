.class public final synthetic Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/LinearLayout;

.field public final synthetic f$1:Landroid/widget/TextView;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda5;->f$0:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda5;->f$1:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda5;->f$0:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda5;->f$1:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Lcom/maars/fmenu/Menu;->lambda$Collapse$4(Landroid/widget/LinearLayout;Landroid/widget/TextView;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
