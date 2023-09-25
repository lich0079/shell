now=`date`

if [ -d $1 ]; then
  fileCount=`ls -l $1 | grep "^-"  | wc -l`
  echo $now " init, " $1 " fileCount="$fileCount
  if [ $fileCount -eq 0 ]; then
    echo  "FileCount is 0 " $1
  else
    CMD=`rm -r  $1/* `
    if [ $? -eq 0 ]; then
      echo "rm succeed " $1
    else
      echo "rm failed" $1
    fi
    fileCount=`ls -l $1  | grep "^-"  | wc -l`
    echo $now " after rm, " $1 " fileCount="$fileCount
  fi
else 
  echo "Not dir or not exist " $1
fi