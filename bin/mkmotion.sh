#!/bin/bash

while [ "$1" != "" ]
do
  for c in 2
  do
    DIR=`dirname $0`/../cam0$c

    # *.flv to *.mp4
    files=`find $DIR -name $1*.flv | sort`
    if [ "$files" != "" ]
    then
      for f in $files; do /usr/local/bin/avconv -y -r 3 -i $f -r 24 $f.mpg; done
      cat $DIR/$1*.flv.mpg > $DIR/$1.mpg
      /usr/local/bin/avconv -y -r 24 -i $DIR/$1.mpg -r 24 $DIR/$1.mp4
      rm $DIR/$1*.mpg
    fi

#    FILES=`find $DIR -name $1*.jpg | sort`
#    if [ "$FILES" != "" ]
#    then
#      i=0
#      for f in $FILES
#      do
#        cp $f $DIR/_$1-$i.jpg
#        i=$((i+1))
#      done
#      # /usr/local/bin/avconv -y -r 1.5 -i $DIR/_$1-%d.jpg -r 24 -vsync cfr $DIR/$1.mp4
#      /usr/local/bin/avconv -y -r 1 -i $DIR/_$1-%d.jpg -vf format=rgb8,format=rgb24 -pix_fmt rgb24 -s qvga -r 2 $DIR/$1.gif
#      rm -f $DIR/_$1-*.jpg
#    fi
  done
  shift
done

