.class public Lcom/google/android/gms/ads/AdLoader;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/AdLoader$Builder;
    }
.end annotation


# instance fields
.field private final zzaax:Lcom/google/android/gms/internal/ads/zztu;

.field private final zzaay:Lcom/google/android/gms/internal/ads/zzuw;

.field private final zzlk:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzuw;)V
    .locals 1

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/ads/zztu;->zzccd:Lcom/google/android/gms/internal/ads/zztu;

    .line 3
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/ads/AdLoader;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzuw;Lcom/google/android/gms/internal/ads/zztu;)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzuw;Lcom/google/android/gms/internal/ads/zztu;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    iput-object p1, p0, Lcom/google/android/gms/ads/AdLoader;->zzlk:Landroid/content/Context;

    .line 7
    iput-object p2, p0, Lcom/google/android/gms/ads/AdLoader;->zzaay:Lcom/google/android/gms/internal/ads/zzuw;

    .line 8
    iput-object p3, p0, Lcom/google/android/gms/ads/AdLoader;->zzaax:Lcom/google/android/gms/internal/ads/zztu;

    return-void
.end method

.method private final zza(Lcom/google/android/gms/internal/ads/zzws;)V
    .locals 2

    .line 10
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/AdLoader;->zzaay:Lcom/google/android/gms/internal/ads/zzuw;

    iget-object v1, p0, Lcom/google/android/gms/ads/AdLoader;->zzlk:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/google/android/gms/internal/ads/zztu;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzws;)Lcom/google/android/gms/internal/ads/zztp;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/ads/zzuw;->zzb(Lcom/google/android/gms/internal/ads/zztp;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "Failed to load ad."

    .line 13
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public loadAd(Lcom/google/android/gms/ads/AdRequest;)V
    .locals 0

    .line 15
    invoke-virtual {p1}, Lcom/google/android/gms/ads/AdRequest;->zzda()Lcom/google/android/gms/internal/ads/zzws;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/android/gms/ads/AdLoader;->zza(Lcom/google/android/gms/internal/ads/zzws;)V

    return-void
.end method
