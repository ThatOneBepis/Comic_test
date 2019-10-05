.class public Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;
.super Ljava/lang/Object;


# instance fields
.field a:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

.field b:[B

.field public final type:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->type:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method final a()I
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    :goto_0
    if-eqz v0, :cond_0

    add-int/lit8 v1, v1, 0x1

    iget-object v0, v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->a:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    goto :goto_0

    :cond_0
    return v1
.end method

.method final a(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;[BIII)I
    .locals 8

    const/4 v0, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    :goto_0
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->type:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-object v1, v0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->write(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;[BIII)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object v1

    iget v1, v1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->b:I

    add-int/lit8 v1, v1, 0x6

    add-int/2addr v7, v1

    iget-object v0, v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->a:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    goto :goto_0

    :cond_0
    return v7
.end method

.method final a(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;[BIIILcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;)V
    .locals 7

    move-object v6, p0

    :goto_0
    if-eqz v6, :cond_0

    move-object v0, v6

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->write(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;[BIII)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object v0

    iget-object v1, v6, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->type:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p6, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object v1

    iget v2, v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->b:I

    invoke-virtual {v1, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putInt(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    iget-object v1, v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->a:[B

    const/4 v2, 0x0

    iget v0, v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->b:I

    invoke-virtual {p6, v1, v2, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putByteArray([BII)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    iget-object v6, v6, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->a:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected getLabels()[Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public isCodeAttribute()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected read(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassReader;II[CI[Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;
    .locals 0

    new-instance p4, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    iget-object p5, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->type:Ljava/lang/String;

    invoke-direct {p4, p5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;-><init>(Ljava/lang/String;)V

    new-array p5, p3, [B

    iput-object p5, p4, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->b:[B

    iget-object p1, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassReader;->b:[B

    iget-object p5, p4, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->b:[B

    const/4 p6, 0x0

    invoke-static {p1, p2, p5, p6, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p4
.end method

.method protected write(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;[BIII)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;
    .locals 0

    new-instance p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    invoke-direct {p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;-><init>()V

    iget-object p2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->b:[B

    iput-object p2, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->a:[B

    array-length p2, p2

    iput p2, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->b:I

    return-object p1
.end method
