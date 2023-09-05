#!/bin/bash

buff_cache=`free -h | awk '{printf $6}'`
cache=`echo ${buff_cache#*available} |grep -oP '\d+\.?\d*'`
max_cache="8"

if [[ `echo "$cache >= $max_cache" | bc` -eq 1 ]]; then
	echo $buff_cache > /wikitrade/shell/1.txt
	echo 1 > /proc/sys/vm/drop_caches
fi

