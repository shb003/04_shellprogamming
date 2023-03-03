#!/bin/bash

IP1=server1
UNAME=root
UPASS=centos
a() {
	sleep 2 ; echo "$UNAME"
	sleep 1 ; echo "$UPASS"
	sleep 1 ; echo "tar cvzf /tmp/$IP1.tar.gz /home"
	sleep 1 ; echo 'exit'
}
a | telnet $IP1

    ftp -n $IP1 << EOF
    user $UNAME $UPASS
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mput $IP1.tar.gz
    quit
EOF