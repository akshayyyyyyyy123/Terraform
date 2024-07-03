#!/bin/bash
yum update -y
yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
cat <<EOF | sudo tee /var/www/html/index.html
<html>
  <head>
    <title>Hello World</title>
  </head>
  <body>
    <h1>Hello World</h1>
    <p>IP Address: $(hostname -I | awk '{print $1}')</p>
  </body>
</html>
EOF
echo "Apache server has been installed."
echo "You can access the 'Hello World' page at http://$(hostname -I | awk '{print $1}')"
