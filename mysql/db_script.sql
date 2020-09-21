create database demo;
use demo;

create table user (first_name varchar(30), last_name varchar(30), email varchar(30), username varchar(30), password varchar(30), regdate date);
create table logindetails (username VARCHAR(30), logindate DATE, logintime TIME,logoutdate DATE, logouttime TIME, session VARCHAR(30));

insert into user(first_name, last_name, email, username, password, regdate) values ('test','test','test@test.com','test','test', CURDATE());
