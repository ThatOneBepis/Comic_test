.class public abstract Lcom/esotericsoftware/reflectasm/ConstructorAccess;
.super Ljava/lang/Object;
.source "ConstructorAccess.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field isNonStaticMemberClass:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Ljava/lang/Class;)Lcom/esotericsoftware/reflectasm/ConstructorAccess;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/esotericsoftware/reflectasm/ConstructorAccess<",
            "TT;>;"
        }
    .end annotation

    move-object/from16 v1, p0

    .line 32
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getEnclosingClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    .line 33
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->isMemberClass()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 35
    :goto_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 36
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "ConstructorAccess"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "java."

    .line 37
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "reflectasm."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 40
    :cond_1
    invoke-static/range {p0 .. p0}, Lcom/esotericsoftware/reflectasm/AccessClassLoader;->get(Ljava/lang/Class;)Lcom/esotericsoftware/reflectasm/AccessClassLoader;

    move-result-object v7

    .line 41
    monitor-enter v7

    .line 43
    :try_start_0
    invoke-virtual {v7, v6}, Lcom/esotericsoftware/reflectasm/AccessClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_2

    :catchall_0
    move-exception v0

    goto/16 :goto_3

    :catch_0
    const/16 v8, 0x2f

    const/16 v9, 0x2e

    .line 45
    :try_start_1
    invoke-virtual {v6, v9, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v13

    .line 46
    invoke-virtual {v5, v9, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v10, 0x0

    if-nez v4, :cond_3

    .line 53
    :try_start_2
    move-object v0, v10

    check-cast v0, [Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v0, :cond_2

    move-object v0, v10

    goto :goto_1

    .line 59
    :cond_2
    :try_start_3
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Class cannot be created (the no-arg constructor is private): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_1
    move-exception v0

    .line 56
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Class cannot be created (missing no-arg constructor): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 62
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v9, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    :try_start_4
    new-array v2, v2, [Ljava/lang/Class;

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-nez v0, :cond_4

    move-object v0, v10

    .line 76
    :goto_1
    :try_start_5
    new-instance v1, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;

    invoke-direct {v1, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;-><init>(I)V

    const v11, 0x3002d

    const/16 v12, 0x21

    const/4 v14, 0x0

    const-string v15, "com/esotericsoftware/reflectasm/ConstructorAccess"

    const/16 v16, 0x0

    move-object v10, v1

    .line 77
    invoke-virtual/range {v10 .. v16}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visit(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 80
    invoke-static {v1}, Lcom/esotericsoftware/reflectasm/ConstructorAccess;->insertConstructor(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;)V

    .line 81
    invoke-static {v1, v5}, Lcom/esotericsoftware/reflectasm/ConstructorAccess;->insertNewInstance(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;)V

    .line 82
    invoke-static {v1, v5, v0}, Lcom/esotericsoftware/reflectasm/ConstructorAccess;->insertNewInstanceInner(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    invoke-virtual {v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitEnd()V

    .line 85
    invoke-virtual {v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->toByteArray()[B

    move-result-object v0

    invoke-virtual {v7, v6, v0}, Lcom/esotericsoftware/reflectasm/AccessClassLoader;->defineClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v0

    .line 87
    :goto_2
    monitor-exit v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 89
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/esotericsoftware/reflectasm/ConstructorAccess;

    .line 90
    iput-boolean v4, v0, Lcom/esotericsoftware/reflectasm/ConstructorAccess;->isNonStaticMemberClass:Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    return-object v0

    :catch_2
    move-exception v0

    .line 93
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error constructing constructor access class: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 71
    :cond_4
    :try_start_7
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Non-static member class cannot be created (the enclosing class constructor is private): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_3
    move-exception v0

    .line 67
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Non-static member class cannot be created (missing enclosing class constructor): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 87
    :goto_3
    monitor-exit v7
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    throw v0
.end method

.method private static insertConstructor(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;)V
    .locals 6

    const-string v2, "<init>"

    const-string v3, "()V"

    const/4 v1, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 98
    invoke-virtual/range {v0 .. v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitMethod(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object p0

    .line 99
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitCode()V

    const/16 v0, 0x19

    const/4 v1, 0x0

    .line 100
    invoke-virtual {p0, v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const-string v0, "com/esotericsoftware/reflectasm/ConstructorAccess"

    const-string v1, "<init>"

    const-string v2, "()V"

    const/16 v3, 0xb7

    .line 101
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0xb1

    .line 102
    invoke-virtual {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const/4 v0, 0x1

    .line 103
    invoke-virtual {p0, v0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    .line 104
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitEnd()V

    return-void
.end method

.method static insertNewInstance(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;)V
    .locals 6

    const-string v2, "newInstance"

    const-string v3, "()Ljava/lang/Object;"

    const/4 v1, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 108
    invoke-virtual/range {v0 .. v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitMethod(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object p0

    .line 109
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitCode()V

    const/16 v0, 0xbb

    .line 110
    invoke-virtual {p0, v0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    const/16 v0, 0x59

    .line 111
    invoke-virtual {p0, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const-string v0, "<init>"

    const-string v1, "()V"

    const/16 v2, 0xb7

    .line 112
    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0xb0

    .line 113
    invoke-virtual {p0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const/4 p1, 0x2

    const/4 v0, 0x1

    .line 114
    invoke-virtual {p0, p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    .line 115
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitEnd()V

    return-void
.end method

.method static insertNewInstanceInner(Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-string v2, "newInstance"

    const-string v3, "(Ljava/lang/Object;)Ljava/lang/Object;"

    const/4 v1, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 119
    invoke-virtual/range {v0 .. v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/ClassWriter;->visitMethod(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;

    move-result-object p0

    .line 120
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitCode()V

    const/4 v0, 0x2

    const/16 v1, 0xb7

    const/16 v2, 0xbb

    const/16 v3, 0x59

    if-eqz p2, :cond_0

    .line 122
    invoke-virtual {p0, v2, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 123
    invoke-virtual {p0, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const/16 v2, 0x19

    const/4 v4, 0x1

    .line 124
    invoke-virtual {p0, v2, v4}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitVarInsn(II)V

    const/16 v2, 0xc0

    .line 125
    invoke-virtual {p0, v2, p2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 126
    invoke-virtual {p0, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const/16 v2, 0xb6

    const-string v3, "java/lang/Object"

    const-string v4, "getClass"

    const-string v5, "()Ljava/lang/Class;"

    .line 127
    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x57

    .line 128
    invoke-virtual {p0, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const-string v2, "<init>"

    .line 129
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "(L"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ";)V"

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v1, p1, v2, p2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0xb0

    .line 130
    invoke-virtual {p0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const/4 p1, 0x4

    .line 131
    invoke-virtual {p0, p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    goto :goto_0

    :cond_0
    const-string p1, "java/lang/UnsupportedOperationException"

    .line 133
    invoke-virtual {p0, v2, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 134
    invoke-virtual {p0, v3}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const-string p1, "Not an inner class."

    .line 135
    invoke-virtual {p0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    const-string p1, "java/lang/UnsupportedOperationException"

    const-string p2, "<init>"

    const-string v2, "(Ljava/lang/String;)V"

    .line 136
    invoke-virtual {p0, v1, p1, p2, v2}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0xbf

    .line 137
    invoke-virtual {p0, p1}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitInsn(I)V

    const/4 p1, 0x3

    .line 138
    invoke-virtual {p0, p1, v0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitMaxs(II)V

    .line 140
    :goto_0
    invoke-virtual {p0}, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/MethodVisitor;->visitEnd()V

    return-void
.end method


# virtual methods
.method public abstract newInstance()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method
