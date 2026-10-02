.class public Lcom/maars/fmenu/PBoolean;
.super Ljava/lang/Object;
.source "PBoolean.java"


# instance fields
.field private value:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .param p1, "value"    # Z

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-boolean p1, p0, Lcom/maars/fmenu/PBoolean;->value:Z

    .line 12
    return-void
.end method

.method public static of(Z)Lcom/maars/fmenu/PBoolean;
    .locals 1
    .param p0, "value"    # Z

    .line 23
    new-instance v0, Lcom/maars/fmenu/PBoolean;

    invoke-direct {v0, p0}, Lcom/maars/fmenu/PBoolean;-><init>(Z)V

    return-object v0
.end method


# virtual methods
.method public get()Z
    .locals 1

    .line 15
    iget-boolean v0, p0, Lcom/maars/fmenu/PBoolean;->value:Z

    return v0
.end method

.method public set(Z)V
    .locals 0
    .param p1, "value"    # Z

    .line 19
    iput-boolean p1, p0, Lcom/maars/fmenu/PBoolean;->value:Z

    .line 20
    return-void
.end method
