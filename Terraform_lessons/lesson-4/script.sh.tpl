#!/bin/bash
yum -y update
yum -y install httpd

cat <<EOF > /var/www/html/index.html
<html>
<h2>Build by Power of Terraform <font color="red"> v8.12</font></h2><br>
Owner ${f_name} ${l_name} <br>

%{ for x in name ~}
Hello ${x}<br>
%{ endfor ~}
</html>
EOF

sudo service httpd start
chkconfig httpd on

