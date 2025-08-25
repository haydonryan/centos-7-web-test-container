FROM centos:7

RUN sed -i -e '/^mirrorlist=/d' -e 's;^#\(baseurl=\)http://mirror\.centos\.org/centos/\$releasever/\(.*\)$;\1http://archive.kernel.org/centos-vault/7.9.2009/\2;' /etc/yum.repos.d/CentOS-*.repo
RUN yum -y install httpd
COPY index.html /var/www/html/index.html

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
