## Usage
+ install docker
+ 
```
cd /tmp
git clone https://github.com/skycomic-org/dockerfile-skycomic.git
docker build --rm -t skycomic.org dockerfile-skycomic
rm -rf dockerfile-skycomic
docker run --name skycomic.org -p 8080:80 -d skycomic
docker exec -it skycomic /app/private/scripts/init.sh
```
+ browse it on your machine http://localhost:8080
