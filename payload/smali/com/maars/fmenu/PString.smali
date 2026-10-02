.class public Lcom/maars/fmenu/PString;
.super Ljava/lang/Object;
.source "PString.java"


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/maars/fmenu/PString;->value:Ljava/lang/String;

    .line 11
    return-void
.end method

.method public static of(Ljava/lang/String;)Lcom/maars/fmenu/PString;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .line 22
    new-instance v0, Lcom/maars/fmenu/PString;

    invoke-direct {v0, p0}, Lcom/maars/fmenu/PString;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public get()Ljava/lang/String;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/maars/fmenu/PString;->value:Ljava/lang/String;

    return-object v0
.end method

.method public set(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 18
    iput-object p1, p0, Lcom/maars/fmenu/PString;->value:Ljava/lang/String;

    .line 19
    return-void
.end method
