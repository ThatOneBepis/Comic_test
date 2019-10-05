.class public final Lcom/google/android/gms/ads/AdRequest$Builder;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/AdRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final zzabb:Lcom/google/android/gms/internal/ads/zzwr;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/google/android/gms/internal/ads/zzwr;

    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/zzwr;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    const-string v1, "B3EEABB8EE11C2BE770B684D95219ECB"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ads/zzwr;->zzcb(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/AdRequest$Builder;)Lcom/google/android/gms/internal/ads/zzwr;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    return-object p0
.end method


# virtual methods
.method public final addKeyword(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;
    .locals 1

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzwr;->zzca(Ljava/lang/String;)V

    return-object p0
.end method

.method public final addNetworkExtrasBundle(Ljava/lang/Class;Landroid/os/Bundle;)Lcom/google/android/gms/ads/AdRequest$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/google/android/gms/ads/AdRequest$Builder;"
        }
    .end annotation

    .line 9
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/ads/zzwr;->zza(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 10
    const-class v0, Lcom/google/ads/mediation/admob/AdMobAdapter;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "_emulatorLiveAds"

    .line 11
    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 12
    iget-object p1, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    const-string p2, "B3EEABB8EE11C2BE770B684D95219ECB"

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/ads/zzwr;->zzcc(Ljava/lang/String;)V

    :cond_0
    return-object p0
.end method

.method public final addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzwr;->zzcb(Ljava/lang/String;)V

    return-object p0
.end method

.method public final build()Lcom/google/android/gms/ads/AdRequest;
    .locals 2

    .line 18
    new-instance v0, Lcom/google/android/gms/ads/AdRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/ads/AdRequest;-><init>(Lcom/google/android/gms/ads/AdRequest$Builder;Lcom/google/android/gms/ads/zza;)V

    return-object v0
.end method

.method public final setBirthday(Ljava/util/Date;)Lcom/google/android/gms/ads/AdRequest$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzwr;->zza(Ljava/util/Date;)V

    return-object p0
.end method

.method public final setGender(I)Lcom/google/android/gms/ads/AdRequest$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzwr;->zzch(I)V

    return-object p0
.end method

.method public final setIsDesignedForFamilies(Z)Lcom/google/android/gms/ads/AdRequest$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzwr;->zzt(Z)V

    return-object p0
.end method

.method public final setLocation(Landroid/location/Location;)Lcom/google/android/gms/ads/AdRequest$Builder;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzwr;->zza(Landroid/location/Location;)V

    return-object p0
.end method

.method public final tagForChildDirectedTreatment(Z)Lcom/google/android/gms/ads/AdRequest$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 36
    iget-object v0, p0, Lcom/google/android/gms/ads/AdRequest$Builder;->zzabb:Lcom/google/android/gms/internal/ads/zzwr;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzwr;->zzs(Z)V

    return-object p0
.end method
