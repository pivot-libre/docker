# docker
docker deployment of pivot-libre

## Installation

Before you start make sure you have [Docker](www.docker.com) installed.

`docker-compose up -d` will start the app

Go to [localhost:8000](localhost:8000)

`docker-compose down` will stop the app

## Note
The DB is saving its data to a docker volume that will be consistant between runs

## Advanced
Change the initial mysql root password by editing file `mysql/root_password.txt`

Change the database name / user / connection credentials by editing `docker-compose.yml` and `pivot/.env` (they must match)

To serve the app on a port other than 8000 on your host machine, edit `docker-compose.yml`:
for example, to serve the app on port 8080, change line 8 to `- "8080:8000"`
