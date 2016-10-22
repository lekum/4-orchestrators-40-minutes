docker network create --driver overlay wp-network
sleep 2
docker service create \
	--name db \
	--env MYSQL_ROOT_PASSWORD=wordpress,MYSQL_DATABASE=wordpress,MYSQL_USER=wordpress,MYSQL_PASSWORD=wordpress \
	--mount  type=volume,src=mysql-volume,dst=/var/lib/mysql \
	--network wp-network \
	mysql:5.7
sleep 2
docker service create \
	--name wordpress \
	--publish 8000:80 \
        --env WORDPRESS_DB_HOST=db:3306,WORDPRESS_DB_PASSWORD=wordpress \
	--network wp-network \
	wordpress:latest
