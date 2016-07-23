FROM       debian:jessie
MAINTAINER iamlibo

ENV JAVA_HOME /opt/java
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 101
ENV JAVA_VERSION_BUILD 02

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends wget \
	&& wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz \
	&& mkdir /opt/jdk/ \
	&& mv ~/jdk-8u101-linux-x64.tar.gz /opt/jdk/ \
	&& cd /opt/jdk/ \
        && tar -zxf jdk-8u101-linux-x64.tar.gz \
	&& apt-get purge -y --auto-remove wget
