.class final Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zza;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zza"
.end annotation


# instance fields
.field private final zzeiz:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

.field private final zzeja:Lcom/google/android/gms/ads/mediation/MediationInterstitialListener;

.field private final synthetic zzejb:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;Lcom/google/android/gms/ads/mediation/MediationInterstitialListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zza;->zzejb:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zza;->zzeiz:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    .line 3
    iput-object p3, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zza;->zzeja:Lcom/google/android/gms/ads/mediation/MediationInterstitialListener;

    return-void
.end method
