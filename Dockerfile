FROM       debian:jessie
MAINTAINER iamlibo

ENV JAVA_HOME /opt/java
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 101
ENV JAVA_VERSION_BUILD 02

RUN set -x \
	&& apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/*
