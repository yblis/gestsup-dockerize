# Docker GestSup (Traefik + PHP 8.1 ready)
Il s'agit d'un logiciel de ticketing [Gestsup](https://gestsup.fr/) dockerisé pour faciliter le déploiement.
---

Prérequis:

Avoir **docker** & **docker-compose** d'installer 

1. Récuperer les fichiers

```
git clone https://github.com/jeremybessard/gestsup-docker.git gestsup
```

2. Se rendre sur le dossier gestsup

```
cd gestsup/
```
lancer le docker-compose pour créer les conteneurs

```
make install
```

Changez de port du fichier docker-compose.yml au besoin
