.class public Lcom/google/android/gms/internal/drive/zzkq;
.super Ljava/io/IOException;


# instance fields
.field private zzsq:Lcom/google/android/gms/internal/drive/zzlq;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/internal/drive/zzkq;->zzsq:Lcom/google/android/gms/internal/drive/zzlq;

    return-void
.end method

.method static zzdi()Lcom/google/android/gms/internal/drive/zzkq;
    .locals 2

    .line 6
    new-instance v0, Lcom/google/android/gms/internal/drive/zzkq;

    const-string v1, "While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length."

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/drive/zzkq;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method static zzdj()Lcom/google/android/gms/internal/drive/zzkq;
    .locals 2

    .line 7
    new-instance v0, Lcom/google/android/gms/internal/drive/zzkq;

    const-string v1, "CodedInputStream encountered an embedded string or message which claimed to have negative size."

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/drive/zzkq;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method static zzdl()Lcom/google/android/gms/internal/drive/zzkr;
    .locals 2

    .line 9
    new-instance v0, Lcom/google/android/gms/internal/drive/zzkr;

    const-string v1, "Protocol message tag had invalid wire type."

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/drive/zzkr;-><init>(Ljava/lang/String;)V

    return-object v0
.end method