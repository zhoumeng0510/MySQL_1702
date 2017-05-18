SHOW FULL COLUMNS FROM db_1702.student;

# DML  语句  INSERT UPDATE DELETE

SELECT *
FROM db_1702.student;

INSERT INTO db_1702.student
    VALUES (NULL ,'002','Jackson','show','M',18,1.6,12.34,'1998-1-2','2017-5-18 08:36:03');

INSERT into db_1702.student(name)
    VALUES ('Tom');


SHOW CREATE TABLE db_1702.student; -- 显示建表语句

CREATE TABLE `student` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID PK',
`sno` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学号',
`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
`intro` text COLLATE utf8_unicode_ci COMMENT '简介',
`gender` char(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
`age` int(10) unsigned DEFAULT NULL COMMENT '年龄',
`height` double(3,2) DEFAULT NULL COMMENT '身高',
`price` decimal(10,3) DEFAULT NULL COMMENT '价格',
`dob` date DEFAULT NULL COMMENT '出生日期',
`time` datetime DEFAULT NULL COMMENT '时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT into db_1702.student(name)
VALUES ('N1'),('N2'),('N3');

SELECT *
FROM db_1702.student;

UPDATE  db_1702.student
    SET gender = '女';

UPDATE db_1702.student
    SET height = 1.6
WHERE id = 1;

UPDATE db_1702.student
    SET height = 1.7,name = '张三'
WHERE id = 2;


