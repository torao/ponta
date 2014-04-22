#!/bin/bash
for c in 2
do
  DIR=`dirname $0`/../cam0$c
  DATE=`date +\%Y\%m\%d --date "1 day ago"`

  # 20140409233514-00.jpg
  if [ -f $DIR/$DATE.mp4 ]
  then
    rm -f $DIR/$1*.flv
  fi
done
