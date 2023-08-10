CREATE DATABASE student_management;
USE student_management;
CREATE TABLE class (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255)
);
SELECT*FROM class;
INSERT INTO class(`name`)
VALUES('Chinh Dat');

SET SQL_SAFE_UPDATES = 0;
UPDATE class
SET `name` = 'Bon Dat'
WHERE `name` = 'Chinh Dat';

CREATE TABLE teacher (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` varchar(50),
age int,
country varchar(50)
)

