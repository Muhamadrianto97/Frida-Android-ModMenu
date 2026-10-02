.class public Lcom/maars/fmenu/Menu;
.super Landroid/widget/FrameLayout;
.source "Menu.java"


# instance fields
.field private final config:Lcom/maars/fmenu/Config;

.field private final context:Landroid/content/Context;

.field private curCollapse:Landroid/widget/LinearLayout;

.field private final featureView:Landroid/widget/LinearLayout;

.field private isCollapsed:Z

.field private final launcherIcon:Landroid/widget/ImageView;

.field private final mCollapsed:Landroid/widget/RelativeLayout;

.field private final mExpanded:Landroid/widget/LinearLayout;

.field private final position:Landroid/graphics/Point;

.field private windowManager:Landroid/view/WindowManager;

.field private final wmParams:Landroid/view/WindowManager$LayoutParams;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 68
    new-instance v0, Lcom/maars/fmenu/Config;

    invoke-direct {v0}, Lcom/maars/fmenu/Config;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/maars/fmenu/Menu;-><init>(Landroid/content/Context;Lcom/maars/fmenu/Config;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/maars/fmenu/Config;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "config"    # Lcom/maars/fmenu/Config;

    .line 78
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/maars/fmenu/Menu;->isCollapsed:Z

    .line 81
    iput-object p1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    .line 82
    iput-object p2, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    .line 83
    new-instance v0, Landroid/graphics/Point;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroid/graphics/Point;-><init>(II)V

    iput-object v0, p0, Lcom/maars/fmenu/Menu;->position:Landroid/graphics/Point;

    .line 84
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-direct {v1, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    .line 85
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    .line 86
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/maars/fmenu/Menu;->launcherIcon:Landroid/widget/ImageView;

    .line 87
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/maars/fmenu/Menu;->featureView:Landroid/widget/LinearLayout;

    .line 88
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    iget v5, v0, Landroid/graphics/Point;->x:I

    iget v6, v0, Landroid/graphics/Point;->y:I

    const/4 v7, 0x2

    const v8, 0x2800108

    const/4 v9, -0x2

    move-object v2, v1

    invoke-direct/range {v2 .. v9}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIIIII)V

    iput-object v1, p0, Lcom/maars/fmenu/Menu;->wmParams:Landroid/view/WindowManager$LayoutParams;

    .line 90
    invoke-direct {p0}, Lcom/maars/fmenu/Menu;->Init()V

    .line 91
    return-void
.end method

.method private Button(Ljava/lang/String;)Landroid/widget/Button;
    .locals 3
    .param p1, "text"    # Ljava/lang/String;

    .line 139
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 140
    .local v0, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, 0x7

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 142
    new-instance v1, Landroid/widget/Button;

    iget-object v2, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 143
    .local v1, "btn":Landroid/widget/Button;
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 145
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 146
    iget-object v2, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v2, v2, Lcom/maars/fmenu/Config;->MENU_BUTTON_BG_COLOR:I

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 147
    iget-object v2, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v2, v2, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 148
    iget-object v2, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v2, v2, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setHintTextColor(I)V

    .line 149
    iget-object v2, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v2, v2, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setHighlightColor(I)V

    .line 151
    return-object v1
.end method

.method private Collapse(Ljava/lang/String;)Landroid/widget/LinearLayout;
    .locals 9
    .param p1, "title"    # Ljava/lang/String;

    .line 318
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 319
    .local v0, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, 0x0

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 321
    new-instance v3, Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 322
    .local v3, "collapse":Landroid/widget/LinearLayout;
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 323
    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setVerticalGravity(I)V

    .line 324
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 326
    new-instance v6, Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 327
    .local v6, "collapseSub":Landroid/widget/LinearLayout;
    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->setVerticalGravity(I)V

    .line 328
    invoke-virtual {v6, v1, v2, v1, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 329
    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 330
    iget-object v2, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v2, v2, Lcom/maars/fmenu/Config;->COLLAPSE_BG_COLOR:I

    invoke-virtual {v6, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 331
    const/16 v2, 0x8

    invoke-virtual {v6, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 333
    new-instance v2, Landroid/widget/TextView;

    iget-object v7, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v2, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 334
    .local v2, "textView":Landroid/widget/TextView;
    iget-object v7, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v7, v7, Lcom/maars/fmenu/Config;->MENU_CATEGORY_BG_COLOR:I

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 335
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u25bd "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " \u25bd"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 336
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 337
    iget-object v4, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v4, v4, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 338
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 339
    const/16 v4, 0x14

    invoke-virtual {v2, v1, v4, v1, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 340
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda5;

    invoke-direct {v1, v6, v2, p1}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda5;-><init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 350
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 351
    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 352
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->featureView:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 354
    return-object v6
.end method

.method private Init()V
    .locals 17

    .line 569
    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Lcom/maars/fmenu/Menu;->onToucheListener()Landroid/view/View$OnTouchListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/maars/fmenu/Menu;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 570
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/maars/fmenu/Menu;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 572
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->featureView:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 574
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->wmParams:Landroid/view/WindowManager$LayoutParams;

    const v4, 0x800033

    iput v4, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 575
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->wmParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v4, v0, Lcom/maars/fmenu/Menu;->position:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    iput v4, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 576
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->wmParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v4, v0, Lcom/maars/fmenu/Menu;->position:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->y:I

    iput v4, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 578
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 579
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    iget-object v5, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget v5, v5, Lcom/maars/fmenu/Config;->MENU_COLLAPSED_ALPHA:F

    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 581
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    const/16 v5, 0x8

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 582
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v5, v5, Lcom/maars/fmenu/Config;->MENU_BG_COLOR:I

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 583
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 584
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v6, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget v6, v6, Lcom/maars/fmenu/Config;->MENU_WIDTH:I

    invoke-direct {v0, v6}, Lcom/maars/fmenu/Menu;->dp(I)I

    move-result v6

    invoke-direct {v5, v6, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 586
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->launcherIcon:Landroid/widget/ImageView;

    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 587
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->launcherIcon:Landroid/widget/ImageView;

    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v5, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 588
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget-object v5, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v5, v5, Lcom/maars/fmenu/Config;->MENU_LAUNCHER_ICON_SIZE:I

    int-to-float v5, v5

    invoke-static {v3, v5, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    .line 589
    .local v1, "launcherIconSize":I
    iget-object v5, v0, Lcom/maars/fmenu/Menu;->launcherIcon:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 590
    .local v5, "launcherIconLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    iput v1, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 591
    iput v1, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 592
    iget-object v6, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v6, v6, Lcom/maars/fmenu/Config;->MENU_LAUNCHER_ICON:Ljava/lang/String;

    invoke-static {v6, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v6

    .line 593
    .local v6, "launcherIconDecodedImg":[B
    iget-object v7, v0, Lcom/maars/fmenu/Menu;->launcherIcon:Landroid/widget/ImageView;

    array-length v8, v6

    invoke-static {v6, v4, v8}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 594
    move-object v7, v5

    check-cast v7, Landroid/view/ViewGroup$MarginLayoutParams;

    const/16 v8, 0xa

    invoke-direct {v0, v8}, Lcom/maars/fmenu/Menu;->convertDipToPixels(I)I

    move-result v9

    iput v9, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 595
    iget-object v7, v0, Lcom/maars/fmenu/Menu;->launcherIcon:Landroid/widget/ImageView;

    invoke-direct/range {p0 .. p0}, Lcom/maars/fmenu/Menu;->onToucheListener()Landroid/view/View$OnTouchListener;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 596
    iget-object v7, v0, Lcom/maars/fmenu/Menu;->launcherIcon:Landroid/widget/ImageView;

    new-instance v9, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda18;

    invoke-direct {v9, v0}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda18;-><init>(Lcom/maars/fmenu/Menu;)V

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 598
    new-instance v7, Landroid/widget/RelativeLayout;

    iget-object v9, v0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v7, v9}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 599
    .local v7, "mHeader":Landroid/widget/RelativeLayout;
    const/4 v9, 0x5

    invoke-virtual {v7, v8, v9, v8, v9}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 600
    const/16 v10, 0x10

    invoke-virtual {v7, v10}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 602
    new-instance v10, Landroid/widget/TextView;

    iget-object v11, v0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v10, v11}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 603
    .local v10, "title":Landroid/widget/TextView;
    iget-object v11, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v11, v11, Lcom/maars/fmenu/Config;->TEXT_COLOR_PRIMARY:I

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 604
    const/4 v11, 0x0

    invoke-virtual {v10, v11, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 605
    iget-object v11, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget-object v11, v11, Lcom/maars/fmenu/Config;->MENU_TITLE:Ljava/lang/String;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 606
    const/high16 v11, 0x41900000    # 18.0f

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 607
    const/16 v11, 0x11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 608
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v12, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 609
    .local v12, "titleLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v13, 0xe

    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 610
    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 612
    new-instance v13, Landroid/widget/TextView;

    iget-object v14, v0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v13, v14}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 613
    .local v13, "subtitle":Landroid/widget/TextView;
    iget-object v14, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    invoke-static {v14}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v14, v14, Lcom/maars/fmenu/Config;->MENU_SUBTITLE:Ljava/lang/String;

    invoke-static {v14}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 614
    sget-object v14, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 615
    const/4 v14, -0x1

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    .line 616
    invoke-virtual {v13, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 617
    invoke-virtual {v13, v3}, Landroid/widget/TextView;->setSelected(Z)V

    .line 618
    iget-object v3, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v3, v3, Lcom/maars/fmenu/Config;->TEXT_COLOR_PRIMARY:I

    invoke-virtual {v13, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 619
    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {v13, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 620
    invoke-virtual {v13, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 621
    invoke-virtual {v13, v4, v4, v4, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 623
    new-instance v3, Landroid/widget/ScrollView;

    iget-object v9, v0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v3, v9}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 624
    .local v3, "scrollView":Landroid/widget/ScrollView;
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v15, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    invoke-static {v15}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget v15, v15, Lcom/maars/fmenu/Config;->MENU_HEIGHT:I

    invoke-direct {v0, v15}, Lcom/maars/fmenu/Menu;->dp(I)I

    move-result v15

    invoke-direct {v9, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 625
    .local v9, "scrollViewLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v3, v9}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 626
    iget-object v14, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v14, v14, Lcom/maars/fmenu/Config;->MENU_FEATURE_BG_COLOR:I

    invoke-virtual {v3, v14}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 628
    new-instance v14, Landroid/widget/RelativeLayout;

    iget-object v15, v0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v14, v15}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 629
    .local v14, "mFooter":Landroid/widget/RelativeLayout;
    const/4 v15, 0x3

    invoke-virtual {v14, v8, v15, v8, v15}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 630
    invoke-virtual {v14, v11}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 632
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v8, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 633
    .local v8, "hideBtnLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v11, 0x9

    invoke-virtual {v8, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 635
    new-instance v11, Landroid/widget/Button;

    iget-object v15, v0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v11, v15}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 636
    .local v11, "hideBtn":Landroid/widget/Button;
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget-object v15, v15, Lcom/maars/fmenu/Config;->MENU_HIDE_BUTTON_TEXT:Ljava/lang/String;

    invoke-virtual {v11, v15}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 637
    invoke-virtual {v11, v8}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 638
    invoke-virtual {v11, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 639
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v15, v15, Lcom/maars/fmenu/Config;->TEXT_COLOR_PRIMARY:I

    invoke-virtual {v11, v15}, Landroid/widget/Button;->setTextColor(I)V

    .line 640
    new-instance v15, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda19;

    invoke-direct {v15, v0}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda19;-><init>(Lcom/maars/fmenu/Menu;)V

    invoke-virtual {v11, v15}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 657
    new-instance v15, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda20;

    invoke-direct {v15, v0}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda20;-><init>(Lcom/maars/fmenu/Menu;)V

    invoke-virtual {v11, v15}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 676
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v15, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    move-object v2, v15

    .line 677
    .local v2, "closeBtnLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v15, 0xb

    invoke-virtual {v2, v15}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 678
    new-instance v15, Landroid/widget/Button;

    iget-object v4, v0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v15, v4}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    move-object v4, v15

    .line 679
    .local v4, "closeBtn":Landroid/widget/Button;
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget-object v15, v15, Lcom/maars/fmenu/Config;->MENU_CLOSE_BUTTON_TEXT:Ljava/lang/String;

    invoke-virtual {v4, v15}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 680
    invoke-virtual {v4, v2}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 681
    const/4 v15, 0x0

    invoke-virtual {v4, v15}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 682
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v15, v15, Lcom/maars/fmenu/Config;->TEXT_COLOR_PRIMARY:I

    invoke-virtual {v4, v15}, Landroid/widget/Button;->setTextColor(I)V

    .line 683
    new-instance v15, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda21;

    invoke-direct {v15, v0}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda21;-><init>(Lcom/maars/fmenu/Menu;)V

    invoke-virtual {v4, v15}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 685
    invoke-virtual {v7, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 686
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->featureView:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v15}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 688
    invoke-virtual {v14, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 689
    invoke-virtual {v14, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 691
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    invoke-virtual {v15, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 692
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    invoke-virtual {v15, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 693
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    invoke-virtual {v15, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 694
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    invoke-virtual {v15, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 696
    iget-object v15, v0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    move/from16 v16, v1

    .end local v1    # "launcherIconSize":I
    .local v16, "launcherIconSize":I
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->launcherIcon:Landroid/widget/ImageView;

    invoke-virtual {v15, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 698
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Lcom/maars/fmenu/Menu;->addView(Landroid/view/View;)V

    .line 699
    iget-object v1, v0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lcom/maars/fmenu/Menu;->addView(Landroid/view/View;)V

    .line 700
    return-void
.end method

.method static synthetic access$000(Lcom/maars/fmenu/Menu;)Lcom/maars/fmenu/Config;
    .locals 1
    .param p0, "x0"    # Lcom/maars/fmenu/Menu;

    .line 50
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    return-object v0
.end method

.method private addFeature(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 283
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->curCollapse:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/maars/fmenu/Menu;->featureView:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 284
    :cond_0
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 285
    :goto_0
    return-void
.end method

.method private collapseMenu()V
    .locals 2

    .line 725
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/maars/fmenu/Menu;->isCollapsed:Z

    .line 726
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 727
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x3f333333    # 0.7f

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 728
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 729
    return-void
.end method

.method private convertDipToPixels(I)I
    .locals 2
    .param p1, "i"    # I

    .line 790
    int-to-float v0, p1

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private dp(I)I
    .locals 3
    .param p1, "i"    # I

    .line 786
    int-to-float v0, p1

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v2, v0, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method private expandMenu()V
    .locals 3

    .line 732
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/maars/fmenu/Menu;->isCollapsed:Z

    .line 733
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 734
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 735
    return-void
.end method

.method private hideMenu()V
    .locals 2

    .line 718
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/maars/fmenu/Menu;->isCollapsed:Z

    .line 719
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 720
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->mCollapsed:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 721
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->mExpanded:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 722
    return-void
.end method

.method private killMenu()V
    .locals 1

    .line 738
    invoke-virtual {p0}, Lcom/maars/fmenu/Menu;->removeAllViews()V

    .line 739
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/maars/fmenu/Menu;->setVisibility(I)V

    .line 740
    return-void
.end method

.method static synthetic lambda$Button$2(Lcom/maars/fmenu/PBoolean;Landroid/view/View;)V
    .locals 1
    .param p0, "value"    # Lcom/maars/fmenu/PBoolean;
    .param p1, "view"    # Landroid/view/View;

    .line 133
    invoke-virtual {p0}, Lcom/maars/fmenu/PBoolean;->get()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/maars/fmenu/PBoolean;->set(Z)V

    return-void
.end method

.method static synthetic lambda$ButtonAction$0(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0
    .param p0, "action"    # Ljava/lang/Runnable;
    .param p1, "view"    # Landroid/view/View;

    .line 101
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$CheckBox$13(Lcom/maars/fmenu/PBoolean;Landroid/widget/CompoundButton;Z)V
    .locals 0
    .param p0, "value"    # Lcom/maars/fmenu/PBoolean;
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 562
    invoke-virtual {p0, p2}, Lcom/maars/fmenu/PBoolean;->set(Z)V

    return-void
.end method

.method static synthetic lambda$Collapse$4(Landroid/widget/LinearLayout;Landroid/widget/TextView;Ljava/lang/String;Landroid/view/View;)V
    .locals 2
    .param p0, "collapseSub"    # Landroid/widget/LinearLayout;
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "view"    # Landroid/view/View;

    .line 341
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 342
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u25b3 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u25b3"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 345
    :cond_0
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 346
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u25bd "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u25bd"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    :goto_0
    return-void
.end method

.method static synthetic lambda$Init$16(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 651
    return-void
.end method

.method static synthetic lambda$Init$19(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 668
    return-void
.end method

.method static synthetic lambda$InputNum$6(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 395
    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$InputText$9(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 444
    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$Switch$3(Lcom/maars/fmenu/PBoolean;Landroid/widget/CompoundButton;Z)V
    .locals 0
    .param p0, "value"    # Lcom/maars/fmenu/PBoolean;
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 197
    invoke-virtual {p0, p2}, Lcom/maars/fmenu/PBoolean;->set(Z)V

    return-void
.end method

.method private onToucheListener()Landroid/view/View$OnTouchListener;
    .locals 4

    .line 744
    move-object v0, p0

    .line 745
    .local v0, "menu":Lcom/maars/fmenu/Menu;
    new-instance v1, Landroid/graphics/Point;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 746
    .local v1, "initialTouch":Landroid/graphics/Point;
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, v2, v2}, Landroid/graphics/Point;-><init>(II)V

    move-object v2, v3

    .line 748
    .local v2, "initialPosition":Landroid/graphics/Point;
    new-instance v3, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;

    invoke-direct {v3, p0, v1, v2, v0}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda15;-><init>(Lcom/maars/fmenu/Menu;Landroid/graphics/Point;Landroid/graphics/Point;Lcom/maars/fmenu/Menu;)V

    return-object v3
.end method


# virtual methods
.method public Button(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/maars/fmenu/PBoolean;

    .line 132
    invoke-direct {p0, p1}, Lcom/maars/fmenu/Menu;->Button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 133
    .local v0, "btn":Landroid/widget/Button;
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda1;

    invoke-direct {v1, p2}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda1;-><init>(Lcom/maars/fmenu/PBoolean;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    invoke-direct {p0, v0}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 136
    return-void
.end method

.method public ButtonAction(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/Runnable;

    .line 100
    invoke-direct {p0, p1}, Lcom/maars/fmenu/Menu;->Button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 101
    .local v0, "btn":Landroid/widget/Button;
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda11;

    invoke-direct {v1, p2}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda11;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    invoke-direct {p0, v0}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 104
    return-void
.end method

.method public ButtonLink(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "featName"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .line 542
    invoke-direct {p0, p1}, Lcom/maars/fmenu/Menu;->Button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 543
    .local v0, "btn":Landroid/widget/Button;
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p2}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda7;-><init>(Lcom/maars/fmenu/Menu;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 548
    invoke-direct {p0, v0}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 549
    return-void
.end method

.method public ButtonOnOff(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/maars/fmenu/PBoolean;

    .line 113
    invoke-direct {p0, p1}, Lcom/maars/fmenu/Menu;->Button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 114
    .local v0, "btn":Landroid/widget/Button;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/maars/fmenu/PBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "ON"

    goto :goto_0

    :cond_0
    const-string v2, "OFF"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 115
    invoke-virtual {p2}, Lcom/maars/fmenu/PBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->BTN_ON_BG_COLOR:I

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->BTN_OFF_BG_COLOR:I

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 116
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0, p2, v0, p1}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda14;-><init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PBoolean;Landroid/widget/Button;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    invoke-direct {p0, v0}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 123
    return-void
.end method

.method public Category(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;

    .line 160
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 161
    .local v0, "textView":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->MENU_CATEGORY_BG_COLOR:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 162
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 164
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 165
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 166
    const/4 v1, 0x0

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 168
    invoke-direct {p0, v0}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 169
    return-void
.end method

.method public CheckBox(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V
    .locals 2
    .param p1, "featName"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/maars/fmenu/PBoolean;

    .line 558
    new-instance v0, Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 559
    .local v0, "checkbox":Landroid/widget/CheckBox;
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 560
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 561
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->CHECKBOX_COLOR:I

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 562
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda22;

    invoke-direct {v1, p2}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda22;-><init>(Lcom/maars/fmenu/PBoolean;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 564
    invoke-direct {p0, v0}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 565
    return-void
.end method

.method public InputNum(Ljava/lang/String;Lcom/maars/fmenu/PInteger;)V
    .locals 5
    .param p1, "featName"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/maars/fmenu/PInteger;

    .line 365
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 366
    .local v0, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, 0x7

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 368
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 370
    .local v1, "linearLayout":Landroid/widget/LinearLayout;
    new-instance v2, Landroid/widget/Button;

    iget-object v3, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 371
    .local v2, "button":Landroid/widget/Button;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": <font color=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v4, v4, Lcom/maars/fmenu/Config;->NUMBER_TEXT_COLOR:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</font>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 372
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 373
    invoke-virtual {v2, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 374
    iget-object v3, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v3, v3, Lcom/maars/fmenu/Config;->MENU_BUTTON_BG_COLOR:I

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 375
    iget-object v3, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v3, v3, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 377
    new-instance v3, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p2, v2, p1}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda0;-><init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PInteger;Landroid/widget/Button;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 402
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 404
    invoke-direct {p0, v1}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 405
    return-void
.end method

.method public InputText(Ljava/lang/String;Lcom/maars/fmenu/PString;)V
    .locals 5
    .param p1, "featName"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/maars/fmenu/PString;

    .line 414
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 415
    .local v0, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, 0x7

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 417
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 419
    .local v1, "linearLayout":Landroid/widget/LinearLayout;
    new-instance v2, Landroid/widget/Button;

    iget-object v3, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 420
    .local v2, "button":Landroid/widget/Button;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": <font color=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v4, v4, Lcom/maars/fmenu/Config;->NUMBER_TEXT_COLOR:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/maars/fmenu/PString;->get()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</font>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 421
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 422
    invoke-virtual {v2, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 423
    iget-object v3, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v3, v3, Lcom/maars/fmenu/Config;->MENU_BUTTON_BG_COLOR:I

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 424
    iget-object v3, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v3, v3, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 426
    new-instance v3, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda10;

    invoke-direct {v3, p0, p2, v2, p1}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda10;-><init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PString;Landroid/widget/Button;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 451
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 453
    invoke-direct {p0, v1}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 454
    return-void
.end method

.method public RadioButton(Ljava/lang/String;[Ljava/lang/String;Lcom/maars/fmenu/PInteger;)V
    .locals 12
    .param p1, "featName"    # Ljava/lang/String;
    .param p2, "options"    # [Ljava/lang/String;
    .param p3, "value"    # Lcom/maars/fmenu/PInteger;

    .line 501
    invoke-virtual {p3}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v0

    if-ltz v0, :cond_2

    invoke-virtual {p3}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v0

    array-length v1, p2

    if-ge v0, v1, :cond_2

    .line 504
    array-length v0, p2

    const/4 v1, 0x2

    if-lt v0, v1, :cond_1

    .line 506
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 507
    .local v0, "textView":Landroid/widget/TextView;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": <font color=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v2, v2, Lcom/maars/fmenu/Config;->NUMBER_TEXT_COLOR:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v2

    aget-object v2, p2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</font>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 508
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 510
    new-instance v1, Landroid/widget/RadioGroup;

    iget-object v2, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    .line 511
    .local v1, "radioGroup":Landroid/widget/RadioGroup;
    const/16 v2, 0xa

    const/4 v3, 0x5

    invoke-virtual {v1, v2, v3, v2, v3}, Landroid/widget/RadioGroup;->setPadding(IIII)V

    .line 512
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/RadioGroup;->setOrientation(I)V

    .line 513
    invoke-virtual {v1, v0}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    .line 515
    const/4 v2, 0x0

    move v9, v2

    .local v9, "i":I
    :goto_0
    array-length v2, p2

    if-ge v9, v2, :cond_0

    .line 516
    new-instance v2, Landroid/widget/RadioButton;

    iget-object v3, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    move-object v10, v2

    .line 517
    .local v10, "radioButton":Landroid/widget/RadioButton;
    aget-object v2, p2, v9

    invoke-virtual {v10, v2}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 518
    const v2, -0x333334

    invoke-virtual {v10, v2}, Landroid/widget/RadioButton;->setTextColor(I)V

    .line 519
    iget-object v2, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v2, v2, Lcom/maars/fmenu/Config;->RADIO_BUTTON_COLOR:I

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v10, v2}, Landroid/widget/RadioButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 521
    move v5, v9

    .line 522
    .local v5, "finalI":I
    new-instance v11, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;

    move-object v2, v11

    move-object v3, p0

    move-object v4, p3

    move-object v6, v0

    move-object v7, p1

    move-object v8, p2

    invoke-direct/range {v2 .. v8}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda2;-><init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PInteger;ILandroid/widget/TextView;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 527
    invoke-virtual {v1, v10}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    .line 515
    .end local v5    # "finalI":I
    .end local v10    # "radioButton":Landroid/widget/RadioButton;
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 530
    .end local v9    # "i":I
    :cond_0
    invoke-virtual {p3}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/RadioGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/RadioGroup;->check(I)V

    .line 532
    invoke-direct {p0, v1}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 533
    return-void

    .line 504
    .end local v0    # "textView":Landroid/widget/TextView;
    .end local v1    # "radioGroup":Landroid/widget/RadioGroup;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Options must be at least 2"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 502
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Value must be between 0 and options.length"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;II)V
    .locals 6
    .param p1, "featName"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/maars/fmenu/PInteger;
    .param p3, "min"    # I
    .param p4, "max"    # I

    .line 211
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/maars/fmenu/Menu;->SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;III)V

    .line 212
    return-void
.end method

.method public SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;III)V
    .locals 16
    .param p1, "featName"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/maars/fmenu/PInteger;
    .param p3, "min"    # I
    .param p4, "max"    # I
    .param p5, "step"    # I

    .line 228
    move-object/from16 v7, p0

    move/from16 v8, p3

    move/from16 v9, p4

    move/from16 v10, p5

    invoke-virtual/range {p2 .. p2}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v0

    if-lt v0, v8, :cond_4

    invoke-virtual/range {p2 .. p2}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v0

    if-gt v0, v9, :cond_4

    .line 231
    const/4 v0, 0x1

    if-lt v10, v0, :cond_3

    .line 233
    sub-int v1, v9, v8

    rem-int/2addr v1, v10

    if-nez v1, :cond_2

    .line 236
    if-gt v8, v9, :cond_1

    .line 238
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, v7, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v11, v1

    .line 239
    .local v11, "linearLayout":Landroid/widget/LinearLayout;
    const/4 v1, 0x0

    const/4 v2, 0x5

    invoke-virtual {v11, v1, v2, v1, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 240
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 241
    const/16 v0, 0x11

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 243
    new-instance v0, Landroid/widget/TextView;

    iget-object v2, v7, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object v12, v0

    .line 244
    .local v12, "textView":Landroid/widget/TextView;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v13, p1

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ": <font color=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v7, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v2, v2, Lcom/maars/fmenu/Config;->NUMBER_TEXT_COLOR:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "</font>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 245
    iget-object v0, v7, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v0, v0, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 246
    iget-object v0, v7, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v0, v0, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 247
    iget-object v0, v7, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v0, v0, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 249
    new-instance v0, Landroid/widget/SeekBar;

    iget-object v2, v7, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    move-object v14, v0

    .line 250
    .local v14, "seekBar":Landroid/widget/SeekBar;
    sub-int v0, v9, v8

    div-int/2addr v0, v10

    invoke-virtual {v14, v0}, Landroid/widget/SeekBar;->setMax(I)V

    .line 251
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v0, v2, :cond_0

    invoke-virtual {v14, v1}, Landroid/widget/SeekBar;->setMin(I)V

    .line 253
    :cond_0
    const/16 v0, 0x23

    const/16 v1, 0xa

    invoke-virtual {v14, v0, v1, v0, v1}, Landroid/widget/SeekBar;->setPadding(IIII)V

    .line 254
    invoke-virtual/range {p2 .. p2}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v0

    invoke-virtual {v14, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 255
    invoke-virtual {v14}, Landroid/widget/SeekBar;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, v7, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->SEEKBAR_COLOR:I

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 256
    invoke-virtual {v14}, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, v7, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->SEEKBAR_PROGRESS_COLOR:I

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 257
    new-instance v15, Lcom/maars/fmenu/Menu$1;

    move-object v0, v15

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move/from16 v3, p5

    move/from16 v4, p3

    move-object v5, v12

    move-object/from16 v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/maars/fmenu/Menu$1;-><init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PInteger;IILandroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {v14, v15}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 276
    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 277
    invoke-virtual {v11, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 279
    invoke-direct {v7, v11}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 280
    return-void

    .line 236
    .end local v11    # "linearLayout":Landroid/widget/LinearLayout;
    .end local v12    # "textView":Landroid/widget/TextView;
    .end local v14    # "seekBar":Landroid/widget/SeekBar;
    :cond_1
    move-object/from16 v13, p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Min must be less than max"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 234
    :cond_2
    move-object/from16 v13, p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Step must be a divisor of (max - min)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    :cond_3
    move-object/from16 v13, p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Step must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_4
    move-object/from16 v13, p1

    .line 229
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Value must be between min and max"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public Switch(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V
    .locals 6
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/maars/fmenu/PBoolean;

    .line 179
    new-instance v0, Landroid/content/res/ColorStateList;

    const/4 v1, 0x3

    new-array v1, v1, [[I

    const v2, -0x101009e

    filled-new-array {v2}, [I

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const v2, 0x10100a0

    filled-new-array {v2}, [I

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const/4 v2, 0x2

    new-array v4, v3, [I

    aput-object v4, v1, v2

    const v2, -0xff0100

    const/high16 v4, -0x10000

    const v5, -0xffff01

    filled-new-array {v5, v2, v4}, [I

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 182
    .local v0, "colorStateList":Landroid/content/res/ColorStateList;
    new-instance v1, Landroid/widget/Switch;

    iget-object v2, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 183
    .local v1, "switchView":Landroid/widget/Switch;
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 184
    iget-object v2, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v2, v2, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setTextColor(I)V

    .line 185
    const/16 v2, 0xa

    const/4 v4, 0x5

    invoke-virtual {v1, v2, v4, v3, v4}, Landroid/widget/Switch;->setPadding(IIII)V

    .line 186
    invoke-virtual {p2}, Lcom/maars/fmenu/PBoolean;->get()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 189
    :try_start_0
    invoke-virtual {v1}, Landroid/widget/Switch;->getThumbDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 190
    invoke-virtual {v1}, Landroid/widget/Switch;->getTrackDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    goto :goto_0

    .line 191
    :catch_0
    move-exception v2

    .line 192
    .local v2, "e":Ljava/lang/Exception;
    const v3, 0x7f0800a0

    invoke-virtual {v1, v3}, Landroid/widget/Switch;->setTrackResource(I)V

    .line 193
    const v3, 0x7f0800a1

    invoke-virtual {v1, v3}, Landroid/widget/Switch;->setThumbResource(I)V

    .line 194
    const-string v3, "Switch"

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    new-instance v2, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda6;

    invoke-direct {v2, p2}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda6;-><init>(Lcom/maars/fmenu/PBoolean;)V

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 199
    invoke-direct {p0, v1}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 200
    return-void
.end method

.method public TextView(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;

    .line 465
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 466
    .local v0, "textView":Landroid/widget/TextView;
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 467
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->TEXT_COLOR_SECONDARY:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 468
    const/16 v1, 0xa

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 470
    invoke-direct {p0, v0}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 471
    return-void
.end method

.method public WebTextView(Ljava/lang/String;)V
    .locals 3
    .param p1, "html"    # Ljava/lang/String;

    .line 484
    new-instance v0, Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 485
    .local v0, "webView":Landroid/webkit/WebView;
    const-string v1, "text/html"

    const-string v2, "UTF-8"

    invoke-virtual {v0, p1, v1, v2}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 487
    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/webkit/WebView;->setPadding(IIII)V

    .line 488
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 490
    invoke-direct {p0, v0}, Lcom/maars/fmenu/Menu;->addFeature(Landroid/view/View;)V

    .line 491
    return-void
.end method

.method public attach()V
    .locals 2

    .line 706
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/maars/fmenu/Menu;->windowManager:Landroid/view/WindowManager;

    .line 707
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->wmParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, p0, v1}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 708
    return-void
.end method

.method public detach()V
    .locals 1

    .line 714
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->windowManager:Landroid/view/WindowManager;

    invoke-interface {v0, p0}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 715
    return-void
.end method

.method public endCollapse()V
    .locals 2

    .line 311
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->curCollapse:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 313
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->featureView:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 314
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/maars/fmenu/Menu;->curCollapse:Landroid/widget/LinearLayout;

    .line 315
    return-void

    .line 312
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You must start a collapse before ending it"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method synthetic lambda$ButtonLink$12$com-maars-fmenu-Menu(Ljava/lang/String;Landroid/view/View;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "view"    # Landroid/view/View;

    .line 544
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 545
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 546
    return-void
.end method

.method synthetic lambda$ButtonOnOff$1$com-maars-fmenu-Menu(Lcom/maars/fmenu/PBoolean;Landroid/widget/Button;Ljava/lang/String;Landroid/view/View;)V
    .locals 2
    .param p1, "value"    # Lcom/maars/fmenu/PBoolean;
    .param p2, "btn"    # Landroid/widget/Button;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "view"    # Landroid/view/View;

    .line 117
    invoke-virtual {p1}, Lcom/maars/fmenu/PBoolean;->get()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Lcom/maars/fmenu/PBoolean;->set(Z)V

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/maars/fmenu/PBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "ON"

    goto :goto_0

    :cond_0
    const-string v1, "OFF"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 119
    invoke-virtual {p1}, Lcom/maars/fmenu/PBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v0, v0, Lcom/maars/fmenu/Config;->BTN_ON_BG_COLOR:I

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v0, v0, Lcom/maars/fmenu/Config;->BTN_OFF_BG_COLOR:I

    :goto_1
    invoke-virtual {p2, v0}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 120
    return-void
.end method

.method synthetic lambda$Init$14$com-maars-fmenu-Menu(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 596
    invoke-direct {p0}, Lcom/maars/fmenu/Menu;->expandMenu()V

    return-void
.end method

.method synthetic lambda$Init$15$com-maars-fmenu-Menu(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 645
    invoke-direct {p0}, Lcom/maars/fmenu/Menu;->hideMenu()V

    .line 646
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    const-string v1, "Menu hidden"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 647
    return-void
.end method

.method synthetic lambda$Init$17$com-maars-fmenu-Menu(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 641
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 642
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "Are you sure you want to hide the menu?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 643
    const-string v1, "You can always show it again by clicking on the icon. Remember the hidden icon position."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 644
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda8;-><init>(Lcom/maars/fmenu/Menu;)V

    const-string v2, "Yes"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 649
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda9;

    invoke-direct {v1}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda9;-><init>()V

    const-string v2, "No"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 653
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 654
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 655
    return-void
.end method

.method synthetic lambda$Init$18$com-maars-fmenu-Menu(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 662
    invoke-direct {p0}, Lcom/maars/fmenu/Menu;->killMenu()V

    .line 663
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    const-string v1, "Menu killed"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 664
    return-void
.end method

.method synthetic lambda$Init$20$com-maars-fmenu-Menu(Landroid/view/View;)Z
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 658
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 659
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "Are you sure you want to kill the menu?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 660
    const-string v1, "Killing the menu will remove it from the screen. You can always restart the app to get it back."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 661
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda12;-><init>(Lcom/maars/fmenu/Menu;)V

    const-string v2, "Yes"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 666
    new-instance v1, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda13;

    invoke-direct {v1}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda13;-><init>()V

    const-string v2, "No"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 670
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 671
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 673
    const/4 v2, 0x1

    return v2
.end method

.method synthetic lambda$Init$21$com-maars-fmenu-Menu(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 683
    invoke-direct {p0}, Lcom/maars/fmenu/Menu;->collapseMenu()V

    return-void
.end method

.method synthetic lambda$InputNum$5$com-maars-fmenu-Menu(Lcom/maars/fmenu/PInteger;Landroid/widget/EditText;Landroid/widget/Button;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "value"    # Lcom/maars/fmenu/PInteger;
    .param p2, "input"    # Landroid/widget/EditText;
    .param p3, "button"    # Landroid/widget/Button;
    .param p4, "featName"    # Ljava/lang/String;
    .param p5, "dialog"    # Landroid/content/DialogInterface;
    .param p6, "which"    # I

    .line 388
    :try_start_0
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/maars/fmenu/PInteger;->set(I)V

    .line 389
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": <font color=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->NUMBER_TEXT_COLOR:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</font>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 392
    goto :goto_0

    .line 390
    :catch_0
    move-exception v0

    .line 391
    .local v0, "e":Ljava/lang/NumberFormatException;
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    const-string v2, "Invalid number"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 393
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :goto_0
    return-void
.end method

.method synthetic lambda$InputNum$7$com-maars-fmenu-Menu(Lcom/maars/fmenu/PInteger;Landroid/widget/Button;Ljava/lang/String;Landroid/view/View;)Z
    .locals 9
    .param p1, "value"    # Lcom/maars/fmenu/PInteger;
    .param p2, "button"    # Landroid/widget/Button;
    .param p3, "featName"    # Ljava/lang/String;
    .param p4, "view"    # Landroid/view/View;

    .line 378
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 379
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "Enter a number"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 381
    new-instance v1, Landroid/widget/EditText;

    iget-object v2, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 382
    .local v1, "input":Landroid/widget/EditText;
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 383
    invoke-virtual {p1}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 384
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 386
    new-instance v2, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda3;

    move-object v3, v2

    move-object v4, p0

    move-object v5, p1

    move-object v6, v1

    move-object v7, p2

    move-object v8, p3

    invoke-direct/range {v3 .. v8}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda3;-><init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PInteger;Landroid/widget/EditText;Landroid/widget/Button;Ljava/lang/String;)V

    const-string v3, "OK"

    invoke-virtual {v0, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 395
    new-instance v2, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda4;-><init>()V

    const-string v3, "Cancel"

    invoke-virtual {v0, v3, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 397
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 399
    const/4 v2, 0x1

    return v2
.end method

.method synthetic lambda$InputText$10$com-maars-fmenu-Menu(Lcom/maars/fmenu/PString;Landroid/widget/Button;Ljava/lang/String;Landroid/view/View;)Z
    .locals 10
    .param p1, "value"    # Lcom/maars/fmenu/PString;
    .param p2, "button"    # Landroid/widget/Button;
    .param p3, "featName"    # Ljava/lang/String;
    .param p4, "view"    # Landroid/view/View;

    .line 427
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 428
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "Enter a text"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 430
    new-instance v1, Landroid/widget/EditText;

    iget-object v2, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 431
    .local v1, "input":Landroid/widget/EditText;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 432
    invoke-virtual {p1}, Lcom/maars/fmenu/PString;->get()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 433
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 435
    new-instance v9, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;

    move-object v3, v9

    move-object v4, p0

    move-object v5, p1

    move-object v6, v1

    move-object v7, p2

    move-object v8, p3

    invoke-direct/range {v3 .. v8}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda16;-><init>(Lcom/maars/fmenu/Menu;Lcom/maars/fmenu/PString;Landroid/widget/EditText;Landroid/widget/Button;Ljava/lang/String;)V

    const-string v3, "OK"

    invoke-virtual {v0, v3, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 444
    new-instance v3, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda17;

    invoke-direct {v3}, Lcom/maars/fmenu/Menu$$ExternalSyntheticLambda17;-><init>()V

    const-string v4, "Cancel"

    invoke-virtual {v0, v4, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 446
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 448
    return v2
.end method

.method synthetic lambda$InputText$8$com-maars-fmenu-Menu(Lcom/maars/fmenu/PString;Landroid/widget/EditText;Landroid/widget/Button;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "value"    # Lcom/maars/fmenu/PString;
    .param p2, "input"    # Landroid/widget/EditText;
    .param p3, "button"    # Landroid/widget/Button;
    .param p4, "featName"    # Ljava/lang/String;
    .param p5, "dialog"    # Landroid/content/DialogInterface;
    .param p6, "which"    # I

    .line 437
    :try_start_0
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/maars/fmenu/PString;->set(Ljava/lang/String;)V

    .line 438
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": <font color=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->NUMBER_TEXT_COLOR:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/maars/fmenu/PString;->get()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</font>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 441
    goto :goto_0

    .line 439
    :catch_0
    move-exception v0

    .line 440
    .local v0, "e":Ljava/lang/NumberFormatException;
    iget-object v1, p0, Lcom/maars/fmenu/Menu;->context:Landroid/content/Context;

    const-string v2, "Invalid number"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 442
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :goto_0
    return-void
.end method

.method synthetic lambda$RadioButton$11$com-maars-fmenu-Menu(Lcom/maars/fmenu/PInteger;ILandroid/widget/TextView;Ljava/lang/String;[Ljava/lang/String;Landroid/view/View;)V
    .locals 2
    .param p1, "value"    # Lcom/maars/fmenu/PInteger;
    .param p2, "finalI"    # I
    .param p3, "textView"    # Landroid/widget/TextView;
    .param p4, "featName"    # Ljava/lang/String;
    .param p5, "options"    # [Ljava/lang/String;
    .param p6, "view"    # Landroid/view/View;

    .line 523
    invoke-virtual {p1, p2}, Lcom/maars/fmenu/PInteger;->set(I)V

    .line 524
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": <font color=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/maars/fmenu/Menu;->config:Lcom/maars/fmenu/Config;

    iget v1, v1, Lcom/maars/fmenu/Config;->NUMBER_TEXT_COLOR:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/maars/fmenu/PInteger;->get()I

    move-result v1

    aget-object v1, p5, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</font>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 525
    return-void
.end method

.method synthetic lambda$onToucheListener$22$com-maars-fmenu-Menu(Landroid/graphics/Point;Landroid/graphics/Point;Lcom/maars/fmenu/Menu;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "initialTouch"    # Landroid/graphics/Point;
    .param p2, "initialPosition"    # Landroid/graphics/Point;
    .param p3, "menu"    # Lcom/maars/fmenu/Menu;
    .param p4, "view"    # Landroid/view/View;
    .param p5, "event"    # Landroid/view/MotionEvent;

    .line 749
    invoke-virtual {p5}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 778
    const/4 v0, 0x0

    return v0

    .line 757
    :pswitch_0
    const/high16 v0, 0x3f000000    # 0.5f

    invoke-virtual {p0, v0}, Lcom/maars/fmenu/Menu;->setAlpha(F)V

    .line 759
    iget v0, p2, Landroid/graphics/Point;->x:I

    invoke-virtual {p5}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    iget v2, p1, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    add-int/2addr v0, v1

    .line 760
    .local v0, "x":I
    iget v1, p2, Landroid/graphics/Point;->y:I

    invoke-virtual {p5}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    iget v3, p1, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    add-int/2addr v1, v2

    .line 761
    .local v1, "y":I
    iget-object v2, p0, Lcom/maars/fmenu/Menu;->position:Landroid/graphics/Point;

    iput v0, v2, Landroid/graphics/Point;->x:I

    .line 762
    iget-object v2, p0, Lcom/maars/fmenu/Menu;->position:Landroid/graphics/Point;

    iput v1, v2, Landroid/graphics/Point;->y:I

    .line 763
    invoke-virtual {p3}, Lcom/maars/fmenu/Menu;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    .line 764
    .local v2, "params":Landroid/view/WindowManager$LayoutParams;
    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 765
    iput v1, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 766
    iget-object v3, p0, Lcom/maars/fmenu/Menu;->windowManager:Landroid/view/WindowManager;

    invoke-interface {v3, p3, v2}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 767
    goto :goto_0

    .line 769
    .end local v0    # "x":I
    .end local v1    # "y":I
    .end local v2    # "params":Landroid/view/WindowManager$LayoutParams;
    :pswitch_1
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/maars/fmenu/Menu;->setAlpha(F)V

    .line 771
    invoke-virtual {p5}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v1, p1, Landroid/graphics/Point;->x:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    float-to-int v0, v0

    .line 772
    .local v0, "rawX":I
    invoke-virtual {p5}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget v2, p1, Landroid/graphics/Point;->y:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    .line 774
    .local v1, "rawY":I
    const/4 v2, 0x5

    if-ge v0, v2, :cond_0

    if-ge v1, v2, :cond_0

    iget-boolean v2, p0, Lcom/maars/fmenu/Menu;->isCollapsed:Z

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/maars/fmenu/Menu;->expandMenu()V

    goto :goto_0

    .line 751
    .end local v0    # "rawX":I
    .end local v1    # "rawY":I
    :pswitch_2
    invoke-virtual {p5}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Point;->x:I

    .line 752
    invoke-virtual {p5}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Point;->y:I

    .line 753
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->position:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    iput v0, p2, Landroid/graphics/Point;->x:I

    .line 754
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->position:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    iput v0, p2, Landroid/graphics/Point;->y:I

    .line 755
    nop

    .line 781
    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public startCollapse(Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;

    .line 300
    iget-object v0, p0, Lcom/maars/fmenu/Menu;->curCollapse:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    .line 302
    invoke-direct {p0, p1}, Lcom/maars/fmenu/Menu;->Collapse(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Lcom/maars/fmenu/Menu;->curCollapse:Landroid/widget/LinearLayout;

    .line 303
    return-void

    .line 301
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You must end the previous collapse before starting a new one"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
