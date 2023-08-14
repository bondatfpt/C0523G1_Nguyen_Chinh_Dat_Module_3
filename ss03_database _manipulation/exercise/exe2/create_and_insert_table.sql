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
total_price double not null,
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
product_id int,
order_id int,
amount_product int,
check (amount_product > 0),
primary key (product_id,order_id),
foreign key (product_id) references products(product_id),
foreign key (order_id) references order_products(order_id)
);


-- insert into customers (`name`,age)
-- values ('Minh Quan',10),('Ngoc Oanh',20), ('Hong Ha', 50);
-- select* from customers;

-- insert into order_products (customer_id,order_date,total_price)
-- values(1,'2006-03-21',null), (2,'2006-03-23',null),(1,'2006-03-16',null);
delete from order_products;
select * from order_products;






