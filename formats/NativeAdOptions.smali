.class public final Lcom/google/android/gms/ads/formats/NativeAdOptions;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;
    }
.end annotation


# instance fields
.field private final zzbjs:Z

.field private final zzbjt:I

.field private final zzbju:I

.field private final zzbjv:Z

.field private final zzbjw:I

.field private final zzbjx:Lcom/google/android/gms/ads/VideoOptions;

.field private final zzbjy:Z


# direct methods
.method private constructor <init>(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->zza(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjs:Z

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->zzb(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjt:I

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->zzc(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbju:I

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->zzd(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjv:Z

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->zze(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjw:I

    .line 7
    invoke-static {p1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->zzf(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;)Lcom/google/android/gms/ads/VideoOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjx:Lcom/google/android/gms/ads/VideoOptions;

    .line 8
    invoke-static {p1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->zzg(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjy:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;Lcom/google/android/gms/ads/formats/zza;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/google/android/gms/ads/formats/NativeAdOptions;-><init>(Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;)V

    return-void
.end method


# virtual methods
.method public final getAdChoicesPlacement()I
    .locals 1

    .line 14
    iget v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjw:I

    return v0
.end method

.method public final getImageOrientation()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 11
    iget v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjt:I

    return v0
.end method

.method public final getMediaAspectRatio()I
    .locals 1

    .line 12
    iget v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbju:I

    return v0
.end method

.method public final getVideoOptions()Lcom/google/android/gms/ads/VideoOptions;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjx:Lcom/google/android/gms/ads/VideoOptions;

    return-object v0
.end method

.method public final shouldRequestMultipleImages()Z
    .locals 1

    .line 13
    iget-boolean v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjv:Z

    return v0
.end method

.method public final shouldReturnUrlsForImageAssets()Z
    .locals 1

    .line 10
    iget-boolean v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjs:Z

    return v0
.end method

.method public final zzjb()Z
    .locals 1

    .line 16
    iget-boolean v0, p0, Lcom/google/android/gms/ads/formats/NativeAdOptions;->zzbjy:Z

    return v0
.end method
