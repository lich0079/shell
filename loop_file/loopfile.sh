#!/bin/sh
# 使用while循环读取$1文本
while read -r line
do
 # CMD='curl -O ' ${line} ' '
 # echo 'xxxx $CMD'
 line2=$(echo $line | tr -d '\r')
 `wget $line2`
 sleep 61
 # echo $CMD | bash
done < $1
echo "end"
