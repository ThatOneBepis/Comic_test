.class public abstract Lcom/esotericsoftware/reflectasm/FieldAccess;
.super Ljava/lang/Object;
.source "FieldAccess.java"


# instance fields
.field private fieldNames:[Ljava/lang/String;

.field private fieldTypes:[Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Ljava/lang/Class;)Lcom/esotericsoftware/reflectasm/FieldAccess;
    .locals 15

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v1, p0

    .line 86
    :goto_0
    const-class v2, Ljava/lang/Object;

    const/4 v3, 0x0

    if-eq v1, v2, :cond_3

    .line 87
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 88
    array-length v4, v2

    :goto_1
    if-ge v3, v4, :cond_2

    .line 89
    aget-object v5, v2, v3

    .line 90
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 91
    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_2

    .line 92
    :cond_0
    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_2

    .line 93
    :cond_1
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 95
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    .line 98
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    .line 99
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/Class;

    .line 100
    array-length v4, v1

    const/4 v5, 0x0

    :goto_3
    if-ge v5, v4, :cond_4

    .line 101
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/reflect/Field;

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v1, v5

    .line 102
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/reflect/Field;

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v6

    aput-object v6, v2, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 105
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 106
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "FieldAccess"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "java."

    .line 107
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "reflectasm."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 110
    :cond_5
    invoke-static {p0}, Lcom/esotericsoftware/reflectasm/AccessClassLoader;->get(Ljava/lang/Class;)Lcom/esotericsoftware/reflectasm/AccessClassLoader;

    move-result-object p0

    .line 111
    monitor-enter p0

    .line 113
    :try_start_0
    invoke-virtual {p0, v5}, Lcom/esotericsoftware/reflectasm/AccessClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_4

    :catchall_0
    move-exception v0

    goto/16 :goto_5

    :catch_0
    const/16 v6, 0x2f

    const/16 v7, 0x2e

    .line 115
    :try_start_1
    invoke-virtual {v5, v7, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v11

    .line 116
    invoke-virtual {v4, v7, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 118
    new-instance v6, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    invoke-direct {v6, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;-><init>(I)V

    const v9, 0x3002d

    const/16 v10, 0x21

    const/4 v12, 0x0

    const-string v13, "com/esotericsoftware/reflectasm/FieldAccess"

    const/4 v14, 0x0

    move-object v8, v6

    .line 119
    invoke-virtual/range {v8 .. v14}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visit(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 121
    invoke-static {v6}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertConstructor(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;)V

    .line 122
    invoke-static {v6, v4, v0}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetObject(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 123
    invoke-static {v6, v4, v0}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertSetObject(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 124
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->BOOLEAN_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 125
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->BOOLEAN_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertSetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 126
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->BYTE_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 127
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->BYTE_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertSetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 128
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->SHORT_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 129
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->SHORT_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertSetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 130
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->INT_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 131
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->INT_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertSetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 132
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->LONG_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 133
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->LONG_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertSetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 134
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->DOUBLE_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 135
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->DOUBLE_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertSetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 136
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->FLOAT_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 137
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->FLOAT_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertSetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 138
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->CHAR_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 139
    sget-object v3, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->CHAR_TYPE:Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    invoke-static {v6, v4, v0, v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertSetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V

    .line 140
    invoke-static {v6, v4, v0}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertGetString(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 141
    invoke-virtual {v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitEnd()V

    .line 142
    invoke-virtual {v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->toByteArray()[B

    move-result-object v0

    invoke-virtual {p0, v5, v0}, Lcom/esotericsoftware/reflectasm/AccessClassLoader;->defineClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v0

    .line 144
    :goto_4
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/esotericsoftware/reflectasm/FieldAccess;

    .line 147
    iput-object v1, p0, Lcom/esotericsoftware/reflectasm/FieldAccess;->fieldNames:[Ljava/lang/String;

    .line 148
    iput-object v2, p0, Lcom/esotericsoftware/reflectasm/FieldAccess;->fieldTypes:[Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    return-object p0

    :catch_1
    move-exception p0

    .line 151
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error constructing field access class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 144
    :goto_5
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    return-void
.end method

.method private static insertConstructor(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;)V
    .locals 6

    const-string v2, "<init>"

    const-string v3, "()V"

    const/4 v1, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 156
    invoke-virtual/range {v0 .. v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitMethod(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object p0

    .line 157
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitCode()V

    const/16 v0, 0x19

    const/4 v1, 0x0

    .line 158
    invoke-virtual {p0, v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const-string v0, "com/esotericsoftware/reflectasm/FieldAccess"

    const-string v1, "<init>"

    const-string v2, "()V"

    const/16 v3, 0xb7

    .line 159
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0xb1

    .line 160
    invoke-virtual {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const/4 v0, 0x1

    .line 161
    invoke-virtual {p0, v0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    .line 162
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitEnd()V

    return-void
.end method

.method private static insertGetObject(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Field;",
            ">;)V"
        }
    .end annotation

    const-string v2, "get"

    const-string v3, "(Ljava/lang/Object;I)Ljava/lang/Object;"

    const/4 v1, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 244
    invoke-virtual/range {v0 .. v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitMethod(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object p0

    .line 245
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitCode()V

    const/16 v0, 0x15

    const/4 v1, 0x2

    .line 246
    invoke-virtual {p0, v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    .line 248
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x5

    .line 250
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    .line 251
    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_0

    .line 252
    new-instance v5, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    aput-object v5, v1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 253
    :cond_0
    new-instance v2, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    .line 254
    array-length v4, v1

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    invoke-virtual {p0, v3, v4, v2, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTableSwitchInsn(IILcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;[Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    .line 256
    array-length v4, v1

    :goto_1
    if-ge v3, v4, :cond_1

    .line 257
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v12, v6

    check-cast v12, Ljava/lang/reflect/Field;

    .line 259
    aget-object v6, v1, v3

    invoke-virtual {p0, v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v7, 0x3

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v6, p0

    .line 260
    invoke-virtual/range {v6 .. v11}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    const/16 v6, 0x19

    .line 261
    invoke-virtual {p0, v6, v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const/16 v6, 0xc0

    .line 262
    invoke-virtual {p0, v6, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const/16 v6, 0xb4

    .line 263
    invoke-virtual {v12}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v12}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    invoke-static {v8}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getDescriptor(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v6, p1, v7, v8}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    invoke-virtual {v12}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getType(Ljava/lang/Class;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    move-result-object v6

    .line 266
    invoke-virtual {v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getSort()I

    move-result v6

    const/16 v7, 0xb8

    packed-switch v6, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    const-string v6, "java/lang/Double"

    const-string v8, "valueOf"

    const-string v9, "(D)Ljava/lang/Double;"

    .line 289
    invoke-virtual {p0, v7, v6, v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_1
    const-string v6, "java/lang/Long"

    const-string v8, "valueOf"

    const-string v9, "(J)Ljava/lang/Long;"

    .line 286
    invoke-virtual {p0, v7, v6, v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_2
    const-string v6, "java/lang/Float"

    const-string v8, "valueOf"

    const-string v9, "(F)Ljava/lang/Float;"

    .line 283
    invoke-virtual {p0, v7, v6, v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_3
    const-string v6, "java/lang/Integer"

    const-string v8, "valueOf"

    const-string v9, "(I)Ljava/lang/Integer;"

    .line 280
    invoke-virtual {p0, v7, v6, v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_4
    const-string v6, "java/lang/Short"

    const-string v8, "valueOf"

    const-string v9, "(S)Ljava/lang/Short;"

    .line 277
    invoke-virtual {p0, v7, v6, v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_5
    const-string v6, "java/lang/Byte"

    const-string v8, "valueOf"

    const-string v9, "(B)Ljava/lang/Byte;"

    .line 271
    invoke-virtual {p0, v7, v6, v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_6
    const-string v6, "java/lang/Character"

    const-string v8, "valueOf"

    const-string v9, "(C)Ljava/lang/Character;"

    .line 274
    invoke-virtual {p0, v7, v6, v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_7
    const-string v6, "java/lang/Boolean"

    const-string v8, "valueOf"

    const-string v9, "(Z)Ljava/lang/Boolean;"

    .line 268
    invoke-virtual {p0, v7, v6, v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    const/16 v6, 0xb0

    .line 293
    invoke-virtual {p0, v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 296
    :cond_1
    invoke-virtual {p0, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v7, 0x3

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v6, p0

    .line 297
    invoke-virtual/range {v6 .. v11}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    goto :goto_3

    :cond_2
    const/4 v0, 0x6

    .line 299
    :goto_3
    invoke-static {p0}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertThrowExceptionForFieldNotFound(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    const/4 p1, 0x3

    .line 300
    invoke-virtual {p0, v0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    .line 301
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitEnd()V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static insertGetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Field;",
            ">;",
            "Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 447
    invoke-virtual/range {p3 .. p3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getDescriptor()Ljava/lang/String;

    move-result-object v2

    .line 449
    invoke-virtual/range {p3 .. p3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getSort()I

    move-result v3

    const/16 v4, 0xac

    packed-switch v3, :pswitch_data_0

    const-string v3, "get"

    const/16 v4, 0xb0

    move-object v7, v3

    goto :goto_0

    :pswitch_0
    const-string v3, "getDouble"

    const/16 v4, 0xaf

    move-object v7, v3

    goto :goto_0

    :pswitch_1
    const-string v3, "getLong"

    const/16 v4, 0xad

    move-object v7, v3

    goto :goto_0

    :pswitch_2
    const-string v3, "getFloat"

    const/16 v4, 0xae

    move-object v7, v3

    goto :goto_0

    :pswitch_3
    const-string v3, "getInt"

    move-object v7, v3

    goto :goto_0

    :pswitch_4
    const-string v3, "getShort"

    move-object v7, v3

    goto :goto_0

    :pswitch_5
    const-string v3, "getByte"

    move-object v7, v3

    goto :goto_0

    :pswitch_6
    const-string v3, "getChar"

    move-object v7, v3

    goto :goto_0

    :pswitch_7
    const-string v3, "getBoolean"

    move-object v7, v3

    :goto_0
    const/4 v6, 0x1

    .line 487
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(Ljava/lang/Object;I)"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v5, p0

    invoke-virtual/range {v5 .. v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitMethod(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object v3

    .line 488
    invoke-virtual {v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitCode()V

    const/16 v5, 0x15

    const/4 v6, 0x2

    .line 489
    invoke-virtual {v3, v5, v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    .line 491
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_5

    .line 493
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    .line 494
    new-instance v7, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    .line 496
    array-length v8, v6

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v17, 0x0

    :goto_1
    const/4 v15, 0x1

    if-ge v10, v8, :cond_1

    .line 497
    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/reflect/Field;

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v11

    invoke-static {v11}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getType(Ljava/lang/Class;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    move-result-object v11

    move-object/from16 v14, p3

    invoke-virtual {v11, v14}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 498
    new-instance v11, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v11}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    aput-object v11, v6, v10

    goto :goto_2

    .line 500
    :cond_0
    aput-object v7, v6, v10

    const/16 v17, 0x1

    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    :cond_1
    move-object/from16 v14, p3

    .line 504
    new-instance v8, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v8}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    .line 505
    array-length v10, v6

    sub-int/2addr v10, v15

    invoke-virtual {v3, v9, v10, v8, v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTableSwitchInsn(IILcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;[Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    .line 507
    array-length v10, v6

    :goto_3
    if-ge v9, v10, :cond_3

    .line 508
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    move-object/from16 v18, v11

    check-cast v18, Ljava/lang/reflect/Field;

    .line 509
    aget-object v11, v6, v9

    invoke-virtual {v11, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 510
    aget-object v11, v6, v9

    invoke-virtual {v3, v11}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v12, 0x3

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object v11, v3

    move-object/from16 v14, v16

    const/4 v5, 0x1

    move/from16 v15, v19

    move-object/from16 v16, v20

    .line 511
    invoke-virtual/range {v11 .. v16}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    const/16 v11, 0x19

    .line 512
    invoke-virtual {v3, v11, v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const/16 v11, 0xc0

    .line 513
    invoke-virtual {v3, v11, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const/16 v11, 0xb4

    .line 514
    invoke-virtual/range {v18 .. v18}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v11, v0, v12, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    invoke-virtual {v3, v4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    goto :goto_4

    :cond_2
    const/4 v5, 0x1

    :goto_4
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v14, p3

    const/4 v15, 0x1

    goto :goto_3

    :cond_3
    if-eqz v17, :cond_4

    .line 520
    invoke-virtual {v3, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v12, 0x3

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object v11, v3

    .line 521
    invoke-virtual/range {v11 .. v16}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    .line 522
    invoke-virtual/range {p3 .. p3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertThrowExceptionForFieldType(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    .line 525
    :cond_4
    invoke-virtual {v3, v8}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v12, 0x3

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object v11, v3

    .line 526
    invoke-virtual/range {v11 .. v16}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    const/4 v5, 0x5

    goto :goto_5

    :cond_5
    const/4 v5, 0x6

    .line 528
    :goto_5
    invoke-static {v3}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertThrowExceptionForFieldNotFound(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object v0

    const/4 v1, 0x3

    .line 529
    invoke-virtual {v0, v5, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    .line 530
    invoke-virtual {v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitEnd()V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static insertGetString(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Field;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const-string v4, "getString"

    const-string v5, "(Ljava/lang/Object;I)Ljava/lang/String;"

    const/4 v3, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p0

    .line 306
    invoke-virtual/range {v2 .. v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitMethod(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object v2

    .line 307
    invoke-virtual {v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitCode()V

    const/16 v3, 0x15

    const/4 v4, 0x2

    .line 308
    invoke-virtual {v2, v3, v4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    .line 310
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5

    const/4 v3, 0x5

    .line 312
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    .line 313
    new-instance v5, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    .line 315
    array-length v6, v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v14, 0x0

    :goto_0
    const/4 v15, 0x1

    if-ge v8, v6, :cond_1

    .line 316
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/reflect/Field;

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 317
    new-instance v9, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    aput-object v9, v4, v8

    goto :goto_1

    .line 319
    :cond_0
    aput-object v5, v4, v8

    const/4 v14, 0x1

    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 323
    :cond_1
    new-instance v6, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    .line 324
    array-length v8, v4

    sub-int/2addr v8, v15

    invoke-virtual {v2, v7, v8, v6, v4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTableSwitchInsn(IILcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;[Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    .line 326
    array-length v13, v4

    :goto_2
    if-ge v7, v13, :cond_3

    .line 327
    aget-object v8, v4, v7

    invoke-virtual {v8, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 328
    aget-object v8, v4, v7

    invoke-virtual {v2, v8}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v9, 0x3

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v16, 0x0

    move-object v8, v2

    move/from16 v17, v13

    move-object/from16 v13, v16

    .line 329
    invoke-virtual/range {v8 .. v13}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    const/16 v8, 0x19

    .line 330
    invoke-virtual {v2, v8, v15}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const/16 v8, 0xc0

    .line 331
    invoke-virtual {v2, v8, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const/16 v8, 0xb4

    .line 332
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/reflect/Field;

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Ljava/lang/String;"

    invoke-virtual {v2, v8, v0, v9, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v8, 0xb0

    .line 333
    invoke-virtual {v2, v8}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    goto :goto_3

    :cond_2
    move/from16 v17, v13

    :goto_3
    add-int/lit8 v7, v7, 0x1

    move/from16 v13, v17

    goto :goto_2

    :cond_3
    if-eqz v14, :cond_4

    .line 338
    invoke-virtual {v2, v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v9, 0x3

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v8, v2

    .line 339
    invoke-virtual/range {v8 .. v13}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    const-string v0, "String"

    .line 340
    invoke-static {v2, v0}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertThrowExceptionForFieldType(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    .line 343
    :cond_4
    invoke-virtual {v2, v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v9, 0x3

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v8, v2

    .line 344
    invoke-virtual/range {v8 .. v13}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    goto :goto_4

    :cond_5
    const/4 v3, 0x6

    .line 346
    :goto_4
    invoke-static {v2}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertThrowExceptionForFieldNotFound(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    const/4 v0, 0x3

    .line 347
    invoke-virtual {v2, v3, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    .line 348
    invoke-virtual {v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitEnd()V

    return-void
.end method

.method private static insertSetObject(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Field;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p1

    const-string v3, "set"

    const-string v4, "(Ljava/lang/Object;ILjava/lang/Object;)V"

    const/4 v2, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v1, p0

    .line 167
    invoke-virtual/range {v1 .. v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitMethod(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object v1

    .line 168
    invoke-virtual {v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitCode()V

    const/16 v2, 0x15

    const/4 v3, 0x2

    .line 169
    invoke-virtual {v1, v2, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    .line 171
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x5

    .line 173
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    .line 174
    array-length v4, v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v4, :cond_0

    .line 175
    new-instance v7, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    aput-object v7, v3, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 176
    :cond_0
    new-instance v4, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    .line 177
    array-length v6, v3

    const/4 v13, 0x1

    sub-int/2addr v6, v13

    invoke-virtual {v1, v5, v6, v4, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTableSwitchInsn(IILcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;[Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    .line 179
    array-length v6, v3

    :goto_1
    if-ge v5, v6, :cond_1

    move-object/from16 v14, p2

    .line 180
    invoke-virtual {v14, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v15, v7

    check-cast v15, Ljava/lang/reflect/Field;

    .line 181
    invoke-virtual {v15}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    invoke-static {v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getType(Ljava/lang/Class;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    move-result-object v16

    .line 183
    aget-object v7, v3, v5

    invoke-virtual {v1, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v7, v1

    .line 184
    invoke-virtual/range {v7 .. v12}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    const/16 v7, 0x19

    .line 185
    invoke-virtual {v1, v7, v13}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const/16 v8, 0xc0

    .line 186
    invoke-virtual {v1, v8, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const/4 v9, 0x3

    .line 187
    invoke-virtual {v1, v7, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    .line 189
    invoke-virtual/range {v16 .. v16}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getSort()I

    move-result v7

    const/16 v9, 0xb6

    packed-switch v7, :pswitch_data_0

    goto/16 :goto_2

    .line 226
    :pswitch_0
    invoke-virtual/range {v16 .. v16}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getInternalName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    goto/16 :goto_2

    .line 223
    :pswitch_1
    invoke-virtual/range {v16 .. v16}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getDescriptor()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    goto/16 :goto_2

    :pswitch_2
    const-string v7, "java/lang/Double"

    .line 219
    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const-string v7, "java/lang/Double"

    const-string v8, "doubleValue"

    const-string v10, "()D"

    .line 220
    invoke-virtual {v1, v9, v7, v8, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_3
    const-string v7, "java/lang/Long"

    .line 215
    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const-string v7, "java/lang/Long"

    const-string v8, "longValue"

    const-string v10, "()J"

    .line 216
    invoke-virtual {v1, v9, v7, v8, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_4
    const-string v7, "java/lang/Float"

    .line 211
    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const-string v7, "java/lang/Float"

    const-string v8, "floatValue"

    const-string v10, "()F"

    .line 212
    invoke-virtual {v1, v9, v7, v8, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_5
    const-string v7, "java/lang/Integer"

    .line 207
    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const-string v7, "java/lang/Integer"

    const-string v8, "intValue"

    const-string v10, "()I"

    .line 208
    invoke-virtual {v1, v9, v7, v8, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_6
    const-string v7, "java/lang/Short"

    .line 203
    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const-string v7, "java/lang/Short"

    const-string v8, "shortValue"

    const-string v10, "()S"

    .line 204
    invoke-virtual {v1, v9, v7, v8, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_7
    const-string v7, "java/lang/Byte"

    .line 195
    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const-string v7, "java/lang/Byte"

    const-string v8, "byteValue"

    const-string v10, "()B"

    .line 196
    invoke-virtual {v1, v9, v7, v8, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_8
    const-string v7, "java/lang/Character"

    .line 199
    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const-string v7, "java/lang/Character"

    const-string v8, "charValue"

    const-string v10, "()C"

    .line 200
    invoke-virtual {v1, v9, v7, v8, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_9
    const-string v7, "java/lang/Boolean"

    .line 191
    invoke-virtual {v1, v8, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const-string v7, "java/lang/Boolean"

    const-string v8, "booleanValue"

    const-string v10, "()Z"

    .line 192
    invoke-virtual {v1, v9, v7, v8, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    const/16 v7, 0xb5

    .line 230
    invoke-virtual {v15}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {v16 .. v16}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getDescriptor()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v7, v0, v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v7, 0xb1

    .line 231
    invoke-virtual {v1, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1

    .line 234
    :cond_1
    invoke-virtual {v1, v4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v7, v1

    .line 235
    invoke-virtual/range {v7 .. v12}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    goto :goto_3

    :cond_2
    const/4 v2, 0x6

    .line 237
    :goto_3
    invoke-static {v1}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertThrowExceptionForFieldNotFound(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object v0

    const/4 v1, 0x4

    .line 238
    invoke-virtual {v0, v2, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    .line 239
    invoke-virtual {v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitEnd()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static insertSetPrimitive(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;)V
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Field;",
            ">;",
            "Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 355
    invoke-virtual/range {p3 .. p3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getDescriptor()Ljava/lang/String;

    move-result-object v2

    .line 357
    invoke-virtual/range {p3 .. p3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getSort()I

    move-result v3

    const/16 v6, 0x15

    const/4 v7, 0x4

    packed-switch v3, :pswitch_data_0

    const-string v3, "set"

    move-object v10, v3

    const/16 v3, 0x19

    goto :goto_0

    :pswitch_0
    const-string v3, "setDouble"

    const/16 v7, 0x18

    move-object v10, v3

    const/16 v3, 0x18

    const/4 v7, 0x5

    goto :goto_0

    :pswitch_1
    const-string v3, "setLong"

    const/16 v7, 0x16

    move-object v10, v3

    const/16 v3, 0x16

    const/4 v7, 0x5

    goto :goto_0

    :pswitch_2
    const-string v3, "setFloat"

    const/16 v8, 0x17

    move-object v10, v3

    const/16 v3, 0x17

    goto :goto_0

    :pswitch_3
    const-string v3, "setInt"

    move-object v10, v3

    const/16 v3, 0x15

    goto :goto_0

    :pswitch_4
    const-string v3, "setShort"

    move-object v10, v3

    const/16 v3, 0x15

    goto :goto_0

    :pswitch_5
    const-string v3, "setByte"

    move-object v10, v3

    const/16 v3, 0x15

    goto :goto_0

    :pswitch_6
    const-string v3, "setChar"

    move-object v10, v3

    const/16 v3, 0x15

    goto :goto_0

    :pswitch_7
    const-string v3, "setBoolean"

    move-object v10, v3

    const/16 v3, 0x15

    :goto_0
    const/4 v9, 0x1

    .line 397
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "(Ljava/lang/Object;I"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, ")V"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v8, p0

    invoke-virtual/range {v8 .. v13}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitMethod(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object v8

    .line 399
    invoke-virtual {v8}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitCode()V

    const/4 v9, 0x2

    .line 400
    invoke-virtual {v8, v6, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    .line 402
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_5

    .line 404
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    .line 405
    new-instance v9, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    .line 407
    array-length v10, v6

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_1
    const/4 v15, 0x1

    if-ge v12, v10, :cond_1

    .line 408
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/reflect/Field;

    invoke-virtual {v14}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v14

    invoke-static {v14}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getType(Ljava/lang/Class;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;

    move-result-object v14

    move-object/from16 v5, p3

    invoke-virtual {v14, v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 409
    new-instance v14, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v14}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    aput-object v14, v6, v12

    goto :goto_2

    .line 411
    :cond_0
    aput-object v9, v6, v12

    const/4 v13, 0x1

    :goto_2
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    :cond_1
    move-object/from16 v5, p3

    .line 415
    new-instance v10, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;

    invoke-direct {v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;-><init>()V

    .line 416
    array-length v12, v6

    sub-int/2addr v12, v15

    invoke-virtual {v8, v11, v12, v10, v6}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTableSwitchInsn(IILcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;[Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    .line 418
    array-length v12, v6

    :goto_3
    if-ge v11, v12, :cond_3

    .line 419
    aget-object v14, v6, v11

    invoke-virtual {v14, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_2

    .line 420
    aget-object v14, v6, v11

    invoke-virtual {v8, v14}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/16 v16, 0x3

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object v14, v8

    const/4 v4, 0x1

    move/from16 v15, v16

    move/from16 v16, v17

    move-object/from16 v17, v18

    move/from16 v18, v19

    move-object/from16 v19, v20

    .line 421
    invoke-virtual/range {v14 .. v19}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    const/16 v14, 0x19

    .line 422
    invoke-virtual {v8, v14, v4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const/16 v15, 0xc0

    .line 423
    invoke-virtual {v8, v15, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const/4 v15, 0x3

    .line 424
    invoke-virtual {v8, v3, v15}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const/16 v15, 0xb5

    .line 425
    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/reflect/Field;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v15, v0, v4, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v4, 0xb1

    .line 426
    invoke-virtual {v8, v4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    goto :goto_4

    :cond_2
    const/16 v14, 0x19

    :goto_4
    add-int/lit8 v11, v11, 0x1

    const/4 v15, 0x1

    goto :goto_3

    :cond_3
    if-eqz v13, :cond_4

    .line 431
    invoke-virtual {v8, v9}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v15, 0x3

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object v14, v8

    .line 432
    invoke-virtual/range {v14 .. v19}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    .line 433
    invoke-virtual/range {p3 .. p3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Type;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertThrowExceptionForFieldType(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    .line 436
    :cond_4
    invoke-virtual {v8, v10}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLabel(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Label;)V

    const/4 v15, 0x3

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object v14, v8

    .line 437
    invoke-virtual/range {v14 .. v19}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitFrame(II[Ljava/lang/Object;I[Ljava/lang/Object;)V

    const/4 v5, 0x5

    goto :goto_5

    :cond_5
    const/4 v5, 0x6

    .line 439
    :goto_5
    invoke-static {v8}, Lcom/esotericsoftware/reflectasm/FieldAccess;->insertThrowExceptionForFieldNotFound(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object v0

    .line 440
    invoke-virtual {v0, v5, v7}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    .line 441
    invoke-virtual {v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitEnd()V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static insertThrowExceptionForFieldNotFound(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;
    .locals 5

    const-string v0, "java/lang/IllegalArgumentException"

    const/16 v1, 0xbb

    .line 534
    invoke-virtual {p0, v1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const/16 v0, 0x59

    .line 535
    invoke-virtual {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const-string v2, "java/lang/StringBuilder"

    .line 536
    invoke-virtual {p0, v1, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 537
    invoke-virtual {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const-string v0, "Field not found: "

    .line 538
    invoke-virtual {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    const-string v0, "java/lang/StringBuilder"

    const-string v1, "<init>"

    const-string v2, "(Ljava/lang/String;)V"

    const/16 v3, 0xb7

    .line 539
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x15

    const/4 v1, 0x2

    .line 540
    invoke-virtual {p0, v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const-string v0, "java/lang/StringBuilder"

    const-string v1, "append"

    const-string v2, "(I)Ljava/lang/StringBuilder;"

    const/16 v4, 0xb6

    .line 541
    invoke-virtual {p0, v4, v0, v1, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "java/lang/StringBuilder"

    const-string v1, "toString"

    const-string v2, "()Ljava/lang/String;"

    .line 542
    invoke-virtual {p0, v4, v0, v1, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "java/lang/IllegalArgumentException"

    const-string v1, "<init>"

    const-string v2, "(Ljava/lang/String;)V"

    .line 543
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0xbf

    .line 544
    invoke-virtual {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    return-object p0
.end method

.method private static insertThrowExceptionForFieldType(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;
    .locals 4

    const-string v0, "java/lang/IllegalArgumentException"

    const/16 v1, 0xbb

    .line 549
    invoke-virtual {p0, v1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const/16 v0, 0x59

    .line 550
    invoke-virtual {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const-string v2, "java/lang/StringBuilder"

    .line 551
    invoke-virtual {p0, v1, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 552
    invoke-virtual {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    .line 553
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Field not declared as "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    const-string p1, "java/lang/StringBuilder"

    const-string v0, "<init>"

    const-string v1, "(Ljava/lang/String;)V"

    const/16 v2, 0xb7

    .line 554
    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0x15

    const/4 v0, 0x2

    .line 555
    invoke-virtual {p0, p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const-string p1, "java/lang/StringBuilder"

    const-string v0, "append"

    const-string v1, "(I)Ljava/lang/StringBuilder;"

    const/16 v3, 0xb6

    .line 556
    invoke-virtual {p0, v3, p1, v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "java/lang/StringBuilder"

    const-string v0, "toString"

    const-string v1, "()Ljava/lang/String;"

    .line 557
    invoke-virtual {p0, v3, p1, v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "java/lang/IllegalArgumentException"

    const-string v0, "<init>"

    const-string v1, "(Ljava/lang/String;)V"

    .line 558
    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0xbf

    .line 559
    invoke-virtual {p0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    return-object p0
.end method


# virtual methods
.method public abstract get(Ljava/lang/Object;I)Ljava/lang/Object;
.end method

.method public abstract getBoolean(Ljava/lang/Object;I)Z
.end method

.method public abstract getByte(Ljava/lang/Object;I)B
.end method

.method public abstract getChar(Ljava/lang/Object;I)C
.end method

.method public abstract getDouble(Ljava/lang/Object;I)D
.end method

.method public abstract getFloat(Ljava/lang/Object;I)F
.end method

.method public getIndex(Ljava/lang/String;)I
    .locals 3

    .line 20
    iget-object v0, p0, Lcom/esotericsoftware/reflectasm/FieldAccess;->fieldNames:[Ljava/lang/String;

    array-length v0, v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 21
    iget-object v2, p0, Lcom/esotericsoftware/reflectasm/FieldAccess;->fieldNames:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 22
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to find public field: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    return-void
.end method

.method public abstract getInt(Ljava/lang/Object;I)I
.end method

.method public abstract getLong(Ljava/lang/Object;I)J
.end method

.method public abstract getShort(Ljava/lang/Object;I)S
.end method

.method public abstract getString(Ljava/lang/Object;I)Ljava/lang/String;
.end method

.method public abstract set(Ljava/lang/Object;ILjava/lang/Object;)V
.end method

.method public abstract setBoolean(Ljava/lang/Object;IZ)V
.end method

.method public abstract setByte(Ljava/lang/Object;IB)V
.end method

.method public abstract setChar(Ljava/lang/Object;IC)V
.end method

.method public abstract setDouble(Ljava/lang/Object;ID)V
.end method

.method public abstract setFloat(Ljava/lang/Object;IF)V
.end method

.method public abstract setInt(Ljava/lang/Object;II)V
.end method

.method public abstract setLong(Ljava/lang/Object;IJ)V
.end method

.method public abstract setShort(Ljava/lang/Object;IS)V
.end method
