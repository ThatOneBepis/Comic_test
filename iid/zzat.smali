.class final Lcom/google/firebase/iid/zzat;
.super Lcom/google/android/gms/internal/firebase_messaging/zze;


# instance fields
.field private final synthetic zzcw:Lcom/google/firebase/iid/zzau;


# direct methods
.method constructor <init>(Lcom/google/firebase/iid/zzau;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/firebase/iid/zzat;->zzcw:Lcom/google/firebase/iid/zzau;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/firebase_messaging/zze;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 2
    iget-object v0, p0, Lcom/google/firebase/iid/zzat;->zzcw:Lcom/google/firebase/iid/zzau;

    invoke-static {v0, p1}, Lcom/google/firebase/iid/zzau;->zza(Lcom/google/firebase/iid/zzau;Landroid/os/Message;)V

    return-void
.end method
