#!/bin/bash

if [ $# -ne 2 ]
then
    echo "USAGE: $0 <URL> <COUNT>"
    exit 1;
fi

URL=$1
COUNT=$2
c=1
while [[ ${c} -le ${COUNT} ]];
do
  echo "Sending GET request: ${URL}"
  curl -o /dev/null -w '%{http_code}\n' -s ${URL}
  (( c++ ))
  sleep 1
done
