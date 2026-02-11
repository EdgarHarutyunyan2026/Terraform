#!/bin/bash
yum -y update
yum -y install httpd
echo "<h2>Scrip  WebServer for Terraform ! </h2><br>Build by     Teeraform !" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on

