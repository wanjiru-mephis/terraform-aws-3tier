#! /bin/bash
# Update system packages
sudo yum update -y

# Install Apache
sudo yum install -y httpd

# Enable & start Apache
sudo systemctl enable httpd
sudo systemctl start httpd

# Remove default Apache test page
sudo rm -f /etc/httpd/conf.d/welcome.conf
sudo rm -f /usr/share/httpd/noindex/index.html

# Create root index.html
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
  <body style="background-color:rgb(250, 210, 210);">
    <h1>Welcome to Apache Web server -APP-1</h1>
    <p>Terraform Demo</p>
    <p>Application Version: v1</p>
  </body>
</html>
EOF

# Create app1 directory
sudo mkdir -p /var/www/html/app1

# Create app1/index.html
cat <<EOF | sudo tee /var/www/html/app1/index.html
<!DOCTYPE html>
<html>
  <body style="background-color:rgb(220, 240, 250);">
    <h1>Welcome to APP-1 Subdirectory</h1>
    <p>This is a nested app page served from /app1.</p>
  </body>
</html>
EOF

# Get IMDSv2 token
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Save EC2 metadata (with <pre> for readability)
echo "<pre>" | sudo tee /var/www/html/app1/metadata.html
curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/dynamic/instance-identity/document \
  | sudo tee -a /var/www/html/app1/metadata.html
echo "</pre>" | sudo tee -a /var/www/html/app1/metadata.html
