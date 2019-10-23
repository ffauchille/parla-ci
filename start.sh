#! /bin/sh

if [ $# != 1 ];
then
 echo "Check your local IP if it matches the nginx.conf."
 exit 2
fi

docker build -t parla:a -f Dockerfile.a .
docker build -t parla:b -f Dockerfile.b .
docker build -t parla:lb .

docker stop parla-a || true
docker stop parla-b || true
docker stop parla-lb || true

docker rm parla-a || true
docker rm parla-b || true
docker rm parla-lb || true

docker run -d -p 8080:80 --name parla-a parla:a
docker run -d -p 8081:80 --name parla-b parla:b
docker run -d -p 8079:80 --name parla-lb parla:lb
