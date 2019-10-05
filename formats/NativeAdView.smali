.class public Lcom/google/android/gms/ads/formats/NativeAdView;
.super Landroid/widget/FrameLayout;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final zzbkc:Landroid/widget/FrameLayout;

.field private final zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 57
    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 58
    iget-object p1, p0, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbkc:Landroid/widget/FrameLayout;

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->bringChildToFront(Landroid/view/View;)V

    return-void
.end method

.method public bringChildToFront(Landroid/view/View;)V
    .locals 1

    .line 67
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->bringChildToFront(Landroid/view/View;)V

    .line 68
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbkc:Landroid/widget/FrameLayout;

    if-eq v0, p1, :cond_0

    .line 69
    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->bringChildToFront(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 78
    sget-object v0, Lcom/google/android/gms/internal/ads/zzyt;->zzcng:Lcom/google/android/gms/internal/ads/zzyi;

    .line 79
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzuo;->zzoj()Lcom/google/android/gms/internal/ads/zzyp;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/ads/zzyp;->zzd(Lcom/google/android/gms/internal/ads/zzyi;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    if-eqz v0, :cond_0

    .line 81
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

    .line 84
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public getAdChoicesView()Lcom/google/android/gms/ads/formats/AdChoicesView;
    .locals 2

    const-string v0, "1098"

    .line 19
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbk(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 20
    instance-of v1, v0, Lcom/google/android/gms/ads/formats/AdChoicesView;

    if-eqz v1, :cond_0

    .line 21
    check-cast v0, Lcom/google/android/gms/ads/formats/AdChoicesView;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .line 71
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onVisibilityChanged(Landroid/view/View;I)V

    .line 72
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    if-eqz v0, :cond_0

    .line 73
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

    .line 76
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public removeAllViews()V
    .locals 1

    .line 64
    invoke-super {p0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 65
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbkc:Landroid/widget/FrameLayout;

    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbkc:Landroid/widget/FrameLayout;

    if-ne v0, p1, :cond_0

    return-void

    .line 62
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    return-void
.end method

.method public setAdChoicesView(Lcom/google/android/gms/ads/formats/AdChoicesView;)V
    .locals 1

    const-string v0, "1098"

    .line 17
    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/ads/formats/NativeAdView;->zza(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public setNativeAd(Lcom/google/android/gms/ads/formats/NativeAd;)V
    .locals 1

    .line 35
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/formats/NativeAd;->zzja()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/dynamic/IObjectWrapper;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzaaw;->zze(Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "Unable to call setNativeAd on delegate"

    .line 38
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method protected final zza(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 23
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/ObjectWrapper;->wrap(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/ads/zzaaw;->zzc(Ljava/lang/String;Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string p2, "Unable to call setAssetView on delegate"

    .line 26
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method protected final zzbk(Ljava/lang/String;)Landroid/view/View;
    .locals 1

    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdView;->zzbkd:Lcom/google/android/gms/internal/ads/zzaaw;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzaaw;->zzcj(Ljava/lang/String;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 30
    invoke-static {p1}, Lcom/google/android/gms/dynamic/ObjectWrapper;->unwrap(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string v0, "Unable to call getAssetView on delegate"

    .line 33
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
