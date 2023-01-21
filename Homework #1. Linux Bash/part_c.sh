#!/bin/bash

TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

echo "Backup has started"
rsync -avv $1 $2 --log-file=backup_log.log
echo "Wait a sec, $USER"
sleep 1
echo -e "Backup has been finished. Check ~/Desktop/mylog.log \nCurrent time is $TIMESTAMP"
