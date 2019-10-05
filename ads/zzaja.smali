.class final synthetic Lcom/google/android/gms/internal/ads/zzaja;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"

# interfaces
.implements Lcom/google/android/gms/internal/ads/zzawq;


# static fields
.field static final zzbtn:Lcom/google/android/gms/internal/ads/zzawq;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/ads/zzaja;

    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/zzaja;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/ads/zzaja;->zzbtn:Lcom/google/android/gms/internal/ads/zzawq;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Landroid/os/IBinder;

    invoke-static {p1}, Lcom/google/android/gms/internal/ads/zzbdm;->zzam(Landroid/os/IBinder;)Lcom/google/android/gms/internal/ads/zzbdn;

    move-result-object p1

    return-object p1
.end method
