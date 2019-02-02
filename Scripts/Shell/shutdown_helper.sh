#!/bin/sh
while ps -e | grep "<TASK>" > /dev/null; do # TODO: <TASK> 替换为相应的PID
  sleep 3
done
shutdown 10 

