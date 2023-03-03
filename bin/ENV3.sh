#!/bin/bash

. /root/bin/functions.sh

# telnet
echo "######## telnet #########"
pkgInst "telnet telnet-server"
svcEnable "telnet.socket"
# ftp server
echo "######## ftp server #########"
pkgInst "vsftpd ftp"
vsftpconf
svcEnable "vsftpd.service"
# ssh server
echo "######## ssh server #########"
pkgInst "openssh-server openssh-clients openssh"
sshconf
svcEnable "sshd.service"
# web server with nginx
echo "######## web server with nginx #########"
checkwebsvc "nginx"
pkgInst "nginx"
nginxconf
svcEnable "nginx.service"