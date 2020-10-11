FROM centos/systemd


RUN yum install -y mariadb-server mariadb ; systemctl enable mariadb

EXPOSE 3306

CMD ["/usr/sbin/init"]