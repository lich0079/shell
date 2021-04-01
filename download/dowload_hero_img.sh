#!/bin/sh
# 使用while循环读取$1文本
while read -r line
do
 # CMD='curl -O ' ${line} ' '
 # echo 'xxxx $CMD'
 line2=$(echo $line | tr -d '\r')
 `wget https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/crops/${line2}.png`
 sleep 1
 # echo $CMD | bash
done < $1
echo "end"


# ./dowload_hero_img.sh    /heroes.json