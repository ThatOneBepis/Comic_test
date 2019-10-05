.class public Lcom/google/android/gms/ads/RequestConfiguration$Builder;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/RequestConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private zzabj:I

.field private zzabk:I

.field private zzabl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/google/android/gms/ads/RequestConfiguration$Builder;->zzabj:I

    .line 3
    iput v0, p0, Lcom/google/android/gms/ads/RequestConfiguration$Builder;->zzabk:I

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/google/android/gms/ads/RequestConfiguration$Builder;->zzabl:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/gms/ads/RequestConfiguration;
    .locals 5

    .line 5
    new-instance v0, Lcom/google/android/gms/ads/RequestConfiguration;

    iget v1, p0, Lcom/google/android/gms/ads/RequestConfiguration$Builder;->zzabj:I

    iget v2, p0, Lcom/google/android/gms/ads/RequestConfiguration$Builder;->zzabk:I

    iget-object v3, p0, Lcom/google/android/gms/ads/RequestConfiguration$Builder;->zzabl:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/gms/ads/RequestConfiguration;-><init>(IILjava/lang/String;Lcom/google/android/gms/ads/zzc;)V

    return-object v0
.end method
