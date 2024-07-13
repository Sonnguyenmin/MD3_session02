create database md2_session02_item;
use md2_session02_item;

create table product (
	id int auto_increment primary key,
    name varchar(100) not null,
    created date not null
);

create table color (
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit(1) default 1
);

create table size (
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit(1) default 1
);

create table product_detail (
	id int auto_increment primary key,
    product_id int not null,
    foreign key (product_id) references product(id),
    color_id int not null,
    foreign key (color_id) references color(id),
    size_id int not null,
    foreign key (size_id) references size(id),
    price double check(price > 0),
    stock int check (stock >= 0),
    status bit(1) default 1
);
