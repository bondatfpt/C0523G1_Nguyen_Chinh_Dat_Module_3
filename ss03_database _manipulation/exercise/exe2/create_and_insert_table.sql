create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customers(
customer_id int primary key auto_increment,
`name` varchar(30) not null,
age int not null
);

create table order_products(
order_id int primary key auto_increment,
customer_id int not null,
order_date datetime not null,
total_price double,
check (total_price > 0),
foreign key (customer_id) references customers(customer_id)
);

create table products (
product_id int primary key auto_increment,
`name` varchar(30) not null,
price double,
check(price > 0)
);

create table order_details(
order_id int,
product_id int,
amount_product int,
primary key (order_id,product_id),
foreign key (order_id) references order_products(order_id),
foreign key (product_id) references products(product_id)
);

insert into customers (`name`,age)
values ('Minh Quan',10),('Ngoc Oanh',20), ('Hong Ha', 50);
select* from customers;

insert into order_products (customer_id,order_date,total_price)
values(1,'2006-03-21',null), (2,'2006-03-23',null),(1,'2006-03-16',null);
select* from order_products;

insert into products (`name`,price)
values ('May giat', 3), ('Tu lanh', 5), ('Dieu hoa',7), ('Quat',1), ('Bep dien',2);
select* from products;

insert into order_details (order_id, product_id, amount_product)
values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
select* from order_details;




