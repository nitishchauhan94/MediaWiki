echo "Database and user creation"
/usr/bin/mysql -uroot -ppassword -P3306 -h  wikimariadb.default.svc.cluster.local  <<EOF
CREATE USER 'nitishuser'@'%' IDENTIFIED BY 'YourPassword';
CREATE DATABASE nitishdb;
GRANT ALL PRIVILEGES ON nitishdb.* TO 'nitishuser'@'%';
FLUSH PRIVILEGES;
SHOW DATABASES;
SHOW GRANTS FOR 'wikiuser'@'%';
EOF
