ROOT=/home/mtadmin/ambar
mkdir $ROOT
cd $ROOT
git clone https://github.com/hsarma/ambar.git
mkdir -p data/db data/es data/rabbit data/crawl  
cd MongoDB
docker build . -t ambar-mongodb:2.1
docker tag ambar-mongodb:2.1 localhost:5000/ambar-mongodb:2.1
cd ../ElasticSearch
docker build . -t ambar-es:2.1
docker tag ambar-es:2.1 localhost:5000/ambar-es:2.1
cd ../Rabbit
docker build . -t ambar-rabbit:2.1
docker tag ambar-rabbit:2.1 localhost:5000/ambar-rabbit:2.1
cd ../Redis
docker build . -t ambar-redis:2.1
docker tag ambar-redis:2.1 localhost:5000/ambar-redis:2.1
cd ../ServiceApi
docker build . -t ambar-serviceapi:2.1
docker tag ambar-serviceapi:2.1 localhost:5000/ambar-serviceapi:2.1
cd ../WebApi 
docker build . -t ambar-webapi:2.1
docker tag ambar-webapi:2.1 localhost:5000/ambar-webapi:2.1
cd ../FrontEnd
export PORT=8080
npm install
npm run compile
docker build . -t ambar-frontend:2.1
docker tag ambar-frontend:2.1 localhost:5000/ambar-frontend:2.1
cd ../Pipeline
docker build . -t ambar-pipeline:2.1
docker tag ambar-pipeline:2.1 localhost:5000/ambar-pipeline:2.1
cd ../LocalCrawler
docker build . -t ambar-local-crawler:2.1
docker tag ambar-local-crawler:2.1 localhost:5000/ambar-local-crawler:2.1
cd $ROOT
 