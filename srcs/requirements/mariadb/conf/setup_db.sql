CREATE DATABASE IF NOT EXISTS wp_db;
CREATE USER 'wp_super'@'localhost';
SET PASSWORD FOR 'wp_super'@'localhost' = PASSWORD('123456');
GRANT ALL PRIVILEGES ON wp_db.* TO 'wp_super'@'localhost' IDENTIFIED BY '123456';
GRANT ALL ON wp_db.* to 'wp_super'@'%' IDENTIFIED BY '123456';

FLUSH PRIVILEGES;

CREATE USER 'wp_user'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'wp_user'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER 'wp_user'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'wp_user'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpass';
flush privileges;