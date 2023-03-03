#!/bin/bash
#   http webserver 
#   packge install config -yum -y install httpd
#   server config (echo "HTTPd web server" > /var/www/html/index.html)
#   enable server (systemctl enable httpd)
#   firewall config
#   SELinux

yum -y install nginx \
&& echo "<h1>nginx Webserver/h1" > /usr/share/nginx/html/index.html \
&& service nginx restart \
&& echo "[ OK ] Apache Nginx Web server started"

curl localhost