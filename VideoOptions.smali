.class public final Lcom/google/android/gms/ads/VideoOptions;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# instance fields
.field private final zzabp:Z

.field private final zzabq:Z

.field private final zzabr:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzyc;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iget-boolean v0, p1, Lcom/google/android/gms/internal/ads/zzyc;->zzabp:Z

    iput-boolean v0, p0, Lcom/google/android/gms/ads/VideoOptions;->zzabp:Z

    .line 3
    iget-boolean v0, p1, Lcom/google/android/gms/internal/ads/zzyc;->zzabq:Z

    iput-boolean v0, p0, Lcom/google/android/gms/ads/VideoOptions;->zzabq:Z

    .line 4
    iget-boolean p1, p1, Lcom/google/android/gms/internal/ads/zzyc;->zzabr:Z

    iput-boolean p1, p0, Lcom/google/android/gms/ads/VideoOptions;->zzabr:Z

    return-void
.end method


# virtual methods
.method public final getClickToExpandRequested()Z
    .locals 1

    .line 13
    iget-boolean v0, p0, Lcom/google/android/gms/ads/VideoOptions;->zzabr:Z

    return v0
.end method

.method public final getCustomControlsRequested()Z
    .locals 1

    .line 12
    iget-boolean v0, p0, Lcom/google/android/gms/ads/VideoOptions;->zzabq:Z

    return v0
.end method

.method public final getStartMuted()Z
    .locals 1

    .line 11
    iget-boolean v0, p0, Lcom/google/android/gms/ads/VideoOptions;->zzabp:Z

    return v0
.end method
