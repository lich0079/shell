function read_dir(){

start=`date`

startTimestamp=$(date "+%s")

initLogFileCount=`ls -l $1 |  grep  -e ".*log$"  | wc -l`

if [ $initLogFileCount -eq 0 ]; then
    echo $1  " *.log initLogFileCount is " $initLogFileCount
    return 0
fi

echo $start " processing " $1   ", initLogFileCount="$initLogFileCount

archiveCount=0

deleteCount=0

for file in `ls -rth $1 |  grep  -e ".*log$"`
do
  currentTimestamp=$(date '+%s')
  passTime=$[$currentTimestamp - $startTimestamp]
  if [ $passTime -gt 84600 ]; then
    echo "time is up, processed " $1 " start="$start ", initLogFileCount="$initLogFileCount ", archiveCount="$archiveCount ", deleteCount="$deleteCount 
    return 0
  fi 

 if [ -d $1"/"$file ]; then
    echo "processing dir " $1"/"$file
    read_dir $1"/"$file
 else
    remainLogFileCount=`ls -l $1 |  grep  -e ".*log$" | wc -l`
    now=`date`
    echo $now " processing file " $1"/"$file   ", remainLogFileCount="$remainLogFileCount ", archiveCount="$archiveCount ", deleteCount="$deleteCount   ", initLogFileCount="$initLogFileCount  ", passSecs="$passTime
    if [[ "$file" == *.log && -f "${1}/$file" ]]; then
        if [ ! -f "${1}/$file".gz ]; then
            CMD=`gzip -c "${1}/$file" > "${1}/$file".gz  `
            if [ $? -eq 0 ]; then
                archiveCount=$((archiveCount + 1))
                echo "archive succeed " $1"/"$file
                CMD=`rm  "${1}/$file"`
                if [ $? -eq 0 ]; then
                    deleteCount=$((deleteCount + 1))
                    echo "rm succeed " $1"/"$file
                else
                    echo "rm failed" $1"/"$file
                fi
            else
                echo "archive failed" $1"/"$file
            fi
        else
            echo "already exist " $1"/"$file ".gz"
        fi
    #else
       # echo  "file not exist or not .log file " $1"/"$file
    fi
 fi
done

end=`date`

remainLogFileCount=`ls -l $1 |  grep  -e ".*log$" | wc -l`

echo "processed " $1 " start="$start ", end="$end  ", initLogFileCount="$initLogFileCount ", archiveCount="$archiveCount ", deleteCount="$deleteCount    ", remainLogFileCount="$remainLogFileCount
} 
#读取第一个参数
read_dir $1