#/bin/sh

endTime=0
three=3
dur=0

FILES=/Users/lich/Downloads/xxx/*

for f in $FILES
do
    # get duration of a video in seconds
    endTime=`ffprobe -i ${f} -show_format -v quiet | sed -n "s/duration=//p"`
    # float to int
    endTimeInt=${endTime%.*}
    # minus 3 seconds which for tiktik brand
    dur=$(($endTimeInt - $three))
    echo $dur
    # generate the video with out tiktik part
    CMD=`ffmpeg  -ss -00:00   -to  ${dur}  -i  ${f}  ${f}__.mp4`

done
