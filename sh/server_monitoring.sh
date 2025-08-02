#!/bin/bash

code_http=$(curl --write-out %{http_code} --silent --output /dev/null https://adopet-frontend-cypress.vercel.app/home)
echo code http $code_http

mount_point="/home"
name_log=$(date +%F-%H:%M)
directory="/home/emersonmachado"

disk_usage=$(df -h | grep $mount_point | awk '{print $5}')
echo "disk usage $disk_usage" > "$directory/$name_log.log"