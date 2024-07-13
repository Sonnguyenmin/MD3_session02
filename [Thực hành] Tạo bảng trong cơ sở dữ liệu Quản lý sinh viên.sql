create database md2_session02_02;
use md2_session02_02;

create table Classes (
	class_id int auto_increment primary key,
    class_name varchar(255) unique not null,
    start_date date not null,
    status bit(1) default 1
);

create table Student (
	student_id int auto_increment primary key,
    student_name varchar(100) unique not null,
    address varchar(255) not null,
    phone varchar(15) unique not null,
    status bit ,
    class_id int not null,
    foreign key (class_id) references Classes (class_id)
);

create table Subjects (
	sub_id int auto_increment primary key,
    sub_name varchar(255) unique not null,
    credit int default 1 check (credit >= 1),
    status bit(1) default 1
);

create table Mark (
	mark_id int auto_increment primary key,
    subject_id int not null,
    foreign key (subject_id) references Subjects (sub_id),
    student_id int not null,
    foreign key (student_id) references Student (student_id),
    mark double default 0 check(mark between 0 and 100),
    examtime int default 1
);