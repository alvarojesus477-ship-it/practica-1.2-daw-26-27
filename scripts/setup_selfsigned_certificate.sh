#!/bin/bash
set -x
# Importamos las variables de entorno
source .env

# Creamos el certificado autofirmado
sudo openssl req \
  -x509 \
  -nodes \
  -days 365 \
  -newkey rsa:4096 \
  -keyout /etc/ssl/private/apache-selfsigned.key \
  -out /etc/ssl/certs/apache-selfsigned.crt \
  -subj "/C=$OPENSSL_COUNTRY/ST=$OPENSSL_PROVINCE/L=$OPENSSL_LOCALITY/O=$OPENSSL_ORGANIZATION/OU=$OPENSSL_ORGUNIT/CN=$OPENSSL_COMMON_NAME/emailAddress=$OPENSSL_EMAIL"

# Copiamos el archivo de configuración del virtual host SSL a la ubicación de Apache
cp ../conf/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

#habilitamos el virtual host de apache para SSL y el módulo SSL
a2ensite default-ssl.conf
sudo a2enmod ssl

#Reiniciamos el servicio de Apache para aplicar los cambios
sudo systemctl restart apache2