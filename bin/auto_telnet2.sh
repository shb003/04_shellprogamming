#!/bin/bash

cat /root/bin/server.txt | while read IP1 UNAME UPASS
do
a() {
	sleep 2 ; echo "$UNAME"
	sleep 1 ; echo "$UPASS"
	sleep 1 ; echo 'hostname'
	sleep 1 ; echo 'ls -l'
	sleep 1 ; echo 'exit'
}
a | telnet $IP1
done