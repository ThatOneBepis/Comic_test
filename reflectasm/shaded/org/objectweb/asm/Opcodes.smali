.class public interface abstract Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Opcodes;
.super Ljava/lang/Object;


# static fields
.field public static final DOUBLE:Ljava/lang/Integer;

.field public static final FLOAT:Ljava/lang/Integer;

.field public static final INTEGER:Ljava/lang/Integer;

.field public static final LONG:Ljava/lang/Integer;

.field public static final NULL:Ljava/lang/Integer;

.field public static final TOP:Ljava/lang/Integer;

.field public static final UNINITIALIZED_THIS:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Opcodes;->TOP:Ljava/lang/Integer;

    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Opcodes;->INTEGER:Ljava/lang/Integer;

    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Opcodes;->FLOAT:Ljava/lang/Integer;

    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Opcodes;->DOUBLE:Ljava/lang/Integer;

    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Opcodes;->LONG:Ljava/lang/Integer;

    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Opcodes;->NULL:Ljava/lang/Integer;

    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lcom/esotericsoftware/reflectasm/shaded/org/objectweb/asm/Opcodes;->UNINITIALIZED_THIS:Ljava/lang/Integer;

    return-void
.end method
