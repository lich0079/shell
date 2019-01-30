#!/bin/bash

FILES=/Users/xxx/Pictures/mina/*
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  IMAGE="'image=@${f}'"
  CMD='curl -x en-ec-001:80 -F '${IMAGE}' -F "board=xxx/yyy" -F "note=beauty lady"  -F "link=http://xxx.appspot.com"    https://api.pinterest.com/v1/pins/?access_token=Ak3F_ofkSBkT31GvEYYmfV3G0F_XFxxX6SsBj6yM5FdHX-PaB3XwcGwDAAABtXRXR5sMlAZlwAAAAA'
  # echo $IMAGE
  # echo "$CMD"
  echo $CMD | bash
  mv  $f   '/Users/xxx/tmp'
  sleep 361
done




