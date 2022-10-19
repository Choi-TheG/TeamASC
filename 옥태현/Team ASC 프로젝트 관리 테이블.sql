create table user(
seq integer auto_increment primary key,
id varchar(50) not null default(''),
pwd varchar(50) not null default(''),
name varchar(50) not null default(''),
email varchar(100) not null default(''),
phone_num varchar(20) not null default(''),
join_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
status varchar(20) not null default(''),

insert_time datetime default(now()),
update_time datetime
); 

create table team_member(
seq integer auto_increment primary key,
user_seq integer not null default(0),
team_id varchar(50) not null default(''),
team_name varchar(50) not null default(''),
team_leader varchar(1) not null default(''),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
team_category varchar(1) not null default(''),

insert_time datetime default(now()),
update_time datetime
);

create table message(
seq integer auto_increment primary key,
from_user_seq integer not null default(''),
to_user_seq integer not null default(''),
content text not null default(''),
invite_yn varchar(1) not null default(''),
confirm varchar(1) not null default('N'),
send_date varchar(8) not null default(now()),

insert_time datetime default(now()),
update_time datetime
);

create table document(
seq integer auto_increment primary key,
project_seq integer not null default(0),
document_name varchar(50) not null default(''),
document_category varchar(10) not null default(''),
document_content text not null default(''),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),

insert_time datetime default(now()),
update_time datetime
);

create table project(
seq integer auto_increment primary key,
team_id varchar(50) not null default(''),
project_name varchar(100) not null default(''),
finish_yn varchar(1) not null default('N'),
percentage integer not null default(0),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),

insert_time datetime default(now()),
update_time datetime
);

create table calendar(
seq integer auto_increment primary key,
project_seq integer not null default(0),
calendar_category varchar(20) not null default(''),
start_date varchar(8) not null default(''),
end_date varchar(8) not null default(''),
content varchar(50) not null default(''),
finish_yn varchar(1) not null default('N'),

insert_time datetime default(now()),
update_time datetime
);
