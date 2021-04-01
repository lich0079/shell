#!/bin/bash

FILES=/Users/xxx/Pictures/mina/*
for f in $FILES
do
  echo "Processing $f file..."

  IMAGE="'image=@${f}'"
  
  R=$(( RANDOM % (4) ))
  echo $R
  if [ $R == 1 ]
  then
      CMD='curl -x en-ec-001:80 -F '${IMAGE}' -F "board=xxx/yyy" -F "note=beauty lady"  -F "link=http://xxx.appspot.com"    https://api.pinterest.com/v1/pins/?access_token=Ak3F_ofkSBkT31GvEYYmfV3G0F_XFxxX6SsBj6yM5FdHX-PaB3XwcGwDAAABtXRXR5sMlAZlwAAAAA'
  else
      CMD='curl -x socks5h://localhost:1080 -F '${IMAGE}' -F "board=xxx/yyy" -F "note=beauty lady"  -F "link=http://yyy.appspot.com"    https://api.pinterest.com/v1/pins/?access_token=Ak3F_ofkSBkT31GvEYYmfV3G0F_XFxxX6SsBj6yM5FdHX-PaB3XwcGwDAAABtXRXR5sMlAZlwAAAAA'
  fi

  echo $CMD | bash
  if [ $? -eq 0 ]; then
    mv  $f   '/Users/xxx/tmp_lich'
    sleep 361
  else
    echo "upload fail"
  fi
done




