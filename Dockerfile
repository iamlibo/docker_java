FROM       debian:jessie
MAINTAINER iamlibo

ENV JAVA_HOME /opt/java
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 101
ENV JAVA_VERSION_BUILD 02

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends ca-certificates wget \
	&& mkdir /opt/jdk/ \
	&& cd /opt/jdk/ \
	&& wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz \
	&& tar -zxf ./jdk-8u101-linux-x64.tar.gz \
	&& rm -rf ./jdk-8u101-linux-x64.tar.gz \
	&& update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_101/bin/java 100 \
	&& update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_101/bin/javac 100 \
	&& apt-get purge -y --auto-remove ca-certificates wget
