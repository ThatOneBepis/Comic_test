.class public Lcom/google/android/gms/ads/formats/MediaView;
.super Landroid/widget/FrameLayout;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# instance fields
.field private zzbjm:Lcom/google/android/gms/ads/formats/UnifiedNativeAd$MediaContent;

.field private zzbjn:Z

.field private zzbjo:Lcom/google/android/gms/internal/ads/zzaad;

.field private zzbjp:Landroid/widget/ImageView$ScaleType;

.field private zzbjq:Z

.field private zzbjr:Lcom/google/android/gms/internal/ads/zzaaf;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public setImageScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 1

    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjq:Z

    .line 19
    iput-object p1, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjp:Landroid/widget/ImageView$ScaleType;

    .line 20
    iget-object p1, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjr:Lcom/google/android/gms/internal/ads/zzaaf;

    if-eqz p1, :cond_0

    .line 21
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjp:Landroid/widget/ImageView$ScaleType;

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/ads/zzaaf;->setImageScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_0
    return-void
.end method

.method public setMediaContent(Lcom/google/android/gms/ads/formats/UnifiedNativeAd$MediaContent;)V
    .locals 1

    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjn:Z

    .line 10
    iput-object p1, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjm:Lcom/google/android/gms/ads/formats/UnifiedNativeAd$MediaContent;

    .line 11
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjo:Lcom/google/android/gms/internal/ads/zzaad;

    if-eqz v0, :cond_0

    .line 12
    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzaad;->setMediaContent(Lcom/google/android/gms/ads/formats/UnifiedNativeAd$MediaContent;)V

    :cond_0
    return-void
.end method

.method protected final declared-synchronized zza(Lcom/google/android/gms/internal/ads/zzaad;)V
    .locals 1

    monitor-enter p0

    .line 14
    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjo:Lcom/google/android/gms/internal/ads/zzaad;

    .line 15
    iget-boolean v0, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjn:Z

    if-eqz v0, :cond_0

    .line 16
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjm:Lcom/google/android/gms/ads/formats/UnifiedNativeAd$MediaContent;

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/ads/zzaad;->setMediaContent(Lcom/google/android/gms/ads/formats/UnifiedNativeAd$MediaContent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected final declared-synchronized zza(Lcom/google/android/gms/internal/ads/zzaaf;)V
    .locals 1

    monitor-enter p0

    .line 23
    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjr:Lcom/google/android/gms/internal/ads/zzaaf;

    .line 24
    iget-boolean v0, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjq:Z

    if-eqz v0, :cond_0

    .line 25
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/MediaView;->zzbjp:Landroid/widget/ImageView$ScaleType;

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/ads/zzaaf;->setImageScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
