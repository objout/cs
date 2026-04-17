#!/bin/bash

TEX_FILES=contents/chapters/*.tex
fig_cnt=$(grep -n '\s*begin{figure' $TEX_FILES | wc -l)
tab_cnt=$(grep -n '\s*begin{\(long\)*table' $TEX_FILES | wc -l)

echo "Figure Count: $fig_cnt"
echo "Table Count: $tab_cnt"
