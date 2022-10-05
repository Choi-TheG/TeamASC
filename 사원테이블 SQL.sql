create database gntp_sprint;
use gntp_sprint;
create table member(
member_no integer primary key,
name varchar(20) not null default(''),
pwd varchar(30) not null default(''),
depart varchar(30) not null default(''),
position varchar(30) not null default(''),
birth_date varchar(8) not null default('19991231'),
phone_num varchar(20) not null default(''),
join_date varchar(8) not null default('19991231'),
email varchar(30) not null default('')
);