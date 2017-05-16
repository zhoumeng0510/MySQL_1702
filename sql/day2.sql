drop table db_1702.student;

create table db_1702.student(
  name varchar(255) COMMENT'姓名',
  intro text COMMENT '简介',
  gender char(2) COMMENT '性别',
  age int unsigned COMMENT '年龄',
  height double(3,2) COMMENT '身高',
  price decimal(6,2)COMMENT '价格',
  dob date COMMENT '出生日期',-- date of birth
  time datetime COMMENT '时间'
);

SHOW FULL COLUMNS FROM db_1702.student;

insert into db_1702.student value ('tom','yellow','m',18,1.75,123.456,'1996-5-10','2017-5-16 10:55:00');

TRUNCATE TABLE db_1702.student;

DELETE FROM db_1702.student;

select *
from db_1702.student;