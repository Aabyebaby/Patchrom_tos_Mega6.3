.class public Lcom/android/internal/util/slim/AppMoving;
.super Ljava/lang/Object;
.source "AppMoving.java"


# static fields
.field private static final DISABLE_FILE:Ljava/lang/String; = "/data/system/no-external-apps"

.field private static final TAG:Ljava/lang/String; = "AppMoving"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createFile()V
    .locals 4

    .prologue
    .line 38
    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v2, "/data/system/no-external-apps"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .local v0, "e":Ljava/io/IOException;
    :goto_0
    return-void

    .line 39
    .end local v0    # "e":Ljava/io/IOException;
    :catch_0
    move-exception v0

    .line 40
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v1, "AppMoving"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to create /data/system/no-external-apps: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static isEnabled()Z
    .locals 2

    .prologue
    .line 29
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/system/no-external-apps"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static removeFile()V
    .locals 2

    .prologue
    .line 33
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/system/no-external-apps"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 34
    return-void
.end method

.method public static declared-synchronized setEnabled(Z)V
    .locals 2
    .param p0, "enable"    # Z

    .prologue
    .line 45
    const-class v1, Lcom/android/internal/util/slim/AppMoving;

    monitor-enter v1

    if-eqz p0, :cond_0

    .line 46
    :try_start_0
    invoke-static {}, Lcom/android/internal/util/slim/AppMoving;->removeFile()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    :goto_0
    monitor-exit v1

    return-void

    .line 48
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/android/internal/util/slim/AppMoving;->createFile()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
