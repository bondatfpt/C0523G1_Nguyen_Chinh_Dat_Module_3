create database view_index_store_procedure;
use view_index_store_procedure;

create table products (
id int primary key auto_increment,
product_code varchar(50),
product_name varchar(50) not null,
product_price double,
product_amount int,
product_description varchar(100),
product_status bit
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values('PRD1','Dell_1',1000,5,'Good',1),('PRD2','Dell_2',2000,10,'Good',0),('PRD3','Dell_3',3000,15,'Good',1),('PRD4','Dell_4',4000,20,'Good',0);

-- Hiệu suất truy vấn trước khi đánh index cho cột product_code của bảng products;
explain select *
from products
where product_code = 'PRD1';
-- sản phẩm có product_code = 'PRD1' có vị trí ở hàng đầu tiên nhưng trong lúc tìm kiếm vẫn phải duyệt qua tất cả các hàng trong bảng
-- hiệu suất kém.

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_single on products(product_code);
-- Hiệu suất truy vấn sau khi đánh index cho cột product_code của bảng products;
explain select *
from products
where product_code = 'PRD4';
-- sản phẩm có product_code = 'PRD4' có vị trí ở hàng cuối bảng nhưng trong lúc tìm kiếm chỉ cần duyệt qua 1 hàng đã tìm thấy;
-- hiệu suất cao vì nó biết chính xác phải tìm ở đâu nhờ có index;
drop index index_single on products;
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_composite on products(product_name,product_price);


-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_products as
select product_code, product_price, product_status
from products;

-- Tiến hành sửa đổi view
alter view view_products as
select product_name, product_amount,product_price
from products
go;

-- Tiến hành xoá view
drop view view_products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product;
delimiter //
create procedure get_all_product ()
begin 
select * from products;
end //
delimiter ;
call get_all_product;

-- Tạo store procedure thêm một sản phẩm mới;
delimiter //
create procedure add_product(code_arg varchar(50), name_arg varchar(50),price double, amount int ,description_arg varchar(100),status_arg bit)
begin
insert into products (product_code,product_name,product_price,product_amount,product_description,product_status)
values (code_arg,name_arg,price,amount,description_arg,status_arg);
end //
delimiter ;
call add_product ('PRD8','Dell_5',5000,25,'Good',0);

-- Tạo store procedure sửa thông tin sản phẩm theo id;
delimiter //
create procedure update_product (id_arg int, code_arg varchar(50), name_arg varchar(50), price double, amount int, description_arg varchar(100), status_arg bit)
begin 
update products 
set product_code = code_arg, product_name = name_arg, product_price = price, product_amount = amount, product_description = description_arg, product_status = status_arg
where id = id_arg;
end //
delimiter ;
set sql_safe_updates = 0; 
call update_product (5,'PRD11111','Dell_0',1000,0,'Bad',0);
set sql_safe_updates = 1; 

-- Tạo store procedure xoá sản phẩm theo id;
delimiter //
create procedure delete_product (id_arg int)
begin
delete from products
where id = id_arg;
end //
delimiter ;
call delete_product (1);
