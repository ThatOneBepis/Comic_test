.class public Lcom/google/android/gms/ads/mediation/MediationConfiguration;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# instance fields
.field private final zzehx:Landroid/os/Bundle;

.field private final zzeib:Lcom/google/android/gms/ads/AdFormat;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/AdFormat;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/MediationConfiguration;->zzeib:Lcom/google/android/gms/ads/AdFormat;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/ads/mediation/MediationConfiguration;->zzehx:Landroid/os/Bundle;

    return-void
.end method
