.class final Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzb;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/customevent/CustomEventBannerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "zzb"
.end annotation


# instance fields
.field private final zzeiz:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

.field private final zzejc:Lcom/google/android/gms/ads/mediation/MediationBannerListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;Lcom/google/android/gms/ads/mediation/MediationBannerListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzb;->zzeiz:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzb;->zzejc:Lcom/google/android/gms/ads/mediation/MediationBannerListener;

    return-void
.end method
