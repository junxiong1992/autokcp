#!/bin/sh

# read -p "Do you wish to install this program?(y/n)" yn
# case $yn in
#     [Yy]* ) echo hello; break;;
#     [Nn]* ) exit;;
#     * ) echo "Please answer yes or no.";;
# esac

# ssh root@op "echo hello"
# result = ssh root@op "echo hello"
# echo $result


read  -n 1 -p "Do you want to install shadowsokcks? [y/default n] "
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# rsync -r ./ss root@${ip}:~/
	# ssh -t root@${ip} "cd ss;chmod +x shadowsocks-all.sh;./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log"; 
    echo -e ""
    echo -e "shadowsokcks installed"
fi