.class public final Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;
.source "com.google.android.gms:play-services-ads-lite@@18.1.0"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final zzbke:Z

.field private final zzbkf:Lcom/google/android/gms/internal/ads/zzvm;

.field private final zzbkh:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 39
    new-instance v0, Lcom/google/android/gms/ads/formats/zzc;

    invoke-direct {v0}, Lcom/google/android/gms/ads/formats/zzc;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ZLandroid/os/IBinder;Landroid/os/IBinder;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    .line 13
    iput-boolean p1, p0, Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;->zzbke:Z

    if-eqz p2, :cond_0

    .line 15
    invoke-static {p2}, Lcom/google/android/gms/internal/ads/zzvl;->zze(Landroid/os/IBinder;)Lcom/google/android/gms/internal/ads/zzvm;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;->zzbkf:Lcom/google/android/gms/internal/ads/zzvm;

    .line 16
    iput-object p3, p0, Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;->zzbkh:Landroid/os/IBinder;

    return-void
.end method


# virtual methods
.method public final getManualImpressionsEnabled()Z
    .locals 1

    .line 19
    iget-boolean v0, p0, Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;->zzbke:Z

    return v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    .line 23
    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->beginObjectHeader(Landroid/os/Parcel;)I

    move-result p2

    .line 25
    invoke-virtual {p0}, Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;->getManualImpressionsEnabled()Z

    move-result v0

    const/4 v1, 0x1

    .line 26
    invoke-static {p1, v1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeBoolean(Landroid/os/Parcel;IZ)V

    .line 29
    iget-object v0, p0, Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;->zzbkf:Lcom/google/android/gms/internal/ads/zzvm;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Lcom/google/android/gms/internal/ads/zzvm;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    :goto_0
    const/4 v1, 0x0

    const/4 v2, 0x2

    .line 31
    invoke-static {p1, v2, v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeIBinder(Landroid/os/Parcel;ILandroid/os/IBinder;Z)V

    const/4 v0, 0x3

    .line 33
    iget-object v2, p0, Lcom/google/android/gms/ads/formats/PublisherAdViewOptions;->zzbkh:Landroid/os/IBinder;

    .line 35
    invoke-static {p1, v0, v2, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeIBinder(Landroid/os/Parcel;ILandroid/os/IBinder;Z)V

    .line 36
    invoke-static {p1, p2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->finishObjectHeader(Landroid/os/Parcel;I)V

    return-void
.end method
