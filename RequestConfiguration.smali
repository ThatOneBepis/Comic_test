.class public Lcom/google/android/gms/ads/RequestConfiguration;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/RequestConfiguration$Builder;
    }
.end annotation


# static fields
.field public static final zzabm:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final zzabj:I

.field private final zzabk:I

.field private final zzabl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x4

    .line 17
    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "MA"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "T"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "PG"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "G"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 18
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/ads/RequestConfiguration;->zzabm:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/ads/RequestConfiguration;->zzabj:I

    .line 3
    iput p2, p0, Lcom/google/android/gms/ads/RequestConfiguration;->zzabk:I

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/ads/RequestConfiguration;->zzabl:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(IILjava/lang/String;Lcom/google/android/gms/ads/zzc;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/ads/RequestConfiguration;-><init>(IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getMaxAdContentRating()Ljava/lang/String;
    .locals 1

    .line 8
    iget-object v0, p0, Lcom/google/android/gms/ads/RequestConfiguration;->zzabl:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    return-object v0
.end method

.method public getTagForChildDirectedTreatment()I
    .locals 1

    .line 6
    iget v0, p0, Lcom/google/android/gms/ads/RequestConfiguration;->zzabj:I

    return v0
.end method

.method public getTagForUnderAgeOfConsent()I
    .locals 1

    .line 7
    iget v0, p0, Lcom/google/android/gms/ads/RequestConfiguration;->zzabk:I

    return v0
.end method
