create database store_management;
use store_management;

create table product(
	id int primary key auto_increment,
    name varchar(50) not null,
    description varchar(100),
    price double,
    quantity int
);

-- thêm dữ liệu
insert into product value (6, 'khan choang', 'khan choang co sieu am', 100000, 10);

insert into product (name, description, price, quantity) value ('tui xach', 'tui xach hang hieu', 500000, 10);
insert into product (name, description, price, quantity) value ('ao thun', 'ao thun 100% cottons', 200000, 15);

insert into product (name, description, price, quantity) value ('ao mua');

-- truy vấn dữ liệu
select * from product;
select id, name, price from product;
select id, name, price from product
where price < 10000000;

-- cập nhật dữ liệu
update product set quantity = 50;

set sql_safe_updates = 0;
update product
set price = 500.499
where id = 4;
set sql_safe_updates = 1;

-- chỉnh sửa bảng
alter table product add barcode varchar(50) null;
alter table product add warranty varchar(50) default '6 thangs';

-- xóa dữ liệu
delete from product;
delete from product where id = 5;

-- xóa bảng
drop table product;

-- xóa database
drop database store_management;
drop database if exists store_management;
