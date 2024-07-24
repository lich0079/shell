#!/bin/bash

# Define the file path
FILE_PATH=$1
# Read the file content into a variable
file_content=$(cat "$FILE_PATH")

# Convert commas to newlines and process each UID
echo "$file_content" | tr ',' '\n' | while IFS= read -r uid
do
  uid_without_quote=${uid//\"/}
  body="{\"settingsReqBody\":{\"labelReq\":{\"labelCode\":\"TO_TEST\",\"labelValue\":\"false\"}},\"reqHeader\":{\"reqId\":\"reqId-for-test-$uid_without_quote\",\"action\":\"ToTest\",\"userId\":$uid}}"
  CMD="grpcurl -d '$body' -plaintext 192.168.1.13:9999 com.lich0079.TradingService.RequestProcess"

  # Print the processed UID
  echo $CMD
  eval $CMD
  sleep 0.1
done