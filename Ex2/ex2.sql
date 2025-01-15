create database phone_book;
use phone_book;

create table person(
	id int primary key auto_increment,
    name varchar(50) not null
);

create table phone(
	id int primary key auto_increment,
	phone_number int not null,
    
    id_person int,
    foreign key (id_person) references person(id)
);

create table email(
	id int primary key auto_increment,
    email_address varchar(20) not null,
    
    id_person int,
    foreign key (id_person) references person(id)
);