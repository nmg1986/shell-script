#!/bin/bash
##nginx配置文件分割脚本
##分割nginx虚拟主机

echo -n "do it..."
csplit all-server.conf -s '/\s*\<server\>\s*/' {*}
for file in xx*
do
    if grep -qw server_name $file
    then
        result=$(grep -w server_name $file |  awk '{print $2}' | tr -d ';')
        mv $file $result
    else
        rm $file
    fi
done
echo "done"
