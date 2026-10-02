.class public Lcom/maars/fmenu/PInteger;
.super Ljava/lang/Object;
.source "PInteger.java"


# instance fields
.field private value:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "value"    # I

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput p1, p0, Lcom/maars/fmenu/PInteger;->value:I

    .line 12
    return-void
.end method

.method public static of(I)Lcom/maars/fmenu/PInteger;
    .locals 1
    .param p0, "value"    # I

    .line 23
    new-instance v0, Lcom/maars/fmenu/PInteger;

    invoke-direct {v0, p0}, Lcom/maars/fmenu/PInteger;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public get()I
    .locals 1

    .line 15
    iget v0, p0, Lcom/maars/fmenu/PInteger;->value:I

    return v0
.end method

.method public set(I)V
    .locals 0
    .param p1, "value"    # I

    .line 19
    iput p1, p0, Lcom/maars/fmenu/PInteger;->value:I

    .line 20
    return-void
.end method
