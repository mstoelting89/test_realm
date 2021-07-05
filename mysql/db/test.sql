USE mysql_db;

CREATE TABLE `test` (
    id INT(10) NOT NULL auto_increment,
    text varchar(255),
    PRIMARY KEY (`id`)
);

INSERT INTO test(text) VALUES ("Hello World");