.class public Lcom/google/android/gms/ads/MobileAds;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# direct methods
.method public static getRewardedVideoAdInstance(Landroid/content/Context;)Lcom/google/android/gms/ads/reward/RewardedVideoAd;
    .locals 1

    .line 13
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzwv;->zzpd()Lcom/google/android/gms/internal/ads/zzwv;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/ads/zzwv;->getRewardedVideoAdInstance(Landroid/content/Context;)Lcom/google/android/gms/ads/reward/RewardedVideoAd;

    move-result-object p0

    return-object p0
.end method
