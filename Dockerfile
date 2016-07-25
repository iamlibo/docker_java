FROM       debian:jessie
MAINTAINER 51liveup.cn

ENV JAVA_INSTALL_DIR /opt/java
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 101
ENV JAVA_VERSION_BUILD 13

ENV JAVA_HOME ${JAVA_INSTALL_DIR}/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends ca-certificates wget \
	&& mkdir /opt/java/ \
	&& cd /opt/java/ \
	&& wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/"${JAVA_VERSION_MAJOR}"u"${JAVA_VERSION_MINOR}"-b"${JAVA_VERSION_BUILD}"/jdk-"${JAVA_VERSION_MAJOR}"u"${JAVA_VERSION_MINOR}"-linux-x64.tar.gz
RUN set -x \
        && cd /opt/java/ \
	&& tar -zxf ./jdk-"${JAVA_VERSION_MAJOR}"u"${JAVA_VERSION_MINOR}"-linux-x64.tar.gz -C ${JAVA_INSTALL_DIR} \
	&& rm -rf ./jdk-"${JAVA_VERSION_MAJOR}"u"${JAVA_VERSION_MINOR}"-linux-x64.tar.gz \
	&& update-alternatives --install /usr/bin/java java ${JAVA_HOME}/bin/java 100 \
	&& update-alternatives --install /usr/bin/javac javac ${JAVA_HOME}/bin/javac 100 \
	&& apt-get purge -y --auto-remove ca-certificates wget \
	&& apt-get autoclean && apt-get --purge -y autoremove \
	&& java -version

