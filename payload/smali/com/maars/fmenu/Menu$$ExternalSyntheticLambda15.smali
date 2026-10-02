.class public final synthetic Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic f$0:Lcom/maars/fmenu/Menu;

.field public final synthetic f$1:Landroid/graphics/Point;

.field public final synthetic f$2:Landroid/graphics/Point;

.field public final synthetic f$3:Lcom/maars/fmenu/Menu;


# direct methods
.method public synthetic constructor <init>(Lcom/maars/fmenu/Menu;Landroid/graphics/Point;Landroid/graphics/Point;Lcom/maars/fmenu/Menu;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;->f$0:Lcom/maars/fmenu/Menu;

    iput-object p2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;->f$1:Landroid/graphics/Point;

    iput-object p3, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;->f$2:Landroid/graphics/Point;

    iput-object p4, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;->f$3:Lcom/maars/fmenu/Menu;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    iget-object v0, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;->f$0:Lcom/maars/fmenu/Menu;

    iget-object v1, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;->f$1:Landroid/graphics/Point;

    iget-object v2, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;->f$2:Landroid/graphics/Point;

    iget-object v3, p0, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;->f$3:Lcom/maars/fmenu/Menu;

    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/maars/fmenu/Menu;->lambda$onToucheListener$22$com-maars-fmenu-Menu(Landroid/graphics/Point;Landroid/graphics/Point;Lcom/maars/fmenu/Menu;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
