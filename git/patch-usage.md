<!-- vim-markdown-toc GFM -->

* [Patch Usage In Git](#patch-usage-in-git)
    * [git diff](#git-diff)
        * [Generate Patch](#generate-patch)
        * [Apply Patch](#apply-patch)
    * [git format-patch](#git-format-patch)
        * [Generate Patch](#generate-patch-1)
        * [Apply Patch](#apply-patch-1)

<!-- vim-markdown-toc -->

# Patch Usage In Git

## git diff

`git diff` (仅包含文件差异)

### Generate Patch

```sh
# 生成两个特定 commit 之间的变更
git diff commit1 commit2 > patch文件.patch

# 生成从 commitA 到 commitB 的 patch
git diff abc123 def456 > mypatch.patch

# 生成最近两次提交之间的 patch
git diff HEAD~2 HEAD > last2.patch

# 生成从某个 commit 到 HEAD 的 patch
git diff abc123 HEAD > changes.patch
```

### Apply Patch

```sh
# 检查 patch 是否可以应用
git apply --check patch文件.patch

# 应用 patch
git apply patch文件.patch

# 反向应用（撤销 patch）
git apply -R patch文件.patch
```

## git format-patch

`git format-patch` (文件差异、提交信息)

### Generate Patch

```sh
# 使用更常见的格式（包含提交信息等元数据）
git format-patch commit1..commit2

# 生成单个 commit 的 patch
git format-patch -1 commit_id

# 生成多个 commit 的 patch（每个 commit 生成一个文件）
git format-patch start_commit..end_commit

# 输出到特定目录
git format-patch -o patches/ commit1..commit2
```

### Apply Patch

```sh
# 应用单个 patch（会生成新的 commit）
git am patch文件.patch

# 应用多个 patch
git am patches/*.patch

# 遇到冲突时解决后继续
git am --continue
# 跳过当前 patch
git am --skip
# 终止 am 操作
git am --abort
```
