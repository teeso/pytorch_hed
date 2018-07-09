#!/bin/bash

#python train.py --batchSize 4

set -x   #把本行后的脚本执行内容，打印到屏幕。用于调试
set -e   #本行后，如果某行执行结果返回值不是true，那么终止

LOG="log.train.2018.07.09"
touch $LOG
rm $LOG

exec &> >(tee -a "$LOG")   #将屏幕输出内容，同时写入log文件：便于后续查找

echo "Logging to $LOG"

python train.py
