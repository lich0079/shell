#/bin/sh

PATH=/Users/lich/Downloads/tmp/

FILES=$PATH*


CMD=`/bin/rm "${PATH}"mylist.txt`

for f in $FILES
do
    echo "file ${f}" >> ${PATH}mylist.txt
done

CMD=`/usr/local/bin/ffmpeg  -f concat -safe 0 -i "${PATH}"mylist.txt -c copy "${PATH}"output.mp4`
