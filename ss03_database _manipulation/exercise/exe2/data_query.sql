use quan_ly_ban_hang;

-- Hiển thị các thông tin  gồm order_id, order_date, total_price của tất cả các hóa đơn trong bảng order_products;
select order_id,order_date,total_price
from order_products;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách;
select customers.`name`,order_details.product_id,products.name
from customers
left join order_products
on order_products.customer_id = customers.customer_id
left join order_details
on order_details.order_id = order_products.order_id
left join products
on products.product_id = order_details.product_id
where products.product_id is not null;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customers.`name`
from customers
left join order_products
on order_products.customer_id = customers.customer_id
where order_products.customer_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice);
select 
	order_products.order_id,
	order_products.order_date,
	sum(amount_product * price) as total
from order_products
left join order_details
on order_details.order_id = order_products.order_id
left join products
on products.product_id = order_details.product_id
group by 
order_products.order_id,
order_products.order_date;
	
