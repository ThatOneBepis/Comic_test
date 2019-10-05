.class public final Lcom/google/android/gms/games/internal/zzbv;
.super Lcom/google/android/gms/internal/games/zza;

# interfaces
.implements Lcom/google/android/gms/games/internal/zzbu;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .locals 1

    const-string v0, "com.google.android.gms.games.internal.IGamesService"

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/games/zza;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final getConnectionHint()Landroid/os/Bundle;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 16
    invoke-virtual {p0}, Lcom/google/android/gms/internal/games/zza;->zza()Landroid/os/Parcel;

    move-result-object v0

    const/16 v1, 0x138c

    .line 17
    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/games/zza;->zza(ILandroid/os/Parcel;)Landroid/os/Parcel;

    move-result-object v0

    .line 18
    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/games/zzc;->zza(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    .line 19
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return-object v1
.end method

.method public final zza(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/games/zza;->zza()Landroid/os/Parcel;

    move-result-object v0

    .line 4
    invoke-virtual {v0, p1, p2}, Landroid/os/Parcel;->writeLong(J)V

    const/16 p1, 0x1389

    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/games/zza;->zzb(ILandroid/os/Parcel;)V

    return-void
.end method

.method public final zza(Landroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 21
    invoke-virtual {p0}, Lcom/google/android/gms/internal/games/zza;->zza()Landroid/os/Parcel;

    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 23
    invoke-static {v0, p2}, Lcom/google/android/gms/internal/games/zzc;->zza(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    const/16 p1, 0x138d

    .line 24
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/games/zza;->zzb(ILandroid/os/Parcel;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/games/internal/zzbq;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/games/zza;->zza()Landroid/os/Parcel;

    move-result-object v0

    .line 8
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/games/zzc;->zza(Landroid/os/Parcel;Landroid/os/IInterface;)V

    const/16 p1, 0x138a

    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/games/zza;->zzb(ILandroid/os/Parcel;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/games/internal/zzbs;J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 541
    invoke-virtual {p0}, Lcom/google/android/gms/internal/games/zza;->zza()Landroid/os/Parcel;

    move-result-object v0

    .line 542
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/games/zzc;->zza(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 543
    invoke-virtual {v0, p2, p3}, Landroid/os/Parcel;->writeLong(J)V

    const/16 p1, 0x3c8d

    .line 544
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/games/zza;->zzb(ILandroid/os/Parcel;)V

    return-void
.end method

.method public final zzci()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 26
    invoke-virtual {p0}, Lcom/google/android/gms/internal/games/zza;->zza()Landroid/os/Parcel;

    move-result-object v0

    const/16 v1, 0x138e

    .line 27
    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/games/zza;->zzb(ILandroid/os/Parcel;)V

    return-void
.end method
