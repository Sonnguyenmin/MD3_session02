create database md2_session02_04;
use md2_session02_04;

create table customer (
	c_id int auto_increment primary key,
    c_name varchar(100) unique not null,
    c_age int check ( age > 0)
);

create table order (
	o_id int auto_increment primary key,
    
);

