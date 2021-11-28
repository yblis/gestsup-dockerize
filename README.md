# gestsup-dockerizé
Il s'agit d'un logiciel de ticketing [Gestsup](https://gestsup.fr/) dockerizé pour faciliter le déploiement.
---

Prérequis:

Avoir **docker** & **docker-compose** d'installer 

1. Récuperer les fichiers

```
git clone https://github.com/yblis/gestsup-dockerize.git gestsup
```

2. Se rendre sur le dossier gestsup

```
cd gestsup/
```
lancer le docker-compose pour créer le conteneur

```
docker-compose up -d --buil
```
Se connecter sur http://localhost:3010

Changez de port du fichier docker-compose.yml au besoin
