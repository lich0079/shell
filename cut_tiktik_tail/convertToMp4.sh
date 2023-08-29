#/bin/sh


FILES=/Users/lich/Downloads/xxx/*

for f in $FILES
do
    CMD=`ffmpeg -i "${f}"  "${f}__.mp4"`

done
