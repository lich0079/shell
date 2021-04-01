#/bin/sh


FILES=/Users/lich/Downloads/tmp/*

for f in $FILES
do
    CMD=`ffmpeg -i "${f}"  "${f}__.mp4"`

done
