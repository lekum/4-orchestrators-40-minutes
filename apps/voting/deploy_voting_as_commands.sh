docker network create --driver overlay voteapp

docker service create \
	--name vote \
	--publish 5000:80 \
	--network voteapp \
        lachlanevenson/examplevotingapp_vote:latest python app.py

docker service create \
	--name redis \
	--network voteapp \
	redis:alpine

docker service create \
	--name db \
	--network voteapp \
	postgres:9.4

docker service create \
	--name result \
	--publish 5001:80 \
	--network voteapp \
	lachlanevenson/examplevotingapp_result:latest nodemon --debug server.js

docker service create \
	--name worker \
	--network voteapp \
	--replicas 3 \
	lachlanevenson/examplevotingapp_worker:latest
