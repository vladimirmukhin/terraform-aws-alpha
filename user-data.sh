#!/bin/bash
yum update -y
yum install -y httpd
echo "Hello World!!!" > /var/www/html/index.html
systemctl start httpd && systemctl enable httpd
