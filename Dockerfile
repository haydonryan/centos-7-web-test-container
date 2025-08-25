# Base image: CentOS 7
FROM centos:7

RUN sed -i -e '/^mirrorlist=/d' -e 's;^#\(baseurl=\)http://mirror\.centos\.org/centos/\$releasever/\(.*\)$;\1http://archive.kernel.org/centos-vault/7.9.2009/\2;' /etc/yum.repos.d/CentOS-*.repo
# Install dependencies: wget, Java (OpenJDK 8)
RUN yum -y update && \
    yum -y install java-1.8.0-openjdk wget tar && \
    yum clean all

# Set environment variables
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Download and install Apache Tomcat 7
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.109/bin/apache-tomcat-7.0.109.tar.gz -O /tmp/tomcat7.tar.gz && \
    mkdir -p $CATALINA_HOME && \
    tar xvf /tmp/tomcat7.tar.gz -C $CATALINA_HOME --strip-components=1 && \
    rm /tmp/tomcat7.tar.gz

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

