#!/bin/bash
#   http webserver 
#   packge install config -yum -y install httpd
#   server config (echo "HTTPd web server" > /var/www/html/index.html)
#   enable server (systemctl enable httpd)
#   firewall config
#   SELinux

yum -y install httpd \
&& echo "<h1>httpd Webserver/h1" > /usr/share/httpd/html/index.html \ # i don't know root.
&& service httpd restart \
&& echo "[ OK ] Apache httpd Web server started"

curl localhost