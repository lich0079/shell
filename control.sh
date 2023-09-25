day1=`date --date='1 days ago' '+/%Y/%m/%d'`
day2=`date --date='2 days ago' '+/%Y/%m/%d'`
day3=`date --date='3 days ago' '+/%Y/%m/%d'`
day4=`date --date='4 days ago' '+/%Y/%m/%d'`
day5=`date --date='5 days ago' '+/%Y/%m/%d'`

day6=`date --date='6 days ago' '+/%Y/%m/%d'`
day7=`date --date='7 days ago' '+/%Y/%m/%d'`
day8=`date --date='8 days ago' '+/%Y/%m/%d'`
day9=`date --date='9 days ago' '+/%Y/%m/%d'`
day10=`date --date='10 days ago' '+/%Y/%m/%d'`


today=`date --date='0 days ago' '+-%Y-%m-%d'`

start=`date`
echo $start
CMD=`nohup  /home/developer/archive_worker.sh  /myapp$day6  >> /data/logs/archived$today.log      &`
CMD=`nohup  /home/developer/archive_worker.sh  /myapp$day7  >> /data/logs/archived$today.log      &`
CMD=`nohup  /home/developer/archive_worker.sh  /myapp$day8  >> /data/logs/archived$today.log      &`
CMD=`nohup  /home/developer/archive_worker.sh  /myapp$day9  >> /data/logs/archived$today.log      &`
CMD=`nohup  /home/developer/archive_worker.sh  /myapp$day10  >> /data/logs/archived$today.log      &`
CMD=`nohup  /home/developer/archive_worker.sh  /myapp$day2  >> /data/logs/archived$today.log      &`
CMD=`nohup  /home/developer/archive_worker.sh  /myapp$day3  >> /data/logs/archived$today.log      &`
CMD=`nohup  /home/developer/archive_worker.sh  /myapp$day4  >> /data/logs/archived$today.log      &`
CMD=`nohup  /home/developer/archive_worker.sh  /myapp$day5  >> /data/logs/archived$today.log      &`
/home/developer/archive_worker.sh  /myapp$day1  >> /data/logs/archived$today.log
end=`date`
echo $end


day21=`date --date='21 days ago' '+/%Y/%m/%d'`
day22=`date --date='22 days ago' '+/%Y/%m/%d'`
day23=`date --date='23 days ago' '+/%Y/%m/%d'`
day24=`date --date='24 days ago' '+/%Y/%m/%d'`
day25=`date --date='24 days ago' '+/%Y/%m/%d'`

/home/developer/delete.sh  /myapp$day21  >> /data/logs/archived$today.log
/home/developer/delete.sh  /myapp$day22  >> /data/logs/archived$today.log
/home/developer/delete.sh  /myapp$day23  >> /data/logs/archived$today.log
/home/developer/delete.sh  /myapp$day24  >> /data/logs/archived$today.log
/home/developer/delete.sh  /myapp$day25  >> /data/logs/archived$today.log