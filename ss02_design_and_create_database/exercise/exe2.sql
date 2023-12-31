create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customers(
customer_id varchar(20) primary key,
`name` varchar(30) not null,
age int not null
);

create table order_products(
order_id varchar(20) primary key,
order_date datetime not null,
total_price double not null,
check (total_price > 0),
customer_id varchar(20) not null,
foreign key (customer_id) references customers(customer_id)
);

create table products (
product_id varchar(20) primary key,
`name` varchar(30) not null,
price double,
check(price > 0)
);

create table order_details(
product_id varchar(20) ,
order_id varchar(20) ,
amount_product int,
check (amount_product > 0),
primary key (product_id,order_id),
foreign key (product_id) references products(product_id),
foreign key (order_id) references order_products(order_id)
);