.class public Lcom/google/android/gms/games/internal/zze;
.super Lcom/google/android/gms/common/internal/GmsClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/games/internal/zze$zzat;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/GmsClient<",
        "Lcom/google/android/gms/games/internal/zzbu;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzgo:Lcom/google/android/gms/internal/games/zzej;

.field private final zzgp:Ljava/lang/String;

.field private zzgq:Lcom/google/android/gms/games/PlayerEntity;

.field private zzgr:Lcom/google/android/gms/games/GameEntity;

.field private final zzgs:Lcom/google/android/gms/games/internal/zzby;

.field private zzgt:Z

.field private final zzgu:Landroid/os/Binder;

.field private final zzgv:J

.field private zzgw:Z

.field private final zzgx:Lcom/google/android/gms/games/Games$GamesOptions;

.field private zzgy:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/ClientSettings;Lcom/google/android/gms/games/Games$GamesOptions;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 7

    const/4 v3, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p5

    move-object v6, p6

    .line 1
    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/common/internal/GmsClient;-><init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/internal/ClientSettings;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    .line 2
    new-instance p2, Lcom/google/android/gms/games/internal/zzf;

    invoke-direct {p2, p0}, Lcom/google/android/gms/games/internal/zzf;-><init>(Lcom/google/android/gms/games/internal/zze;)V

    iput-object p2, p0, Lcom/google/android/gms/games/internal/zze;->zzgo:Lcom/google/android/gms/internal/games/zzej;

    const/4 p2, 0x0

    .line 3
    iput-boolean p2, p0, Lcom/google/android/gms/games/internal/zze;->zzgt:Z

    .line 4
    iput-boolean p2, p0, Lcom/google/android/gms/games/internal/zze;->zzgw:Z

    .line 5
    invoke-virtual {p3}, Lcom/google/android/gms/common/internal/ClientSettings;->getRealClientPackageName()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/games/internal/zze;->zzgp:Ljava/lang/String;

    .line 6
    new-instance p2, Landroid/os/Binder;

    invoke-direct {p2}, Landroid/os/Binder;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/games/internal/zze;->zzgu:Landroid/os/Binder;

    .line 7
    invoke-virtual {p3}, Lcom/google/android/gms/common/internal/ClientSettings;->getGravityForPopups()I

    move-result p2

    invoke-static {p0, p2}, Lcom/google/android/gms/games/internal/zzby;->zza(Lcom/google/android/gms/games/internal/zze;I)Lcom/google/android/gms/games/internal/zzby;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/games/internal/zze;->zzgs:Lcom/google/android/gms/games/internal/zzby;

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p2

    int-to-long p5, p2

    iput-wide p5, p0, Lcom/google/android/gms/games/internal/zze;->zzgv:J

    .line 9
    iput-object p4, p0, Lcom/google/android/gms/games/internal/zze;->zzgx:Lcom/google/android/gms/games/Games$GamesOptions;

    .line 10
    iget-object p2, p0, Lcom/google/android/gms/games/internal/zze;->zzgx:Lcom/google/android/gms/games/Games$GamesOptions;

    iget-boolean p2, p2, Lcom/google/android/gms/games/Games$GamesOptions;->zzaz:Z

    if-nez p2, :cond_1

    .line 11
    invoke-virtual {p3}, Lcom/google/android/gms/common/internal/ClientSettings;->getViewForPopups()Landroid/view/View;

    move-result-object p2

    if-nez p2, :cond_0

    instance-of p1, p1, Landroid/app/Activity;

    if-eqz p1, :cond_1

    .line 12
    :cond_0
    invoke-virtual {p3}, Lcom/google/android/gms/common/internal/ClientSettings;->getViewForPopups()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/games/internal/zze;->zza(Landroid/view/View;)V

    :cond_1
    return-void
.end method

