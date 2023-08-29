while read -r line
do
 line2=$(echo $line | tr -d '\r')
 port=`expr $line % 10 + 6664`
 echo $port
 result=`curl http://312.217.315.473:${port}/xxx/get?key=${line2} | wc -l`
 echo $result
 if [ $result > 1 ]; then
   str="$line2 yes"
   echo $str >> out.txt
 else
   str="$line2 no"
   echo $str >> out.txt
 fi
 sleep 1
 # echo $CMD | bash
done < $1
echo "end"