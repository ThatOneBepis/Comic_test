.class public final Lcom/google/android/gms/common/internal/service/Common;
.super Ljava/lang/Object;


# static fields
.field public static final API:Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final CLIENT_KEY:Lcom/google/android/gms/common/api/Api$ClientKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$ClientKey<",
            "Lcom/google/android/gms/common/internal/service/zai;",
            ">;"
        }
    .end annotation
.end field

.field private static final zaph:Lcom/google/android/gms/common/api/Api$AbstractClientBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$AbstractClientBuilder<",
            "Lcom/google/android/gms/common/internal/service/zai;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final zapi:Lcom/google/android/gms/common/internal/service/zac;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 2
    new-instance v0, Lcom/google/android/gms/common/api/Api$ClientKey;

    invoke-direct {v0}, Lcom/google/android/gms/common/api/Api$ClientKey;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/internal/service/Common;->CLIENT_KEY:Lcom/google/android/gms/common/api/Api$ClientKey;

    .line 3
    new-instance v0, Lcom/google/android/gms/common/internal/service/zab;

    invoke-direct {v0}, Lcom/google/android/gms/common/internal/service/zab;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/internal/service/Common;->zaph:Lcom/google/android/gms/common/api/Api$AbstractClientBuilder;

    .line 4
    new-instance v0, Lcom/google/android/gms/common/api/Api;

    const-string v1, "Common.API"

    sget-object v2, Lcom/google/android/gms/common/internal/service/Common;->zaph:Lcom/google/android/gms/common/api/Api$AbstractClientBuilder;

    sget-object v3, Lcom/google/android/gms/common/internal/service/Common;->CLIENT_KEY:Lcom/google/android/gms/common/api/Api$ClientKey;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/api/Api;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/api/Api$AbstractClientBuilder;Lcom/google/android/gms/common/api/Api$ClientKey;)V

    sput-object v0, Lcom/google/android/gms/common/internal/service/Common;->API:Lcom/google/android/gms/common/api/Api;

    .line 5
    new-instance v0, Lcom/google/android/gms/common/internal/service/zad;

    invoke-direct {v0}, Lcom/google/android/gms/common/internal/service/zad;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/internal/service/Common;->zapi:Lcom/google/android/gms/common/internal/service/zac;

    return-void
.end method
