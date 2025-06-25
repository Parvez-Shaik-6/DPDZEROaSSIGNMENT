use the following url to run compose setup


mkdir -p nginx


curl -o nginx/nginx.conf https://raw.githubusercontent.com/Parvez-Shaik-6/DPDZEROaSSIGNMENT/main/nginx/nginx.conf


curl -O https://raw.githubusercontent.com/Parvez-Shaik-6/DPDZEROaSSIGNMENT/URL/docker-compose.yml


docker-compose -f docker-compose.yml up


once done for clean up

sudo docker-compose down --volumes --remove-orphans

sudo docker system prune -a --volumes -f

sudo docker rm -f $(docker ps -aq)

sudo docker rmi $(sudo docker images -q)

sudo docker volume rm $(docker volume ls -q)

sudo docker network rm $(docker network ls -q)
