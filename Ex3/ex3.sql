create database bank_account;
use bank_account;

create table customer(
	id int primary key auto_increment,
    name varchar(50) not null 
);

create table account(
	id_account int primary key auto_increment,
	balance_account decimal(15, 2) not null,
    
    id_customer int unique,
    foreign key (id_customer) references customer(id) 
)

