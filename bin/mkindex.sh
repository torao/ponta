#!/bin/bash
dir=`dirname $0`/..
for i in 02
do
  cat /dev/null > $dir/cam$i.txt
  for f in `find $dir/cam$i/ \( -name '*.gif' -o -name '????????.mpg' -o -name '*.mp4' \) | sort | tail -n 60`
  do
    echo "`basename $f` `wc -c $f | awk '{print $1}'`" >> $dir/cam$i.txt
  done
done
