create database school;
use school;

create table student(
	id int primary key auto_increment,
    name varchar(50) not null,
    
    id_teacher int,
    foreign key (id_teacher) references teacher(id) 
);

create table teacher(
	id int primary key auto_increment,
    name varchar(50) not null
)

-- create table teacher_student(
-- 	id_student int,
--     id_teacher int,
--     primary key (id_student, id_teacher),
--     foreign key (id_student) references student(id),
--     foreign key (id_teacher) references teacher(id)
-- )