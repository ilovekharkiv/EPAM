#!/bin/bash

TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

echo "Backup has started"
rsync -ar --delete $1 $2 --log-file=$HOME/Desktop/backup_log.log
echo "Wait a sec, $USER"
sleep 1
echo -e "Backup has been finished. Current time is $TIMESTAMP"
