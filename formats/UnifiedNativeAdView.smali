.class public final Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;
.super Landroid/widget/FrameLayout;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# instance fields
.field private final zzbkc:Landroid/widget/FrameLayout;

.field private final zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;


# direct methods
.method private final zza(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 17
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/ObjectWrapper;->wrap(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/ads/zzaaw;->zzc(Ljava/lang/String;Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string p2, "Unable to call setAssetView on delegate"

    .line 20
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private final zzbk(Ljava/lang/String;)Landroid/view/View;
    .locals 1

    .line 57
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzaaw;->zzcj(Ljava/lang/String;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 59
    invoke-static {p1}, Lcom/google/android/gms/dynamic/ObjectWrapper;->unwrap(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string v0, "Unable to call getAssetView on delegate"

    .line 62
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public final addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 100
    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 101
    iget-object p1, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkc:Landroid/widget/FrameLayout;

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->bringChildToFront(Landroid/view/View;)V

    return-void
.end method

.method public final bringChildToFront(Landroid/view/View;)V
    .locals 1

    .line 110
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->bringChildToFront(Landroid/view/View;)V

    .line 111
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkc:Landroid/widget/FrameLayout;

    if-eq v0, p1, :cond_0

    .line 112
    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->bringChildToFront(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 121
    sget-object v0, Lcom/google/android/gms/internal/ads/zzyt;->zzcng:Lcom/google/android/gms/internal/ads/zzyi;

    .line 122
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzuo;->zzoj()Lcom/google/android/gms/internal/ads/zzyp;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/ads/zzyp;->zzd(Lcom/google/android/gms/internal/ads/zzyi;)Ljava/lang/Object;

    move-result-object v0

    .line 123
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    if-eqz v0, :cond_0

    .line 124
    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/dynamic/ObjectWrapper;->wrap(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/ads/zzaaw;->zzj(Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Unable to call handleTouchEvent on delegate"

    .line 127
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 128
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public final getAdChoicesView()Lcom/google/android/gms/ads/formats/AdChoicesView;
    .locals 2

    const-string v0, "3011"

    .line 79
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 80
    instance-of v1, v0, Lcom/google/android/gms/ads/formats/AdChoicesView;

    if-eqz v1, :cond_0

    .line 81
    check-cast v0, Lcom/google/android/gms/ads/formats/AdChoicesView;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getAdvertiserView()Landroid/view/View;
    .locals 1

    const-string v0, "3005"

    .line 70
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getBodyView()Landroid/view/View;
    .locals 1

    const-string v0, "3004"

    .line 67
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getCallToActionView()Landroid/view/View;
    .locals 1

    const-string v0, "3002"

    .line 65
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getHeadlineView()Landroid/view/View;
    .locals 1

    const-string v0, "3001"

    .line 64
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getIconView()Landroid/view/View;
    .locals 1

    const-string v0, "3003"

    .line 66
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getImageView()Landroid/view/View;
    .locals 1

    const-string v0, "3008"

    .line 71
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getMediaView()Lcom/google/android/gms/ads/formats/MediaView;
    .locals 2

    const-string v0, "3010"

    .line 73
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 74
    instance-of v1, v0, Lcom/google/android/gms/ads/formats/MediaView;

    if-eqz v1, :cond_0

    .line 75
    check-cast v0, Lcom/google/android/gms/ads/formats/MediaView;

    return-object v0

    :cond_0
    if-eqz v0, :cond_1

    const-string v0, "View is not an instance of MediaView"

    .line 77
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzawo;->zzdv(Ljava/lang/String;)V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getPriceView()Landroid/view/View;
    .locals 1

    const-string v0, "3007"

    .line 69
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getStarRatingView()Landroid/view/View;
    .locals 1

    const-string v0, "3009"

    .line 72
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getStoreView()Landroid/view/View;
    .locals 1

    const-string v0, "3006"

    .line 68
    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .line 114
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onVisibilityChanged(Landroid/view/View;I)V

    .line 115
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    if-eqz v0, :cond_0

    .line 116
    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/dynamic/ObjectWrapper;->wrap(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/ads/zzaaw;->zzc(Lcom/google/android/gms/dynamic/IObjectWrapper;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string p2, "Unable to call onVisibilityChanged on delegate"

    .line 119
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final removeAllViews()V
    .locals 1

    .line 107
    invoke-super {p0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 108
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkc:Landroid/widget/FrameLayout;

    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public final removeView(Landroid/view/View;)V
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkc:Landroid/widget/FrameLayout;

    if-ne v0, p1, :cond_0

    return-void

    .line 105
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    return-void
.end method

.method public final setAdChoicesView(Lcom/google/android/gms/ads/formats/AdChoicesView;)V
    .locals 1

    const-string v0, "3011"

    .line 50
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public final setAdvertiserView(Landroid/view/View;)V
    .locals 1

    const-string v0, "3005"

    .line 30
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public final setBodyView(Landroid/view/View;)V
    .locals 1

    const-string v0, "3004"

    .line 28
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public final setCallToActionView(Landroid/view/View;)V
    .locals 1

    const-string v0, "3002"

    .line 24
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public final setClickConfirmingView(Landroid/view/View;)V
    .locals 1

    .line 34
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/ObjectWrapper;->wrap(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzaaw;->zzi(Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "Unable to call setClickConfirmingView on delegate"

    .line 37
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final setHeadlineView(Landroid/view/View;)V
    .locals 1

    const-string v0, "3001"

    .line 22
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public final setIconView(Landroid/view/View;)V
    .locals 1

    const-string v0, "3003"

    .line 26
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public final setImageView(Landroid/view/View;)V
    .locals 1

    const-string v0, "3008"

    .line 41
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public final setMediaView(Lcom/google/android/gms/ads/formats/MediaView;)V
    .locals 1

    const-string v0, "3010"

    .line 45
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    if-eqz p1, :cond_0

    .line 47
    new-instance v0, Lcom/google/android/gms/ads/formats/zze;

    invoke-direct {v0, p0}, Lcom/google/android/gms/ads/formats/zze;-><init>(Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/ads/formats/MediaView;->zza(Lcom/google/android/gms/internal/ads/zzaad;)V

    .line 48
    new-instance v0, Lcom/google/android/gms/ads/formats/zzd;

    invoke-direct {v0, p0}, Lcom/google/android/gms/ads/formats/zzd;-><init>(Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/ads/formats/MediaView;->zza(Lcom/google/android/gms/internal/ads/zzaaf;)V

    :cond_0
    return-void
.end method

.method public final setNativeAd(Lcom/google/android/gms/ads/formats/UnifiedNativeAd;)V
    .locals 1

    .line 52
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAd;->zzja()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/dynamic/IObjectWrapper;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzaaw;->zze(Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "Unable to call setNativeAd on delegate"

    .line 55
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final setPriceView(Landroid/view/View;)V
    .locals 1

    const-string v0, "3007"

    .line 39
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public final setStarRatingView(Landroid/view/View;)V
    .locals 1

    const-string v0, "3009"

    .line 43
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public final setStoreView(Landroid/view/View;)V
    .locals 1

    const-string v0, "3006"

    .line 32
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method final synthetic zza(Landroid/widget/ImageView$ScaleType;)V
    .locals 1

    .line 129
    :try_start_0
    instance-of v0, p1, Landroid/widget/ImageView$ScaleType;

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/ObjectWrapper;->wrap(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzaaw;->zzk(Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p1

    const-string v0, "Unable to call setMediaViewImageScaleType on delegate"

    .line 133
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method final synthetic zza(Lcom/google/android/gms/ads/formats/UnifiedNativeAd$MediaContent;)V
    .locals 1

    .line 135
    :try_start_0
    instance-of v0, p1, Lcom/google/android/gms/internal/ads/zzacu;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    check-cast p1, Lcom/google/android/gms/internal/ads/zzacu;

    .line 137
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzacu;->zzqu()Lcom/google/android/gms/internal/ads/zzaan;

    move-result-object p1

    .line 138
    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzaaw;->zza(Lcom/google/android/gms/internal/ads/zzaan;)V

    return-void

    :cond_0
    if-nez p1, :cond_1

    .line 140
    iget-object p1, p0, Lcom/google/android/gms/ads/formats/UnifiedNativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/ads/zzaaw;->zza(Lcom/google/android/gms/internal/ads/zzaan;)V

    return-void

    :cond_1
    const-string p1, "Use MediaContent provided by UnifiedNativeAd.getMediaContent"

    .line 141
    invoke-static {p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzdv(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "Unable to call setMediaContent on delegate"

    .line 144
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
