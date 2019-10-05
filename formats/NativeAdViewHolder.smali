.class public final Lcom/google/android/gms/ads/formats/NativeAdViewHolder;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# static fields
.field public static zzbka:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Lcom/google/android/gms/ads/formats/NativeAdViewHolder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zzbjz:Lcom/google/android/gms/internal/ads/zzaaz;

.field private zzbkb:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/formats/NativeAdViewHolder;->zzbka:Ljava/util/WeakHashMap;

    return-void
.end method

.method private final zze(Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    .locals 2

    .line 27
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdViewHolder;->zzbkb:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    const-string p1, "NativeAdViewHolder.setNativeAd containerView doesn\'t exist, returning"

    .line 29
    invoke-static {p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzeu(Ljava/lang/String;)V

    return-void

    .line 31
    :cond_1
    sget-object v1, Lcom/google/android/gms/ads/formats/NativeAdViewHolder;->zzbka:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 32
    sget-object v1, Lcom/google/android/gms/ads/formats/NativeAdViewHolder;->zzbka:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0, p0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/NativeAdViewHolder;->zzbjz:Lcom/google/android/gms/internal/ads/zzaaz;

    if-eqz v0, :cond_3

    .line 34
    :try_start_0
    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzaaz;->zze(Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "Unable to call setNativeAd on delegate"

    .line 37
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public final setNativeAd(Lcom/google/android/gms/ads/formats/NativeAd;)V
    .locals 0

    .line 23
    invoke-virtual {p1}, Lcom/google/android/gms/ads/formats/NativeAd;->zzja()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/dynamic/IObjectWrapper;

    invoke-direct {p0, p1}, Lcom/google/android/gms/ads/formats/NativeAdViewHolder;->zze(Lcom/google/android/gms/dynamic/IObjectWrapper;)V

    return-void
.end method

.method public final setNativeAd(Lcom/google/android/gms/ads/formats/UnifiedNativeAd;)V
    .locals 0

    .line 25
    invoke-virtual {p1}, Lcom/google/android/gms/ads/formats/UnifiedNativeAd;->zzja()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/dynamic/IObjectWrapper;

    invoke-direct {p0, p1}, Lcom/google/android/gms/ads/formats/NativeAdViewHolder;->zze(Lcom/google/android/gms/dynamic/IObjectWrapper;)V

    return-void
.end method
