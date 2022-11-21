use tasc;

select * from user;
select * from project;
select * from team_member order by team_id;
select * from schedule;
select * from documents;
select * from board;

insert into user(user_seq,id,pwd,name,email,phone_num,position,position_group) values (1,'admin','1234','관리자','admin@a.com','01012345678','manager','admin');
create table user(
user_seq integer auto_increment primary key,
id varchar(50) not null default(''),
pwd varchar(50) not null default(''),
name varchar(50) not null default(''),
email varchar(100) not null default(''),
phone_num varchar(20) not null default(''),
join_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
status varchar(20) not null default('Y'),
git_link varchar(200) not null default(''),
position varchar(20) not null default(''),
position_group varchar(50) not null default(''),
insert_time datetime default(now()),
update_time datetime
); 

create table team_member(
team_member_seq integer auto_increment primary key,
user_seq integer not null default(0),
team_id varchar(50) not null default(''),
team_leader varchar(1) not null default(''),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
team_category varchar(1) not null default(''),

insert_time datetime default(now()),
update_time datetime
);

create table project(
project_seq integer auto_increment primary key,
team_id varchar(50) not null default(''),
project_name varchar(100) not null default(''),
finish_yn varchar(1) not null default('N'),
percentage integer not null default(0),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
start_date varchar(8) not null default('19990101'),
end_date varchar(8) not null default('19991231'),

insert_time datetime default(now()),
update_time datetime
);

create table schedule(
schedule_seq integer auto_increment primary key,
project_seq integer not null default(0),
schedule_category varchar(20) not null default(''),
start_date varchar(8) not null default(''),
end_date varchar(8) not null default(''),
content text not null default(''),
finish_yn varchar(1) not null default('N'),

insert_time datetime default(now()),
update_time datetime
);

create table board (
board_seq integer auto_increment primary key,
user_seq integer not null default(0),
project_seq integer not null default(0),
board_category varchar(10) not null default (''),
board_title varchar(100) not null default(''),
board_content text not null default(''),
complete_yn varchar(1) not null default('N'),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
fileName varchar(100) not null default(''),
realFileName varchar(100) not null default(''),
insert_time datetime default(now()),
update_time datetime
);

create table documents(
documents_seq int auto_increment primary key,
project_seq int not null,
documents_name text default null,
file_name text default null,
real_file_name text default null,
writer varchar(5) default null,
    
insert_time datetime default(now()),
update_time datetime
);