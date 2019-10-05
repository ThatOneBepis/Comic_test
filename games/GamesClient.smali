.class public Lcom/google/android/gms/games/GamesClient;
.super Lcom/google/android/gms/internal/games/zzt;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/google/android/gms/games/Games$GamesOptions;)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/games/zzt;-><init>(Landroid/app/Activity;Lcom/google/android/gms/games/Games$GamesOptions;)V

    return-void
.end method


# virtual methods
.method public setGravityForPopups(I)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 5
    new-instance v0, Lcom/google/android/gms/games/zzn;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/games/zzn;-><init>(Lcom/google/android/gms/games/GamesClient;I)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/GamesClient;->doWrite(Lcom/google/android/gms/common/api/internal/TaskApiCall;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public setViewForPopups(Landroid/view/View;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 6
    new-instance v0, Lcom/google/android/gms/games/zzo;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/games/zzo;-><init>(Lcom/google/android/gms/games/GamesClient;Landroid/view/View;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/GamesClient;->doWrite(Lcom/google/android/gms/common/api/internal/TaskApiCall;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
