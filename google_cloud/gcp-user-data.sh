sudo su
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Hello From Google Cloud WEB Server</h1>" | sudo tee /var/www/html/index.html