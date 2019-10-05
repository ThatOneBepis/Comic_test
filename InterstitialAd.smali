.class public final Lcom/google/android/gms/ads/InterstitialAd;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# instance fields
.field private final zzabg:Lcom/google/android/gms/internal/ads/zzww;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/google/android/gms/internal/ads/zzww;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ads/zzww;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    const-string v0, "Context cannot be null"

    .line 3
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final getAdMetadata()Landroid/os/Bundle;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzww;->getAdMetadata()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public final loadAd(Lcom/google/android/gms/ads/AdRequest;)V
    .locals 1

    .line 9
    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/AdRequest;->zzda()Lcom/google/android/gms/internal/ads/zzws;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzww;->zza(Lcom/google/android/gms/internal/ads/zzws;)V

    return-void
.end method

.method public final setAdListener(Lcom/google/android/gms/ads/AdListener;)V
    .locals 1

    .line 11
    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzww;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    if-eqz p1, :cond_0

    .line 12
    instance-of v0, p1, Lcom/google/android/gms/internal/ads/zzth;

    if-eqz v0, :cond_0

    .line 13
    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    check-cast p1, Lcom/google/android/gms/internal/ads/zzth;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzww;->zza(Lcom/google/android/gms/internal/ads/zzth;)V

    return-void

    :cond_0
    if-nez p1, :cond_1

    .line 15
    iget-object p1, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/ads/zzww;->zza(Lcom/google/android/gms/internal/ads/zzth;)V

    :cond_1
    return-void
.end method

.method public final setAdMetadataListener(Lcom/google/android/gms/ads/reward/AdMetadataListener;)V
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzww;->setAdMetadataListener(Lcom/google/android/gms/ads/reward/AdMetadataListener;)V

    return-void
.end method

.method public final setAdUnitId(Ljava/lang/String;)V
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzww;->setAdUnitId(Ljava/lang/String;)V

    return-void
.end method

.method public final setImmersiveMode(Z)V
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzww;->setImmersiveMode(Z)V

    return-void
.end method

.method public final setRewardedVideoAdListener(Lcom/google/android/gms/ads/reward/RewardedVideoAdListener;)V
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzww;->setRewardedVideoAdListener(Lcom/google/android/gms/ads/reward/RewardedVideoAdListener;)V

    return-void
.end method

.method public final show()V
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzww;->show()V

    return-void
.end method

.method public final zzc(Z)V
    .locals 1

    .line 27
    iget-object p1, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzabg:Lcom/google/android/gms/internal/ads/zzww;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/ads/zzww;->zzc(Z)V

    return-void
.end method
