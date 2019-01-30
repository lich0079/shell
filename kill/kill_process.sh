ps -ef |  grep  'XXXService' | awk 'NR==1{print $2}' | xargs kill -9
echo "kill xxx plan" >> /Users/xxx/kill.log

