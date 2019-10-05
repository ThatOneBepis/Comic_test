.class final Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;
.super Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldVisitor;


# instance fields
.field private final b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

.field private final c:I

.field private final d:I

.field private final e:I

.field private f:I

.field private g:I

.field private h:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

.field private i:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

.field private j:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;


# direct methods
.method constructor <init>(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    const/high16 v0, 0x40000

    invoke-direct {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldVisitor;-><init>(I)V

    iget-object v0, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->B:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;

    if-nez v0, :cond_0

    iput-object p0, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->B:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->C:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;

    iput-object p0, v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->fv:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldVisitor;

    :goto_0
    iput-object p0, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->C:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;

    iput-object p1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    iput p2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    invoke-virtual {p1, p3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->d:I

    invoke-virtual {p1, p4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->e:I

    if-eqz p5, :cond_1

    invoke-virtual {p1, p5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->f:I

    :cond_1
    if-eqz p6, :cond_2

    invoke-virtual {p1, p6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->a(Ljava/lang/Object;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Item;

    move-result-object p1

    iget p1, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Item;->a:I

    iput p1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->g:I

    :cond_2
    return-void
.end method


# virtual methods
.method a()I
    .locals 7

    iget v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->g:I

    const/16 v1, 0x8

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v2, "ConstantValue"

    invoke-virtual {v0, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    const/16 v0, 0x10

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    :goto_0
    iget v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    and-int/lit16 v2, v2, 0x1000

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    iget v2, v2, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->b:I

    const v3, 0xffff

    and-int/2addr v2, v3

    const/16 v3, 0x31

    if-lt v2, v3, :cond_1

    iget v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    const/high16 v3, 0x40000

    and-int/2addr v2, v3

    if-eqz v2, :cond_2

    :cond_1
    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v3, "Synthetic"

    invoke-virtual {v2, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x6

    :cond_2
    iget v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    const/high16 v3, 0x20000

    and-int/2addr v2, v3

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v3, "Deprecated"

    invoke-virtual {v2, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x6

    :cond_3
    iget v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->f:I

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v3, "Signature"

    invoke-virtual {v2, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x8

    :cond_4
    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->h:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v3, "RuntimeVisibleAnnotations"

    invoke-virtual {v2, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->h:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    invoke-virtual {v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;->a()I

    move-result v2

    add-int/2addr v2, v1

    add-int/2addr v0, v2

    :cond_5
    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->i:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v3, "RuntimeInvisibleAnnotations"

    invoke-virtual {v2, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->i:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    invoke-virtual {v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;->a()I

    move-result v2

    add-int/2addr v2, v1

    add-int/2addr v0, v2

    :cond_6
    iget-object v1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->j:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    if-eqz v1, :cond_7

    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, -0x1

    invoke-virtual/range {v1 .. v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->a(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;[BIII)I

    move-result v1

    add-int/2addr v0, v1

    :cond_7
    return v0
.end method

.method a(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;)V
    .locals 8

    iget v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    const/high16 v1, 0x40000

    and-int v2, v0, v1

    div-int/lit8 v2, v2, 0x40

    const/high16 v3, 0x60000

    or-int/2addr v2, v3

    xor-int/lit8 v2, v2, -0x1

    and-int/2addr v0, v2

    invoke-virtual {p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object v0

    iget v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->d:I

    invoke-virtual {v0, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object v0

    iget v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->e:I

    invoke-virtual {v0, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    iget v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->g:I

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget v3, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    and-int/lit16 v3, v3, 0x1000

    const/16 v4, 0x31

    const v5, 0xffff

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    iget v3, v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->b:I

    and-int/2addr v3, v5

    if-lt v3, v4, :cond_1

    iget v3, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    and-int/2addr v3, v1

    if-eqz v3, :cond_2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    :cond_2
    iget v3, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    const/high16 v6, 0x20000

    and-int/2addr v3, v6

    if-eqz v3, :cond_3

    add-int/lit8 v0, v0, 0x1

    :cond_3
    iget v3, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->f:I

    if-eqz v3, :cond_4

    add-int/lit8 v0, v0, 0x1

    :cond_4
    iget-object v3, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->h:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    if-eqz v3, :cond_5

    add-int/lit8 v0, v0, 0x1

    :cond_5
    iget-object v3, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->i:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    if-eqz v3, :cond_6

    add-int/lit8 v0, v0, 0x1

    :cond_6
    iget-object v3, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->j:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    if-eqz v3, :cond_7

    invoke-virtual {v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->a()I

    move-result v3

    add-int/2addr v0, v3

    :cond_7
    invoke-virtual {p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    iget v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->g:I

    const/4 v3, 0x2

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v7, "ConstantValue"

    invoke-virtual {v0, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    invoke-virtual {p1, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putInt(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object v0

    iget v7, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->g:I

    invoke-virtual {v0, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    :cond_8
    iget v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    iget v0, v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->b:I

    and-int/2addr v0, v5

    if-lt v0, v4, :cond_9

    iget v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_a

    :cond_9
    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v1, "Synthetic"

    invoke-virtual {v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putInt(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    :cond_a
    iget v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->c:I

    and-int/2addr v0, v6

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v1, "Deprecated"

    invoke-virtual {v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putInt(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    :cond_b
    iget v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->f:I

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v1, "Signature"

    invoke-virtual {v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    invoke-virtual {p1, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putInt(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object v0

    iget v1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->f:I

    invoke-virtual {v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    :cond_c
    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->h:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v1, "RuntimeVisibleAnnotations"

    invoke-virtual {v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->h:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    invoke-virtual {v0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;->a(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;)V

    :cond_d
    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->i:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const-string v1, "RuntimeInvisibleAnnotations"

    invoke-virtual {v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->i:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    invoke-virtual {v0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;->a(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;)V

    :cond_e
    iget-object v1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->j:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    if-eqz v1, :cond_f

    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, -0x1

    move-object v7, p1

    invoke-virtual/range {v1 .. v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->a(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;[BIIILcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;)V

    :cond_f
    return-void
.end method

.method public visitAnnotation(Ljava/lang/String;Z)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationVisitor;
    .locals 6

    new-instance v4, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    invoke-direct {v4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;-><init>()V

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    invoke-virtual {v0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v4, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;->putShort(I)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;

    new-instance p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    iget-object v1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->b:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    const/4 v2, 0x1

    const/4 v5, 0x2

    move-object v0, p1

    move-object v3, v4

    invoke-direct/range {v0 .. v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;-><init>(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;ZLcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ByteVector;I)V

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->h:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    iput-object p2, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;->g:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    iput-object p1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->h:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->i:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    iput-object p2, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;->g:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    iput-object p1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->i:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/AnnotationWriter;

    :goto_0
    return-object p1
.end method

.method public visitAttribute(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;)V
    .locals 1

    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->j:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    iput-object v0, p1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;->a:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    iput-object p1, p0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/FieldWriter;->j:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Attribute;

    return-void
.end method

.method public visitEnd()V
    .locals 0

    return-void
.end method
