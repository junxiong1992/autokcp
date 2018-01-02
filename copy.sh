#!/bin/sh

ip=$1

### generate ssh key local
if [ ! -f ~/.ssh/id_rsa.pub ];then
	ssh-keygen -t  rsa
	echo "generate ssh key local successful"
fi
ssh-copy-id -i ~/.ssh/id_rsa.pub  root@${ip}

### install shadowsokcks
read  -n 1 -p "Do you want to install shadowsokcks? [y/default n] "
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -r ./ss root@${ip}:~/
	ssh -t root@${ip} "cd ss;chmod +x shadowsocks-all.sh;./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log"; 
    echo "shadowsokcks installed"
fi

### start kcp on server
rsync -r ./kcptun root@${ip}:~/
ssh -t root@${ip} "cd kcptun;sh kcp-server.sh;ps -ef|grep 4000|grep -v grep"

### start kcp on local
ps -ef|grep 6388|grep -v grep|awk '{print $2}'|xargs kill -9
nohup ./client_darwin_amd64 -r "${ip}:4000" -l ":6388" -mode fast2 &
ps -ef|grep 6388|grep -v grep
