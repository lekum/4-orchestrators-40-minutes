docker-compose bundle
docker stack deploy voting

docker service scale voting_worker=3
docker service update --publish-add 5000:80 voting_vote
docker service update --publish-add 5001:80 voting_result
