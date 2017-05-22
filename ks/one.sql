/*一个学生选课系统的数据库 db_exam，包含以下库表：
student 学生表
id
name
age
gender
dob
departmentId

department 系别表
id
title 系名称
tel

course 课程表
id
title 课程名称
credit 学分

student_course 选课表
id
studentId
departmentId
grade 考试成绩

1.使用合理的数据类型、约束和规范的语句创建以上各表（40分）
2.写出查询各表字段注释、各表名注释的语句 (10分)
3.为存在关联的表追加合理的外键（10分）
4.为各表添加 5 条样本数据（10分）
5.修改选课表 grade 字段，改名为 score（10分）
6.查询所有姓王的学生（10分）
7.删除各表，删除数据库（10分）
*/
DROP DATABASE IF EXISTS db_exam;
CREATE DATABASE db_exam;
CREATE TABLE IF NOT EXISTS db_exam.student(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK',
  name VARCHAR(255) NOT NULL COMMENT '姓名',
  age INT NOT NULL COMMENT '年龄',
  gender VARCHAR(255) COMMENT '性别',
  dob DATE COMMENT '出生日期',
  departmentId INT COMMENT 'FK'
)COMMENT '学生表';

CREATE TABLE IF NOT EXISTS db_exam.department(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK',
  title VARCHAR(255) COMMENT '系名称',
  tel INT COMMENT '电话'
)COMMENT '系别表';

CREATE TABLE IF NOT EXISTS db_exam.course(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK',
  title VARCHAR(255) COMMENT '课程名称',
  credit DOUBLE COMMENT '学分'
)COMMENT '课程表';

CREATE TABLE IF NOT EXISTS db_exam.student_course(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK',
  studentId INT COMMENT 'FK',
  courseId INT COMMENT 'FK',
  grade DOUBLE COMMENT '考试成绩'
)COMMENT '选课表';

#为存在关联的表追加合理的外键
ALTER TABLE db_exam.student
  ADD CONSTRAINT
  fk_student_departmentId
FOREIGN KEY (departmentId)
REFERENCES db_exam.department(id);

ALTER TABLE db_exam.student_course
  ADD CONSTRAINT
  fk_student_course_studentId
FOREIGN KEY (studentId)
REFERENCES db_exam.student(id);

ALTER TABLE db_exam.student_course
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseId)
REFERENCES db_exam.course(id);

#为各表添加 5 条样本数据
INSERT INTO db_exam.student VALUES (NULL ,'Tom',22,'M','1995-06-06',NULL );
INSERT INTO db_exam.student VALUES (NULL ,'Lucy',21,'F','1996-02-08',NULL );
INSERT INTO db_exam.student VALUES (NULL ,'Jack',23,'M','1994-10-15',NULL );
INSERT INTO db_exam.student VALUES (NULL ,'Jun',22,'F','1995-06-06',NULL );
INSERT INTO db_exam.student VALUES (NULL ,'王五',22,'M','1995-06-06',NULL );

INSERT INTO db_exam.department VALUES (NULL ,'计算机系',6666666);
INSERT INTO db_exam.department VALUES (NULL ,'物理系',7777777);
INSERT INTO db_exam.department VALUES (NULL ,'数学系',8888888);
INSERT INTO db_exam.department VALUES (NULL ,'建筑系',5555555);
INSERT INTO db_exam.department VALUES (NULL ,'生命科学系',9999999);

INSERT INTO db_exam.course VALUES (NULL ,'HTML',2);
INSERT INTO db_exam.course VALUES (NULL ,'Javascript',2);
INSERT INTO db_exam.course VALUES (NULL ,'JavaSE',3);
INSERT INTO db_exam.course VALUES (NULL ,'Mysql',3);
INSERT INTO db_exam.course VALUES (NULL ,'Jquery',2);

INSERT INTO db_exam.student_course VALUES (NULL ,1,2,90);
INSERT INTO db_exam.student_course VALUES (NULL ,2,4,87);
INSERT INTO db_exam.student_course VALUES (NULL ,3,5,85);
INSERT INTO db_exam.student_course VALUES (NULL ,4,1,92);
INSERT INTO db_exam.student_course VALUES (NULL ,5,3,76);

#修改选课表 grade 字段，改名为 score
ALTER TABLE db_exam.student_course
  CHANGE grade score VARCHAR(255);

#查询所有姓王的学生
SELECT *
FROM db_exam.student
WHERE name REGEXP '王';

#删除各表，删除数据库
DROP TABLE db_exam.student;
DROP TABLE db_exam.course;
DROP TABLE db_exam.department;
DROP TABLE db_exam.student_course;
DROP DATABASE db_exam;