.class public Lcom/android/billingclient/api/BillingFlowParams;
.super Ljava/lang/Object;
.source "BillingFlowParams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/billingclient/api/BillingFlowParams$Builder;
    }
.end annotation


# instance fields
.field private mAccountId:Ljava/lang/String;

.field private mOldSku:Ljava/lang/String;

.field private mReplaceSkusProrationMode:I

.field private mSku:Ljava/lang/String;

.field private mSkuType:Ljava/lang/String;

.field private mVrPurchaseFlow:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 56
    iput v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mReplaceSkusProrationMode:I

    return-void
.end method

.method static synthetic access$102(Lcom/android/billingclient/api/BillingFlowParams;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 12
    iput-object p1, p0, Lcom/android/billingclient/api/BillingFlowParams;->mSku:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$202(Lcom/android/billingclient/api/BillingFlowParams;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 12
    iput-object p1, p0, Lcom/android/billingclient/api/BillingFlowParams;->mSkuType:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/android/billingclient/api/BillingFlowParams;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 12
    iput-object p1, p0, Lcom/android/billingclient/api/BillingFlowParams;->mOldSku:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$402(Lcom/android/billingclient/api/BillingFlowParams;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 12
    iput-object p1, p0, Lcom/android/billingclient/api/BillingFlowParams;->mAccountId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$502(Lcom/android/billingclient/api/BillingFlowParams;Z)Z
    .locals 0

    .line 12
    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingFlowParams;->mVrPurchaseFlow:Z

    return p1
.end method

.method static synthetic access$602(Lcom/android/billingclient/api/BillingFlowParams;I)I
    .locals 0

    .line 12
    iput p1, p0, Lcom/android/billingclient/api/BillingFlowParams;->mReplaceSkusProrationMode:I

    return p1
.end method

.method public static newBuilder()Lcom/android/billingclient/api/BillingFlowParams$Builder;
    .locals 2

    .line 114
    new-instance v0, Lcom/android/billingclient/api/BillingFlowParams$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/billingclient/api/BillingFlowParams$Builder;-><init>(Lcom/android/billingclient/api/BillingFlowParams$1;)V

    return-object v0
.end method


# virtual methods
.method public getAccountId()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mAccountId:Ljava/lang/String;

    return-object v0
.end method

.method public getOldSku()Ljava/lang/String;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mOldSku:Ljava/lang/String;

    return-object v0
.end method

.method public getReplaceSkusProrationMode()I
    .locals 1

    .line 101
    iget v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mReplaceSkusProrationMode:I

    return v0
.end method

.method public getSku()Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mSku:Ljava/lang/String;

    return-object v0
.end method

.method public getSkuType()Ljava/lang/String;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mSkuType:Ljava/lang/String;

    return-object v0
.end method

.method public getVrPurchaseFlow()Z
    .locals 1

    .line 95
    iget-boolean v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mVrPurchaseFlow:Z

    return v0
.end method

.method public hasExtraParams()Z
    .locals 1

    .line 106
    iget-boolean v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mVrPurchaseFlow:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mAccountId:Ljava/lang/String;

    if-nez v0, :cond_1

    iget v0, p0, Lcom/android/billingclient/api/BillingFlowParams;->mReplaceSkusProrationMode:I

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
