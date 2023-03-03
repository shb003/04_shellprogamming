#!/bin/bash

. /root/bin/functions.sh



IP1=192.168.10.2
IP2=8.8.8.8
IP3=www.google.com

# 1. local network
print_info "(1) ping $IP1"
ping -c 1 $IP1 -w 2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "[  OK  ] Local Network Connection "
else
    print_error "[  FAIL ] Local Network Connection" 
    echo "  check for physical connection"
    echo "  # ethtool <NIC>"
    echo "  check for IP/NETMASK"
    echo "  # ip addr"
    echo "  configuraion for VMware VMnet8"
    echo "  VMware > Edit >Virtual Network Editor > VMnet8 > 192.168.10.0/255.255.255.0"
    echo "  check for vmware service"
    echo "  service.msc >VMware* check"
fi
# 2. external network
print_info "(2) ping $IP2"
ping -c 1 $IP2 -w 2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "[  OK  ] external Network Connection "
else
    print_error "[  FAIL ] external Network Connection" 
    echo "  (a) ip route (netstat -nr)"
fi
# 3. dns client network
print_info "(3) ping $IP3"
ping -c 1 $IP3 -W 2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "[  OK  ] dns client Connection "
else
    print_error "[  FAIL ] ns client Connection" 
    echo "  (a) cat /etc/resolv.conf"
fi