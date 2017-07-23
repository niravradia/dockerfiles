# Dockerfile to install python 2.7, MongoDB and Tomcat 7 on top of CentOS 6

FROM centos:centos6

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all

#Install gcc for python installation
RUN yum install -y gcc;yum clean all

#Install WGET
RUN yum install -y wget;yum clean all

#Install tar
RUN yum install -y tar;yum clean all

#Make directory and download Python in it
RUN mkdir /srv/src /srv/software

RUN mkdir /srv/src/Python /srv/software/Python && \
        cd /srv/src/Python && \
        wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz && \
        tar -zxf Python-2.7.10.tgz && \
        cd Python-2.7.10 && \
        ./configure --prefix=/srv/software/Python && \
        make && \
        make install

ENV PATH=/srv/software/Python/bin:${PATH}

RUN yum -y install mongodb-server; yum clean all
RUN mkdir -p /data/db

#Install JDK
ENV JAVA_VER=1.8.0_141 JAVA_DWL_VER=8u141 JAVA_DWL_BVER=b15 \
    JAVA_HOME=/usr/java64/current
ENV JDK_HOME=${JAVA_HOME} \
    PATH=${JAVA_HOME}/bin:${PATH}

RUN mkdir /usr/java64 ; cd /usr/java64/ ; \
     wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_DWL_VER}-${JAVA_DWL_BVER}/336fa29ff2bb4ef291e347e091f7f4a7/jdk-${JAVA_DWL_VER}-linux-x64.tar.gz && \
     cd /usr/java64/ && tar -xzf jdk-${JAVA_DWL_VER}-linux-x64.tar.gz && rm jdk-${JAVA_DWL_VER}-linux-x64.tar.gz && \
     cd /usr/java64/ && ln -s jdk${JAVA_VER} current && \
     chown -R root:root /usr/java64 && \
     chmod -R a+rwX /usr/java64

# Download Apache Tomcat 7
RUN cd /tmp;wget http://www-eu.apache.org/dist/tomcat/tomcat-7/v7.0.79/bin/apache-tomcat-7.0.79.tar.gz 
 
# untar and move to proper location
RUN cd /tmp;tar xvf apache-tomcat-7.0.79.tar.gz
 
RUN cd /tmp;mv apache-tomcat-7.0.79 /opt/tomcat7
 
RUN chmod -R 755 /opt/tomcat7
 
EXPOSE 8080

#CMD ["python", "--version"] 

CMD /opt/tomcat7/bin/catalina.sh run
