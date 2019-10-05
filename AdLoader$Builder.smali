.class public Lcom/google/android/gms/ads/AdLoader$Builder;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/AdLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final zzaba:Lcom/google/android/gms/internal/ads/zzux;

.field private final zzlk:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzux;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzlk:Landroid/content/Context;

    .line 9
    iput-object p2, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzaba:Lcom/google/android/gms/internal/ads/zzux;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    const-string v0, "context cannot be null"

    .line 2
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzuo;->zzog()Lcom/google/android/gms/internal/ads/zzuc;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/ads/zzaje;

    invoke-direct {v2}, Lcom/google/android/gms/internal/ads/zzaje;-><init>()V

    .line 4
    invoke-virtual {v1, p1, p2, v2}, Lcom/google/android/gms/internal/ads/zzuc;->zzb(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzajd;)Lcom/google/android/gms/internal/ads/zzux;

    move-result-object p1

    .line 5
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/ads/AdLoader$Builder;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzux;)V

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/gms/ads/AdLoader;
    .locals 3

    .line 59
    :try_start_0
    new-instance v0, Lcom/google/android/gms/ads/AdLoader;

    iget-object v1, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzlk:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzaba:Lcom/google/android/gms/internal/ads/zzux;

    invoke-interface {v2}, Lcom/google/android/gms/internal/ads/zzux;->zzon()Lcom/google/android/gms/internal/ads/zzuw;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/AdLoader;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzuw;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "Failed to build AdLoader."

    .line 61
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/ads/zzawo;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public forAppInstallAd(Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;)Lcom/google/android/gms/ads/AdLoader$Builder;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 16
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzaba:Lcom/google/android/gms/internal/ads/zzux;

    new-instance v1, Lcom/google/android/gms/internal/ads/zzacv;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/ads/zzacv;-><init>(Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/ads/zzux;->zza(Lcom/google/android/gms/internal/ads/zzabs;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Failed to add app install ad listener"

    .line 19
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object p0
.end method

.method public forContentAd(Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;)Lcom/google/android/gms/ads/AdLoader$Builder;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 11
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzaba:Lcom/google/android/gms/internal/ads/zzux;

    new-instance v1, Lcom/google/android/gms/internal/ads/zzacy;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/ads/zzacy;-><init>(Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/ads/zzux;->zza(Lcom/google/android/gms/internal/ads/zzabt;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Failed to add content ad listener"

    .line 14
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object p0
.end method

.method public forCustomTemplateAd(Ljava/lang/String;Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomTemplateAdLoadedListener;Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomClickListener;)Lcom/google/android/gms/ads/AdLoader$Builder;
    .locals 2

    .line 26
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzaba:Lcom/google/android/gms/internal/ads/zzux;

    new-instance v1, Lcom/google/android/gms/internal/ads/zzada;

    invoke-direct {v1, p2}, Lcom/google/android/gms/internal/ads/zzada;-><init>(Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomTemplateAdLoadedListener;)V

    if-nez p3, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 29
    :cond_0
    new-instance p2, Lcom/google/android/gms/internal/ads/zzacx;

    invoke-direct {p2, p3}, Lcom/google/android/gms/internal/ads/zzacx;-><init>(Lcom/google/android/gms/ads/formats/NativeCustomTemplateAd$OnCustomClickListener;)V

    .line 30
    :goto_0
    invoke-interface {v0, p1, v1, p2}, Lcom/google/android/gms/internal/ads/zzux;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzabz;Lcom/google/android/gms/internal/ads/zzaby;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "Failed to add custom template ad listener"

    .line 33
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-object p0
.end method

.method public forUnifiedNativeAd(Lcom/google/android/gms/ads/formats/UnifiedNativeAd$OnUnifiedNativeAdLoadedListener;)Lcom/google/android/gms/ads/AdLoader$Builder;
    .locals 2

    .line 21
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzaba:Lcom/google/android/gms/internal/ads/zzux;

    new-instance v1, Lcom/google/android/gms/internal/ads/zzadb;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/ads/zzadb;-><init>(Lcom/google/android/gms/ads/formats/UnifiedNativeAd$OnUnifiedNativeAdLoadedListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/ads/zzux;->zza(Lcom/google/android/gms/internal/ads/zzacf;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Failed to add google native ad listener"

    .line 24
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object p0
.end method

.method public withAdListener(Lcom/google/android/gms/ads/AdListener;)Lcom/google/android/gms/ads/AdLoader$Builder;
    .locals 2

    .line 43
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzaba:Lcom/google/android/gms/internal/ads/zzux;

    new-instance v1, Lcom/google/android/gms/internal/ads/zztl;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/ads/zztl;-><init>(Lcom/google/android/gms/ads/AdListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/ads/zzux;->zzb(Lcom/google/android/gms/internal/ads/zzur;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Failed to set AdListener."

    .line 46
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object p0
.end method

.method public withNativeAdOptions(Lcom/google/android/gms/ads/formats/NativeAdOptions;)Lcom/google/android/gms/ads/AdLoader$Builder;
    .locals 2

    .line 48
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/AdLoader$Builder;->zzaba:Lcom/google/android/gms/internal/ads/zzux;

    new-instance v1, Lcom/google/android/gms/internal/ads/zzaai;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/ads/zzaai;-><init>(Lcom/google/android/gms/ads/formats/NativeAdOptions;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/ads/zzux;->zza(Lcom/google/android/gms/internal/ads/zzaai;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Failed to specify native ad options"

    .line 51
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/ads/zzawo;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object p0
.end method
