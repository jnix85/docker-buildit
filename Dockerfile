FROM rockylinux:8

ENV JAVA_HOME /opt/openjdk/17 
ENV PATH $PATH:$JAVA_HOME/bin
ADD install_jdk.sh /install_jdk.sh

RUN dnf makecache && \
    dnf install -y wget git zip unzip tar gzip bzip2 curl && \
    dnf upgrade -y && \
    dnf clean all && \
    mkdir -p /opt/openjdk && \
    chmod +x /install_jdk.sh && \
    sh /install_jdk.sh