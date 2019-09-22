# website

## How to build webpage in docker.  

`docker build -t webapp:1.0 .`  

## How to run a docker webapp image.  

`docker run -d -p 80:80 --name=welcome webapp:1.0`  

## How to check website is up and running.  

`curl -I localhost:80`  
