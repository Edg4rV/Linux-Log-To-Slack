#!/bin/bash

#how use this script - ./log_send_slack.sh "file.log" "https://hooks.slack.com/services/...";

#slack channel hook - https://hooks.slack.com/services/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

#Run instruction - nohup /ecommerce/var/log_send_slack.sh "/ecommerce/sapmarketplace/core-customize/hybris/log/tomcat/console-20211013.log" "https://hooks.slack.com/services/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"  " ERROR " > marketplace.log 2>&1 &

#file-name  ex. "console-20211013.log"

tail -n0 -F "$1" | while read LINE; do
  (echo "$LINE" | grep -e "$3") && curl -X POST --silent --data-urlencode \
    "payload={\"text\": \"$(echo $LINE | sed "s/\"/'/g")\"}" "$2";
#sleep 30
done
