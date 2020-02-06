# Springboot-MyBatis-MySQL

## 1. MySQL 세팅
```sql
-- DDL (create, drop, alter)
-- 유저이름@ip주소
create user 'spring'@'%' identified by 'bitc5600';
create database spring;

-- DCL (grant, revoke)
-- on DB이름.테이블명
grant all privileges on spring.* to 'spring'@'%';


use spring;
show tables;

CREATE TABLE team (
	id int AUTO_INCREMENT PRIMARY KEY,
    teamname varchar(100) not null,
	year int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
select * from team;

CREATE TABLE player (
	id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) not null,
    height int not null,
    position varchar(100) not null,
	teamId int not null,
    FOREIGN KEY (teamId) REFERENCES team (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
select * from player;

show variables like 'c%';

insert INTO team VALUES (1, '롯데 자이언츠', 1975);
insert INTO team VALUES (2, '한화 이글스', 1986);
insert INTO team VALUES (3, '삼성 라이온즈', 1982);

insert INTO player VALUES (1, '이대호', 194, '1루수', 1);
insert INTO player VALUES (2, '손아섭', 174, '우익수', 1);
insert INTO player VALUES (3, '전준우', 184, '중견수', 1);

insert INTO player VALUES (4, '김태균', 185, '1루수', 2);
insert INTO player VALUES (5, '정근우', 172, '2루수', 2);
insert INTO player VALUES (6, '이용규', 175, '외야수', 2);

insert INTO player VALUES (7, '오승환', 177, '투수', 3);
insert INTO player VALUES (8, '강민호', 185, '포수', 3);
insert INTO player VALUES (9, '구자욱', 189, '1루수', 3);
```

## 2. JSTL 태그 라이브러리
```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```