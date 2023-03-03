#!/bin/bash

cat /root/bin/server.txt | while read IP1 UNAME UPASS
ALIVELIST=/root/bin/alive.txt
do
    ping -c 1 -W 1 $IP1 > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
    echo " [ OK ] $IP1 alive"
    echo "$IP1" >> $ALIVELIST
    else
    echo " [ FAIL ] $IP1 die"
    fi
done

CMD() {
    sleep 1; echo 'root'
    sleep 1; echo 'centos'
    sleep 0.5; echo 'poweroff'
    sleep 0.5; echo 'exit'
}
cat "$ALIVELIST" | while read IP1
do
    CMD | telnet $IP1
done