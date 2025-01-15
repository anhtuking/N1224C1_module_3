create database book_store;
use book_store;

create table author(
	id int primary key auto_increment,
    name varchar(50) not null
);

create table book(
	id int primary key auto_increment,
    name varchar(50) not null,
    price double,
    
    id_staff int,
    foreign key (id_staff) references staff(id)
);

create table staff(
	id int primary key auto_increment,
    name varchar(50) not null,
    address varchar(50)
);

create table author_book(
	id_author int not null,
	id_book int not null,
    
    primary key (id_author, id_book),
    foreign key (id_author) references author(id),
    foreign key (id_book) references book(id)
);


