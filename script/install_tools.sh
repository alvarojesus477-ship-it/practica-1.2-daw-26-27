# Instalamos phpmyadmin y sus dependencias
sudo apt update
sudo apt install -y phpmyadmin php-mbstring php-zip php-gd php-json php-curl

# Habilitamos la extensión mbstring de PHP
sudo phpenmod mbstring
sudo systemctl restart apache2

# Como alternativa ligera a phpMyAdmin, instalamos Adminer, que consiste en un único archivo PHP.
# Creamos un directorio específico y descargamos la última versión de Adminer directamente en el directorio público de Apache.
sudo mkdir /var/www/html/adminer
cd /var/www/html/adminer
sudo wget -O /var/www/html/adminer/index.php https://www.adminer.org/latest.php

# Instalamos GoAccess, una herramienta de análisis de logs en tiempo real para servidores web.
sudo apt install goaccess -y