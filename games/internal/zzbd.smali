.class public final Lcom/google/android/gms/games/internal/zzbd;
.super Ljava/lang/Object;


# static fields
.field private static final zzjd:Lcom/google/android/gms/common/internal/GmsLogger;

.field private static final zzje:Lcom/google/android/gms/common/config/GservicesValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/config/GservicesValue<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 11
    new-instance v0, Lcom/google/android/gms/common/internal/GmsLogger;

    const-string v1, "Games"

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/internal/GmsLogger;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/games/internal/zzbd;->zzjd:Lcom/google/android/gms/common/internal/GmsLogger;

    const-string v0, "games.play_games_dogfood"

    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Lcom/google/android/gms/common/config/GservicesValue;->value(Ljava/lang/String;Z)Lcom/google/android/gms/common/config/GservicesValue;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/games/internal/zzbd;->zzje:Lcom/google/android/gms/common/config/GservicesValue;

    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 7
    sget-object v0, Lcom/google/android/gms/games/internal/zzbd;->zzjd:Lcom/google/android/gms/common/internal/GmsLogger;

    invoke-virtual {v0, p0, p1}, Lcom/google/android/gms/common/internal/GmsLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 3
    sget-object v0, Lcom/google/android/gms/games/internal/zzbd;->zzjd:Lcom/google/android/gms/common/internal/GmsLogger;

    invoke-virtual {v0, p0, p1}, Lcom/google/android/gms/common/internal/GmsLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 5
    sget-object v0, Lcom/google/android/gms/games/internal/zzbd;->zzjd:Lcom/google/android/gms/common/internal/GmsLogger;

    invoke-virtual {v0, p0, p1, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
