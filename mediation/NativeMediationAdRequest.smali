.class public interface abstract Lcom/google/android/gms/ads/mediation/NativeMediationAdRequest;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/MediationAdRequest;


# virtual methods
.method public abstract getNativeAdOptions()Lcom/google/android/gms/ads/formats/NativeAdOptions;
.end method

.method public abstract isAppInstallAdRequested()Z
.end method

.method public abstract isContentAdRequested()Z
.end method

.method public abstract isUnifiedNativeAdRequested()Z
.end method

.method public abstract zzrz()Z
.end method

.method public abstract zzsa()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end method
