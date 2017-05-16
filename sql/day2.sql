# DROP TABLE IF EXISTS db_1702;
# CREATE DATABASE db_1702;

DROP TABLE IF EXISTS db_1702.student;
CREATE TABLE db_1702.student (
  name   VARCHAR(255) COMMENT '姓名',
  intro  TEXT COMMENT '简介',
  gender CHAR(2) COMMENT '性别',
  age    INT UNSIGNED COMMENT '年龄',
  height DOUBLE(3, 2) COMMENT '身高',
  price  DECIMAL(6, 2) COMMENT '价格',
  dob    DATE COMMENT '出生日期', -- date of birth
  time   DATETIME COMMENT '时间'
);

INSERT INTO db_1702.student VALUE ('tom', 'yellow', 'm', 18, 1.75, 123.456, '1996-5-10', '2017-5-16 10:55:00');

SELECT *
FROM db_1702.student;