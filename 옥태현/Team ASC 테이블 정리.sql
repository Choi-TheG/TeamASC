

create table member(
seq integer auto_increment primary key,
id varchar(50) not null default(''),
pwd varchar(50) not null default(''),
name varchar(30) not null default(''),
email varchar(100) not null default(''),
phone_num varchar(20) not null default(''),
join_date varchar(8) not null default(''),
status varchar(30) not null default(''),
insert_time datetime default(now()),
update_time datetime 
);

create table board(
seq integer primary key,
member_seq integer not null default(0),
address varchar(200) not null default(''),
area double not null default(0),
area_unit varchar(30) not null default(''),
length1 double not null default(0),
length2 double not null default(0),
category_code varchar(10) not null default(''),
category varchar(100) not null default(''),
lease_date varchar(8) not null default(''),
lease_peroid integer not null default(0),
content text not null default(''),
lease_type1 varchar(30) not null default(''),
lease_type2 varchar(30) not null default(''),
finish_yn varchar(1) not null default('N'),
wrtie_date datetime not null default(now()),
read_count integer not null default(0),
division varchar(2) not null default(''),
insert_time datetime default(now()),
update_time datetime 
);

create table favorite(
seq int primary key,
member_seq integer not null,
board_seq integer not null,
insert_time datetime default(now()),
update_time datetime 
);

create table category(
seq int primary key,
category_code varchar(10) not null default(''),
category_name varchar(100) not null default(''),
division varchar(1) not null default(''),
insert_time datetime default(now()),
update_time datetime 
);

create table reply(
seq integer primary key,
member_seq integer not null,
board_seq integer not null,
content text not null default(''),
wrtie_date datetime not null default(current_timestamp()),
secret_yn varchar(1) not null default('N'),
insert_time datetime default(now()),
update_time datetime 
);

create table qna(
seq integer auto_increment primary key,
member_seq integer not null,
write_seq integer default 0,
current_seq varchar(100) not null,
title varchar(100) not null,
content text not null,
read_count integer not null default 0,
next_seq varchar(100) not null,
write_date datetime not null default (now()),
secret_yn varchar(1) not null default('N'),
question_type varchar(20) not null default(''),
insert_time datetime default(now()),
update_time datetime );
