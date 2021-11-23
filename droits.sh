find ./html/ -type d -exec chmod 750 {} \; 
find ./html/ -type f -exec chmod 640 {} \;
chmod 770 -R ./html/upload
chmod 770 -R ./html/images/model
chmod 770 -R ./html/backup
chmod 770 -R ./html/_SQL
chmod 660 ./html/connect.php