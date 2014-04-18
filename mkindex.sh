#!/bin/bash
dir=`dirname $0`
for i in 01 02
do
  cat /dev/null > $dir/cam$i.txt
  for f in `find $dir/cam$i/ \( -name '*.gif' -o -name '????????.mpg' -o -name '*.mp4' \) | sort`
  do
    echo "`basename $f` `wc -c $f | awk '{print $1}'`" >> $dir/cam$i.txt
  done
done
