.class final Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/customevent/CustomEventNativeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zzc"
.end annotation


# instance fields
.field private final zzeiz:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

.field private final zzejd:Lcom/google/android/gms/ads/mediation/MediationNativeListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;Lcom/google/android/gms/ads/mediation/MediationNativeListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzeiz:Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/ads/mediation/customevent/CustomEventAdapter$zzc;->zzejd:Lcom/google/android/gms/ads/mediation/MediationNativeListener;

    return-void
.end method
