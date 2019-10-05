.class public Lcom/google/android/gms/ads/mediation/rtb/RtbSignalData;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# instance fields
.field private final zzcbu:Landroid/os/Bundle;

.field private final zzdg:Lcom/google/android/gms/ads/AdSize;

.field private final zzejf:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/ads/mediation/MediationConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field private final zzlk:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Landroid/os/Bundle;Lcom/google/android/gms/ads/AdSize;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/ads/mediation/MediationConfiguration;",
            ">;",
            "Landroid/os/Bundle;",
            "Lcom/google/android/gms/ads/AdSize;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/rtb/RtbSignalData;->zzlk:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/ads/mediation/rtb/RtbSignalData;->zzejf:Ljava/util/List;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/ads/mediation/rtb/RtbSignalData;->zzcbu:Landroid/os/Bundle;

    .line 5
    iput-object p4, p0, Lcom/google/android/gms/ads/mediation/rtb/RtbSignalData;->zzdg:Lcom/google/android/gms/ads/AdSize;

    return-void
.end method
