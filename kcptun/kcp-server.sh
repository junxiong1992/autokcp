#!/bin/sh
rm nohup.out
ps -ef|grep 4000|grep -v grep|awk '{print $2}'|xargs kill -9
nohup ./server_linux_amd64 -t "127.0.0.1:6388" -l ":4000" -mode fast2 &
