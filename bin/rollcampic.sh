#!/bin/bash
if [ "`basename $1`" == "_snapshot.jpg" ]
then
  (sleep 1; mv $1 `dirname $1`/snapshot.jpg) &
fi

