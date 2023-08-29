x=1
while [ $x -le 60000 ]
do
  now=`date`
  echo $now >> jmap.txt
  pid=`ps -ef  |  grep app.jar |grep -v grep | awk '{print $2}'`
  echo $pid >> jmap.txt
  CMD=`jmap -histo $pid |  head -n 15  >>  jmap.txt`
  x=$(( $x + 1 ))

  sleep 60
done