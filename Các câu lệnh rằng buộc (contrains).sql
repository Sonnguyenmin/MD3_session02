create database md2_session02_b1;
use md2_session02_b1;

create table categories (
	id int auto_increment primary key,
    name varchar(255) unique not null,
    status bit default 0
);

create table product (
	id int auto_increment primary key,
    name varchar(255) unique not null,
    price double check (price > 0),
    stock int check (stock > 0),
    status bit default 0,
    category_id int not null,
    foreign key (category_id) references categories(id)
);