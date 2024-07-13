create database md2_session02_08;
use md2_session02_08;



create table users (
	id int auto_increment primary key,
    fullname varchar(100) not null,
    email varchar(100) unique not null,
	password varchar(100) not null,
    phone varchar(11) not null,
    permission bit(1) default 1,
    status bit(1) default 1
);

create table address(
	id int auto_increment primary key,
    user_id int not null,
    foreign key (user_id) references users(id),
    receive_address varchar(100) not null,
    receive_name varchar(100) not null,
    receive_phone varchar(11) not null,
    is_default bit(1) default 1
);

create table catalog(
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit(1) default 1
);

create table product (
	id int auto_increment primary key,
    name varchar(100) not null,
    price double check(price > 0),
    stock int check(stock > 0),
    catalog_id int not null,
    foreign key (catalog_id) references catalog(id),
    status bit(1) default 1
);

create table wishlist (
	user_id int not null,
    foreign key (user_id) references users(id),
	product_id int not null,
    foreign key (product_id) references product(id)
);

create table shopping_cart (
	id int auto_increment primary key,
    user_id int not null,
    foreign key (user_id) references users(id),
    product_id int not null,
    foreign key (product_id) references product(id),
    quantity int check (quantity > 0)
);

create table orders(
	id int auto_increment primary key,
    order_at datetime not null,
    totals double check(totals >0),
    user_id int not null,
    foreign key(user_id) references users(id),
    status bit(1) default 1
);

create table order_detail(
	id int auto_increment primary key,
    order_id int not null,
    foreign key (order_id) references orders (id),
    product_id int not null,
    foreign key (product_id) references product(id),
    quantity int check (quantity > 0),
    unit_price double check (unit_price > 0)
);


