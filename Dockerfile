FROM       debian:jessie
MAINTAINER iamlibo

ENV JAVA_HOME /opt/java
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 101
ENV JAVA_VERSION_BUILD 02

RUN set -x \
	&& su - \
	&& echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list \
        && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list \
        && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
        && apt-get update \
        && apt-get install oracle-java8-installer \
        && exit
