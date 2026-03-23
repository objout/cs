#!/usr/bin/env bash

# 假设:
# 本地分支 main, 远程分支 origin/main
# (1). 本地有 a->b->c->d commit 历史
# (2). 远程有 a->b->e->f->g commit 历史
# 目标:
# 获取远程更新(e->f->g)，推送本地更新(c->d)
# 方法:
# 1. 用 rebase 保持线性历史
# 2. 用 merge 生成合并提交

# 1. 用 rebase 保持线性历史
# 最终效果: a->b->e->f->g->c->d
# a. 拉取远程最新信息
git fetch origin
# b. 在远程最新信息的基础上重放本地的新提交
git rebase origin/main
# c. 若 rebase 过程出现冲突则:
#    c1. 编辑冲突文件, 解决冲突
#    c2. git add <file path> 标记冲突已解决
#    c3. git rebase --continue
#    c4. 重复直到 rebase 完成
# d. rebase 完成后推送到远程
# --force-with-lease 会检查远程分支是否被他人更新过，防止覆盖别人工作
git push origin main --force-with-lease

# 2. 用 merge 保留完整分支历史, 产生合并提交
# a. 拉取远程更新并合并
# 等价于 git fetch + git merge
git pull origin main
# b. 解决冲突
git add .
git commit -m "Merge remote changes"
git push origin main

# 方案对比
# 历史效果:
# - rebase: 线性、整洁
# - merge: 保留分支分叉和合并点
# 优点:
# - rebase: 历史清晰、无多余合并节点
# - merge: 完整记录合作过程
# 适用场景:
# - rebase: 个人分支, 希望保持干净历史
# - merge: 多人协作, 保留真实合并记录
