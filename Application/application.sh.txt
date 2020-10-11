FROM centos/systemd


RUN yum install wget -y
RUN wget -q http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN wget -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -i remi-release-7.rpm epel-release-latest-7.noarch.rpm
RUN yum install yum-utils -y
RUN yum-config-manager --enable remi-php73
RUN yum install httpd -y
RUN yum install -y  php php-mysql php-gd php-xml  php-mbstring php-json

COPY httpd.conf /etc/httpd/conf/httpd.conf
WORKDIR /var/www
RUN wget https://releases.wikimedia.org/mediawiki/1.35/mediawiki-1.35.0.tar.gz ; tar -xzvf mediawiki-1.35.0.tar.gz ; ln -s mediawiki-1.35.0/ mediawiki
RUN chown -R apache:apache /var/www/mediawiki-1.35.0 ; chown -R apache:apache /var/www/mediawiki



EXPOSE 80
RUN systemctl enable httpd


CMD ["/usr/sbin/init"]