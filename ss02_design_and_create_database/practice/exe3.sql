create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table classes (
class_id int not null primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status bit
);

create table student(
student_id int not null primary key auto_increment,
student_name varchar(30) not null,
address varchar(50) not null,
phone varchar(20),
status bit,

);