# Springboot-MyBatis-MySQL

## 1. MySQL ����
```sql
-- DDL (create, drop, alter)
-- �����̸�@ip�ּ�
create user 'spring'@'%' identified by 'bitc5600';
create database spring;

-- DCL (grant, revoke)
-- on DB�̸�.���̺��
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

insert INTO team VALUES (1, '�Ե� ���̾���', 1975);
insert INTO team VALUES (2, '��ȭ �̱۽�', 1986);
insert INTO team VALUES (3, '�Ｚ ���̿���', 1982);

insert INTO player VALUES (1, '�̴�ȣ', 194, '1���', 1);
insert INTO player VALUES (2, '�վƼ�', 174, '���ͼ�', 1);
insert INTO player VALUES (3, '���ؿ�', 184, '�߰߼�', 1);

insert INTO player VALUES (4, '���±�', 185, '1���', 2);
insert INTO player VALUES (5, '���ٿ�', 172, '2���', 2);
insert INTO player VALUES (6, '�̿��', 175, '�ܾ߼�', 2);

insert INTO player VALUES (7, '����ȯ', 177, '����', 3);
insert INTO player VALUES (8, '����ȣ', 185, '����', 3);
insert INTO player VALUES (9, '���ڿ�', 189, '1���', 3);
```

## 2. JSTL �±� ���̺귯��
```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```