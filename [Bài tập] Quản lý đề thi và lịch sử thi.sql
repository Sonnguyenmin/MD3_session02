create database md2_session02_06;
use md2_session02_06;

create table users (
	id int auto_increment primary key,
    fullname varchar(100) not null,
    email varchar(100) unique not null,
    password varchar(100) not null,
    phone varchar(11) unique not null,
    permission bit(1) default 1,
    status bit(1) default 1
);

create table historys (
	id int auto_increment primary key,
    user_id int not null,
    foreign key (user_id) references users(id),
    point int not null,
    exam_date datetime not null
);

create table questions (
	id int auto_increment primary key,
    content varchar(255) not null,
    exam_id int not null,
    foreign key (exam_id) references exams (id),
    status bit(1) default 1
);

create table history_detail (
	id int auto_increment primary key,
    history_id int not null,
    foreign key (history_id) references historys (id),
    question_id int not null,
    foreign key (question_id) references questions (id),
    resuslt bit(1) default 1 
);

create table answer (
	id int auto_increment primary key,
    content varchar(255) not null,
	question_id int not null,
    foreign key (question_id) references questions (id),
    answer_true bit(1) default 1
);


create table exams (
	id int auto_increment primary key,
    name varchar(100) not null,
    duration int not null,
    status bit(1) default 1
);
