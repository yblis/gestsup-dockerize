#!/bin/bash
wget -P /var/www/html https://gestsup.fr/downloads/versions/current/version/gestsup_$GESTSUP_VERSION.zip
unzip /var/www/html/gestsup_$GESTSUP_VERSION.zip -d /var/www/html
rm /var/www/html/gestsup_$GESTSUP_VERSION.zip
rm /var/www/html/index.html


adduser gestsup --ingroup www-data
chown -R gestsup:www-data /var/www/html
find /var/www/html/ -type d -exec chmod 750 {} \; 
find /var/www/html/ -type f -exec chmod 640 {} \;
chmod 770 -R /var/www/html/upload
chmod 770 -R /var/www/html/images/model
chmod 770 -R /var/www/html/backup
chmod 770 -R /var/www/html/_SQL
chmod 660 /var/www/html/connect.php


adduser gestsup --ingroup www-data
chown -R gestsup:www-data /var/www/html
find /var/www/html/ -type d -exec chmod 750 {} \; 
find /var/www/html/ -type f -exec chmod 640 {} \;
chmod 770 -R /var/www/html/upload
chmod 770 -R /var/www/html/images/model
chmod 770 -R /var/www/html/backup
chmod 770 -R /var/www/html/_SQL
chmod 660 /var/www/html/connect.php
# Masquez la version d'apache utilisez. Passer "ServerTokens" à "Prod" et "ServerSignature" à "Off" dans security.conf.

FILE="/etc/apache2/conf-available/security.conf"

# Utilisation de grep pour trouver les lignes contenant chaque ligne requise
CHECK_SERVER_TOKENS=$(grep ^ServerTokens "$FILE")
CHECK_SERVER_SIGNATURE=$(grep ^ServerSignature "$FILE")

# Indiquez à quoi ressemble la bonne configuration.  Elles seront utilisées dans la recherche et le remplacement.
TOKENPROD="ServerTokens Prod"
SIGNATUREOFF="ServerSignature Off"


if [ -z "$CHECK_SERVER_TOKENS" ]; then # si $CHECK_SERVER_TOKENS est vide alors
  echo "$TOKENPROD" >> "$FILE" # Ajoute $TOKENPROD à la fin du fichier

elif [ "$CHECK_SERVER_TOKENS" != "$TOKENPROD" ]; then # SINON SI $CHECK_SERVER_TOKENS Différent de $TOKENPROD
  
  sed -i 's/'"$CHECK_SERVER_TOKENS"'/'"$TOKENPROD"'/g' "$FILE" # remplace la chaine de caractere
fi

if [ -z "$CHECK_SERVER_SIGNATURE" ]; then # si $CHECK_SERVER_SIGNATURE est vide alors
  echo "$SIGNATUREOFF" >> "$FILE" # Ajoute $SIGNATUREOFF à la fin du fichier
elif [ "$CHECK_SERVER_SIGNATURE" != "$SIGNATUREOFF" ]; then # SINON SI $CHECK_SERVER_SIGNATURE Différent de $SIGNATUREOFF

  sed -i 's/'"$CHECK_SERVER_SIGNATURE"'/'"$SIGNATUREOFF"'/g' "$FILE" # remplace la chaine de caractere
fi

exec apachectl -D "FOREGROUND"
