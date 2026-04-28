#!/bin/bash

# 和 latexmkrc 配合使用，将 LaTeX 的源代码和编译过程输出的文件分开存放
# 使用共享内存
#export TL_HOME=/run/user/$(id -u)/texlive
export TL_HOME=/dev/shm/texlive

if [ ! -d "$TL_HOME" ] ; then
  mkdir -p $TL_HOME/{var,tmp,out}
fi

export TEXMFVAR=$TL_HOME/var

# 临时目录
export TMP=$TL_HOME/tmp
export TEMP=$TL_HOME/tmp

# 设置编译输出目录
export TL_BUILD_DIR=$TL_HOME/out
