#!/bin/sh
ip=$1
rm nohup.out
ps -ef|grep 6388|grep -v grep|awk '{print $2}'|xargs kill -9 
nohup ./client_darwin_amd64 -r "${ip}:4000" -l ":6388" -mode fast2 &

