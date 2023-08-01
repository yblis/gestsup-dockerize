# gestsup-dockerized
This is a dockerized version of the ticketing software [Gestsup](https://gestsup.fr/) to simplify deployment.
---

Prerequisites:

Have **docker** & **docker-compose** installed.

1. Retrieve the files

```
git clone https://github.com/yblis/gestsup-dockerize.git gestsup
```

2. Navigate to the gestsup directory

```
cd gestsup/
```

Launch the docker-compose to create the containers

```
make install
```

Connect to http://localhost:3010

Change the port in the docker-compose.yml file if needed.