.method private static zza(Landroid/os/RemoteException;)V
    .locals 2

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    .line 734
    invoke-static {v0, v1, p0}, Lcom/google/android/gms/games/internal/zzbd;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private static zza(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;Ljava/lang/SecurityException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder<",
            "TR;>;",
            "Ljava/lang/SecurityException;",
            ")V"
        }
    .end annotation

    if-eqz p0, :cond_0

    const/4 p1, 0x4

    .line 740
    invoke-static {p1}, Lcom/google/android/gms/games/GamesClientStatusCodes;->zza(I)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    .line 741
    invoke-interface {p0, p1}, Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;->setFailedResult(Lcom/google/android/gms/common/api/Status;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public connect(Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;)V
    .locals 1

    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgq:Lcom/google/android/gms/games/PlayerEntity;

    .line 34
    iput-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgr:Lcom/google/android/gms/games/GameEntity;

    .line 35
    invoke-super {p0, p1}, Lcom/google/android/gms/common/internal/GmsClient;->connect(Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;)V

    return-void
.end method

.method protected synthetic createServiceInterface(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const-string v0, "com.google.android.gms.games.internal.IGamesService"

    .line 785
    invoke-interface {p1, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 786
    instance-of v1, v0, Lcom/google/android/gms/games/internal/zzbu;

    if-eqz v1, :cond_1

    .line 787
    check-cast v0, Lcom/google/android/gms/games/internal/zzbu;

    return-object v0

    .line 788
    :cond_1
    new-instance v0, Lcom/google/android/gms/games/internal/zzbv;

    invoke-direct {v0, p1}, Lcom/google/android/gms/games/internal/zzbv;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public disconnect()V
    .locals 3

    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgt:Z

    .line 38
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/internal/zzbu;

    .line 40
    invoke-interface {v0}, Lcom/google/android/gms/games/internal/zzbu;->zzci()V

    .line 41
    iget-object v1, p0, Lcom/google/android/gms/games/internal/zze;->zzgo:Lcom/google/android/gms/internal/games/zzej;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/games/zzej;->flush()V

    .line 42
    iget-wide v1, p0, Lcom/google/android/gms/games/internal/zze;->zzgv:J

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/games/internal/zzbu;->zza(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v0, "GamesClientImpl"

    const-string v1, "Failed to notify client disconnect."

    .line 45
    invoke-static {v0, v1}, Lcom/google/android/gms/games/internal/zzbd;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    :cond_0
    :goto_0
    invoke-super {p0}, Lcom/google/android/gms/common/internal/GmsClient;->disconnect()V

    return-void
.end method

.method public getConnectionHint()Landroid/os/Bundle;
    .locals 2

    .line 50
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/internal/zzbu;

    invoke-interface {v0}, Lcom/google/android/gms/games/internal/zzbu;->getConnectionHint()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 52
    const-class v1, Lcom/google/android/gms/games/internal/zze;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 53
    iput-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgy:Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object v0

    :catch_0
    move-exception v0

    .line 55
    invoke-static {v0}, Lcom/google/android/gms/games/internal/zze;->zza(Landroid/os/RemoteException;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getGetServiceRequestExtraArgs()Landroid/os/Bundle;
    .locals 4

    .line 62
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    .line 63
    iget-object v1, p0, Lcom/google/android/gms/games/internal/zze;->zzgx:Lcom/google/android/gms/games/Games$GamesOptions;

    invoke-virtual {v1}, Lcom/google/android/gms/games/Games$GamesOptions;->zzg()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "com.google.android.gms.games.key.gamePackageName"

    .line 64
    iget-object v3, p0, Lcom/google/android/gms/games/internal/zze;->zzgp:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "com.google.android.gms.games.key.desiredLocale"

    .line 65
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "com.google.android.gms.games.key.popupWindowToken"

    .line 66
    new-instance v2, Lcom/google/android/gms/common/internal/BinderWrapper;

    iget-object v3, p0, Lcom/google/android/gms/games/internal/zze;->zzgs:Lcom/google/android/gms/games/internal/zzby;

    .line 67
    invoke-virtual {v3}, Lcom/google/android/gms/games/internal/zzby;->zzcp()Landroid/os/IBinder;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/gms/common/internal/BinderWrapper;-><init>(Landroid/os/IBinder;)V

    .line 68
    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "com.google.android.gms.games.key.API_VERSION"

    const/4 v2, 0x6

    .line 69
    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "com.google.android.gms.games.key.signInOptions"

    .line 71
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->getClientSettings()Lcom/google/android/gms/common/internal/ClientSettings;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/signin/internal/SignInClientImpl;->createBundleFromClientSettings(Lcom/google/android/gms/common/internal/ClientSettings;)Landroid/os/Bundle;

    move-result-object v2

    .line 72
    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    return-object v1
.end method

.method public getMinApkVersion()I
    .locals 1

    const v0, 0xbdfcb8

    return v0
.end method

.method protected getServiceDescriptor()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.games.internal.IGamesService"

    return-object v0
.end method

.method protected getStartServiceAction()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.games.service.START"

    return-object v0
.end method

.method public synthetic onConnectedLocked(Landroid/os/IInterface;)V
    .locals 4

    .line 765
    check-cast p1, Lcom/google/android/gms/games/internal/zzbu;

    .line 766
    invoke-super {p0, p1}, Lcom/google/android/gms/common/internal/GmsClient;->onConnectedLocked(Landroid/os/IInterface;)V

    .line 767
    iget-boolean v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgt:Z

    if-eqz v0, :cond_0

    .line 768
    iget-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgs:Lcom/google/android/gms/games/internal/zzby;

    invoke-virtual {v0}, Lcom/google/android/gms/games/internal/zzby;->zzcr()V

    const/4 v0, 0x0

    .line 769
    iput-boolean v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgt:Z

    .line 770
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgx:Lcom/google/android/gms/games/Games$GamesOptions;

    iget-boolean v0, v0, Lcom/google/android/gms/games/Games$GamesOptions;->zzar:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgx:Lcom/google/android/gms/games/Games$GamesOptions;

    iget-boolean v0, v0, Lcom/google/android/gms/games/Games$GamesOptions;->zzaz:Z

    if-nez v0, :cond_1

    .line 772
    :try_start_0
    new-instance v0, Lcom/google/android/gms/games/internal/zzbw;

    iget-object v1, p0, Lcom/google/android/gms/games/internal/zze;->zzgs:Lcom/google/android/gms/games/internal/zzby;

    .line 773
    invoke-virtual {v1}, Lcom/google/android/gms/games/internal/zzby;->zzcq()Lcom/google/android/gms/games/internal/zzca;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/games/internal/zzbw;-><init>(Lcom/google/android/gms/games/internal/zzca;)V

    .line 775
    new-instance v1, Lcom/google/android/gms/games/internal/zzp;

    invoke-direct {v1, v0}, Lcom/google/android/gms/games/internal/zzp;-><init>(Lcom/google/android/gms/games/internal/zzbw;)V

    .line 776
    iget-wide v2, p0, Lcom/google/android/gms/games/internal/zze;->zzgv:J

    .line 777
    invoke-interface {p1, v1, v2, v3}, Lcom/google/android/gms/games/internal/zzbu;->zza(Lcom/google/android/gms/games/internal/zzbs;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 779
    invoke-static {p1}, Lcom/google/android/gms/games/internal/zze;->zza(Landroid/os/RemoteException;)V

    :cond_1
    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0

    .line 15
    invoke-super {p0, p1}, Lcom/google/android/gms/common/internal/GmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/google/android/gms/games/internal/zze;->zzgt:Z

    return-void
.end method

.method protected onPostInitHandler(ILandroid/os/IBinder;Landroid/os/Bundle;I)V
    .locals 1

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    .line 752
    const-class v0, Lcom/google/android/gms/games/internal/zze;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    const-string v0, "show_welcome_popup"

    .line 753
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgt:Z

    .line 754
    iget-boolean v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgt:Z

    iput-boolean v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgw:Z

    const-string v0, "com.google.android.gms.games.current_player"

    .line 755
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/PlayerEntity;

    iput-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgq:Lcom/google/android/gms/games/PlayerEntity;

    const-string v0, "com.google.android.gms.games.current_game"

    .line 756
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/GameEntity;

    iput-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgr:Lcom/google/android/gms/games/GameEntity;

    .line 757
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/google/android/gms/common/internal/GmsClient;->onPostInitHandler(ILandroid/os/IBinder;Landroid/os/Bundle;I)V

    return-void
.end method

.method public onUserSignOut(Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;)V
    .locals 1

    .line 345
    :try_start_0
    new-instance v0, Lcom/google/android/gms/games/internal/zzad;

    invoke-direct {v0, p1}, Lcom/google/android/gms/games/internal/zzad;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;)V

    .line 346
    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/zze;->zzb(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 349
    :catch_0
    invoke-interface {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;->onSignOutComplete()V

    return-void
.end method

.method public requiresSignIn()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected validateScopes(Ljava/util/Set;)Ljava/util/Set;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;)",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    .line 22
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 23
    sget-object v1, Lcom/google/android/gms/games/Games;->SCOPE_GAMES:Lcom/google/android/gms/common/api/Scope;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    .line 24
    sget-object v2, Lcom/google/android/gms/games/Games;->SCOPE_GAMES_LITE:Lcom/google/android/gms/common/api/Scope;

    invoke-interface {p1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    .line 25
    sget-object v3, Lcom/google/android/gms/games/Games;->zzam:Lcom/google/android/gms/common/api/Scope;

    invoke-interface {p1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz p1, :cond_0

    xor-int/lit8 p1, v1, 0x1

    const-string v1, "Cannot have both %s and %s!"

    const/4 v2, 0x2

    .line 27
    new-array v2, v2, [Ljava/lang/Object;

    const-string v5, "https://www.googleapis.com/auth/games"

    aput-object v5, v2, v3

    const-string v3, "https://www.googleapis.com/auth/games.firstparty"

    aput-object v3, v2, v4

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    :cond_0
    if-nez v1, :cond_2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    :goto_1
    const-string v5, "Games APIs requires %s function."

    .line 28
    new-array v4, v4, [Ljava/lang/Object;

    const-string v6, "https://www.googleapis.com/auth/games_lite"

    aput-object v6, v4, v3

    invoke-static {p1, v5, v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    if-eqz v2, :cond_3

    if-eqz v1, :cond_3

    .line 30
    sget-object p1, Lcom/google/android/gms/games/Games;->SCOPE_GAMES_LITE:Lcom/google/android/gms/common/api/Scope;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_3
    :goto_2
    return-object v0
.end method

.method final zza(Landroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 1

    .line 724
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 725
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/internal/zzbu;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/games/internal/zzbu;->zza(Landroid/os/IBinder;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 727
    invoke-static {p1}, Lcom/google/android/gms/games/internal/zze;->zza(Landroid/os/RemoteException;)V

    :cond_0
    return-void
.end method

.method public final zza(Landroid/view/View;)V
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgs:Lcom/google/android/gms/games/internal/zzby;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/games/internal/zzby;->zzb(Landroid/view/View;)V

    return-void
.end method

.method public final zzb(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 351
    iget-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgo:Lcom/google/android/gms/internal/games/zzej;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/games/zzej;->flush()V

    .line 352
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/internal/zzbu;

    .line 353
    new-instance v1, Lcom/google/android/gms/games/internal/zzg;

    invoke-direct {v1, p1}, Lcom/google/android/gms/games/internal/zzg;-><init>(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)V

    .line 354
    invoke-interface {v0, v1}, Lcom/google/android/gms/games/internal/zzbu;->zza(Lcom/google/android/gms/games/internal/zzbq;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 357
    invoke-static {p1, v0}, Lcom/google/android/gms/games/internal/zze;->zza(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;Ljava/lang/SecurityException;)V

    return-void
.end method

.method final zzci()V
    .locals 1

    .line 729
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 730
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/zze;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/internal/zzbu;

    invoke-interface {v0}, Lcom/google/android/gms/games/internal/zzbu;->zzci()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 732
    invoke-static {v0}, Lcom/google/android/gms/games/internal/zze;->zza(Landroid/os/RemoteException;)V

    :cond_0
    return-void
.end method

.method public final zzk(I)V
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/google/android/gms/games/internal/zze;->zzgs:Lcom/google/android/gms/games/internal/zzby;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/games/internal/zzby;->setGravity(I)V

    return-void
.end method
