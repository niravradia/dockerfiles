# dockerfiles
Collection of dockerfiles

python27_mongodb_tomcat7_stack:

./start-app-server-docker.sh

This will install python 2.7 + mongoDB10 + Oravle JDK + Tomcat 7 on CentOS6, create docker image and start docker container.
Docker container would have tomcat started on port 8080 binded to host port 7080
Then, it would wait for host to respond on 7080 and open tomcat homepage.