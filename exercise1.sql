CREATE DATABASE store_management;

USE store_management;

CREATE TABLE product(id int PRIMARY KEY AUTO_INCREMENT,
			name varchar(50) NOT NULL,
                        description varchar(100),
                        price DOUBLE,
                        quantity int);

-- thêm dữ liệu

INSERT INTO product value (6, 'khan choang', 'khan choang co sieu am', 100000, 10);

INSERT INTO product (name, description, price, quantity) value ('tui xach', 'tui xach hang hieu', 500000, 10);
INSERT INTO product (name, description, price, quantity) value ('ao thun', 'ao thun 100% cottons', 200000, 15);

INSERT INTO product (name, description, price, quantity) value ('ao mua');

-- truy vấn dữ liệu

SELECT *
FROM product;


SELECT id,
       name,
       price
FROM product;


SELECT id,
       name,
       price
FROM product
WHERE price < 10000000;

-- cập nhật dữ liệu

UPDATE product
SET quantity = 50;


SET sql_safe_updates = 0;

UPDATE product
SET price = 500.499
WHERE id = 4;

SET sql_safe_updates = 1;

-- chỉnh sửa bảng

ALTER TABLE product ADD barcode varchar(50) NULL;

ALTER TABLE product ADD warranty varchar(50) DEFAULT '6 thangs';

-- xóa dữ liệu

DELETE
FROM product;

DELETE
FROM product
WHERE id = 5;

-- xóa bảng

DROP TABLE product;

-- xóa database

DROP DATABASE store_management;

DROP DATABASE IF EXISTS store_management;
