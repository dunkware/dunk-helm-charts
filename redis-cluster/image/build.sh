echo "Building Redis Cluster Container..."
docker build -f mulitModuleRedis.dockerfile -t testrock1:31000/redis-bitnami:cluster-r07 ./
docker push testrock1:31000/redis-bitnami:cluster-r07
