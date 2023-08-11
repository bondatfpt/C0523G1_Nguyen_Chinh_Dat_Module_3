CREATE DATABASE student_management;
USE student_management;
CREATE TABLE classroom (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255)
);
SELECT*FROM classroom;
INSERT INTO classroom(`name`)
VALUES('Chinh Dat');

SET SQL_SAFE_UPDATES = 0;
UPDATE classroom
SET `name` = 'Bon Dat'
WHERE `name` = 'Chinh Dat';

CREATE TABLE teacher (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` varchar(50),
age int,
country varchar(50)
);

