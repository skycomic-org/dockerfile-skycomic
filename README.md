## Usage
+ install docker
+ 
```
cd /tmp
git clone https://github.com/skycomic-org/dockerfile-skycomic.git
docker build --rm -t skycomic.org dockerfile-skycomic
rm -rf dockerfile-skycomic
docker run --name skycomic.org -p 8080:80 -d skycomic.org
docker exec -it skycomic.org bash -c 'cd /app/frontend/ && npm run gulp'
docker exec -it skycomic.org /app/private/scripts/init.sh
```
+ browse it on your machine http://localhost:8080

## Troubleshooting
+ The last command might encounter an error ```/usr/local/bin/php: not found```.
  Create a symbolic link ```ln -s /usr/bin/php /usr/local/bin/php``` could fix it.
