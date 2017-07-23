#/bin/sh
set -e

cd app-server-docker/

echo "building docker image ..."
docker build -t niravradia/appserver:centos6 .
echo "docker image built successfully"

echo "running docker container..."
docker run -d -p 7080:8080 niravradia/appserver:centos6
echo "docker container started successfully."

until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:7080 | grep 'Coyote'`" != "" ];
do
  echo --- sleeping for 10 seconds
  sleep 10
done

echo "started server"

