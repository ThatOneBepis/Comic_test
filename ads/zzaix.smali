.class final synthetic Lcom/google/android/gms/internal/ads/zzaix;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final zzcev:Landroid/content/Context;

.field private final zzdbi:Lcom/google/android/gms/internal/ads/zzaiv;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/ads/zzaiv;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/ads/zzaix;->zzdbi:Lcom/google/android/gms/internal/ads/zzaiv;

    iput-object p2, p0, Lcom/google/android/gms/internal/ads/zzaix;->zzcev:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/ads/zzaix;->zzcev:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzaiv;->zzn(Landroid/content/Context;)V

    return-void
.end method
