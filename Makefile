# Installation de gestsup
install:
	docker-compose up -d --build

# installation ou mise à jour
realright:
	find ./html/ -type d -exec chmod 750 {} \; 
	find ./html/ -type f -exec chmod 640 {} \;
	chmod 770 -R ./html/upload
	chmod 770 -R ./html/images/model
	chmod 770 -R ./html/backup
	chmod 770 -R ./html/_SQL
	chmod 660 ./html/connect.php
	chown -R www-data:www-data ./html/sessions
  
# Modification de droit pour MAJ gestsup
majright:
	chmod -R 777 .
  
# démarrer nginx
restart:
	docker compose restart
	
# lance le shell
shell:
	docker-compose exec gestsup /bin/bash
