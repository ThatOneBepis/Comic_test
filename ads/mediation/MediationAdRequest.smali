.class public Lcom/google/ads/mediation/MediationAdRequest;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final zznc:Ljava/util/Date;

.field private final zznd:Lcom/google/ads/AdRequest$Gender;

.field private final zzne:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zznf:Z

.field private final zzng:Landroid/location/Location;


# direct methods
.method public constructor <init>(Ljava/util/Date;Lcom/google/ads/AdRequest$Gender;Ljava/util/Set;ZLandroid/location/Location;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Date;",
            "Lcom/google/ads/AdRequest$Gender;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;Z",
            "Landroid/location/Location;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/ads/mediation/MediationAdRequest;->zznc:Ljava/util/Date;

    .line 3
    iput-object p2, p0, Lcom/google/ads/mediation/MediationAdRequest;->zznd:Lcom/google/ads/AdRequest$Gender;

    .line 4
    iput-object p3, p0, Lcom/google/ads/mediation/MediationAdRequest;->zzne:Ljava/util/Set;

    .line 5
    iput-boolean p4, p0, Lcom/google/ads/mediation/MediationAdRequest;->zznf:Z

    .line 6
    iput-object p5, p0, Lcom/google/ads/mediation/MediationAdRequest;->zzng:Landroid/location/Location;

    return-void
.end method
