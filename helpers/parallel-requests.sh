#!/bin/bash

cwd=`dirname "$0"`
expr "$0" : "/.*" > /dev/null || cwd=`(cd "${cwd}" && pwd)`

if [ $# -ne 2 ]
then
    echo "USAGE: $0 <URL> <CONCURRENT#>"
    exit 1;
fi

SEND_REQUESTS_CMD="${cwd}/send-requests.sh"
URL=$1
COUNT=$2
c=1
while [[ ${c} -le ${COUNT} ]];
do
  echo "Parallel# ${c}"
  ${SEND_REQUESTS_CMD} ${URL} 30 && echo "Done Parallel# ${c}" &
  (( c++ ))
  sleep 1
done

wait

