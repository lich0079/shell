#   ./wget.sh     http://www.163.com/
for((i=0;i<2;i++))  
  do  
          for((j=0;j<=9;j++))  
            do  
                    for((k=0;k<=9;k++))  
                      do  
                          `wget  $1/$i$j$k.jpg`  
                      done  
            done  
  done  


#    curl -O https://blog-imgs-103.xxx.com/s/i/l/222/longer-\[01-30\].jpg