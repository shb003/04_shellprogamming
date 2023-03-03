#!/bin/bash

Usage(){
    echo "Usage : $0 {httpd|nginx}"
    exit 1
}

[ $# -ne 1 ] && Usage
web=$1

case $web in
    'httpd') systemctl stop httpd ; /root/bin/httpd.sh ;;
    'nginx') systemctl stop nginx ; /root/bin/nginx.sh ;;
    *) Usage ;;
esac