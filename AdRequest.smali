.class public final Lcom/google/android/gms/ads/AdRequest;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/AdRequest$Builder;
    }
.end annotation


# instance fields
.field private final zzaaz:Lcom/google/android/gms/internal/ads/zzws;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/ads/AdRequest$Builder;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/google/android/gms/internal/ads/zzws;

    invoke-static {p1}, Lcom/google/android/gms/ads/AdRequest$Builder;->zza(Lcom/google/android/gms/ads/AdRequest$Builder;)Lcom/google/android/gms/internal/ads/zzwr;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ads/zzws;-><init>(Lcom/google/android/gms/internal/ads/zzwr;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/AdRequest;->zzaaz:Lcom/google/android/gms/internal/ads/zzws;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/ads/AdRequest$Builder;Lcom/google/android/gms/ads/zza;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/android/gms/ads/AdRequest;-><init>(Lcom/google/android/gms/ads/AdRequest$Builder;)V

    return-void
.end method


# virtual methods
.method public final zzda()Lcom/google/android/gms/internal/ads/zzws;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest;->zzaaz:Lcom/google/android/gms/internal/ads/zzws;

    return-object v0
.end method
