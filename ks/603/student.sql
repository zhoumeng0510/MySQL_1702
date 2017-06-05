/*Student 表的定义
id
name
gender
dob出生日期
department系名称
address*/
DROP DATABASE IF EXISTS db_test;
CREATE DATABASE db_test;
DROP TABLE IF EXISTS db_test.student;
CREATE TABLE IF NOT EXISTS db_test.student (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name       VARCHAR(255) COMMENT '姓名',
  gender     VARCHAR(255) COMMENT '性别',
  dob        VARCHAR(255) COMMENT '出生日期',
  department VARCHAR(255) COMMENT '系名称',
  address    VARCHAR(255) COMMENT '家庭住址'
)
  COMMENT '学生表';
/*Score 表的定义
id
studentId
course课程名
grade*/
DROP TABLE IF EXISTS db_test.score;
CREATE TABLE IF NOT EXISTS db_test.score (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT '学生ID',
  course    VARCHAR(255) COMMENT '课程名',
  grade     INT COMMENT '分数'
)
  COMMENT '分数表';
# 创建student和score表
# 创建合理的外键关联
ALTER TABLE db_test.score
  ADD CONSTRAINT
  score_fk_studentId
FOREIGN KEY (studentId)
REFERENCES db_test.student (id);
# 为student表和score表各增加5条记录
INSERT INTO db_test.student VALUE (NULL, 'tom', '男', '1998-6-1', '计算机系', '湖南');
INSERT INTO db_test.student VALUE (NULL, 'jerry', '男', '1993-6-1', '计算机系', '山西');
INSERT INTO db_test.student VALUE (NULL, '王三', '男', '1997-6-1', '电子系', '湖南');
INSERT INTO db_test.student VALUE (NULL, 'rode', '男', '1986-6-1', '计算机系', '北京');
INSERT INTO db_test.student VALUE (NULL, '李四', '男', '1992-6-1', '数学系', '上海');

INSERT INTO db_test.score VALUE (NULL, 1, 'Java', 80);
INSERT INTO db_test.score VALUE (NULL, 2, '计算机', 88);
INSERT INTO db_test.score VALUE (NULL, 3, 'Java', 90);
INSERT INTO db_test.score VALUE (NULL, 4, '计算机', 93);
INSERT INTO db_test.score VALUE (NULL, 5, '英语', 100);
# 查询student表的所有记录
SELECT *
FROM db_test.student;
# 查询student表的第2条到4条记录
SELECT *
FROM db_test.student
WHERE id > 1 AND id < 5;
# 从student表查询所有学生的学号（id）、姓名（name）和院系（department）的信息
SELECT
  id,
  name,
  department
FROM db_test.student;
# 从student表中查询计算机系和电子系的学生的信息
SELECT *
FROM db_test.student
WHERE department = '计算机系' OR department = '电子系';
# 从student表中查询年龄18~22岁的学生信息
SELECT
  timestampdiff(YEAR, dob, current_date) BETWEEN min(18) AND max(22),
  name
FROM db_test.student
GROUP BY dob;
# 从student表中查询每个院系有多少人
SELECT
  department,
  count(*)
FROM db_test.student
GROUP BY department;
#从score表中查询每个科目的最高分
SELECT course,max(grade)
FROM db_test.score
GROUP BY course;
#查询李四的考试科目（c_name）和考试成绩（grade）
SELECT s2.course,s2.grade
FROM db_test.student s1 INNER JOIN db_test.score s2
    ON s1.id = s2.studentId
WHERE s1.name = '李四';
#用连接的方式查询所有学生的信息和考试信息
SELECT *
FROM db_test.score s1 INNER JOIN db_test.student s2
    ON s1.studentId = s2.id;
#计算每个学生的总成绩？？？？

#计算每个考试科目的平均成绩
SELECT course,avg(grade)
FROM db_test.score
GROUP BY course;
#查询计算机成绩低于95的学生信息
SELECT *
FROM db_test.student s1 INNER JOIN db_test.score s2
    ON s1.id = s2.studentId
WHERE course = '计算机' AND grade < 95;
#查询同时参加计算机和英语考试的学生的信息
SELECT s1.*
FROM db_test.student s1 INNER JOIN db_test.score s2
    ON s1.id = s2.studentId
WHERE s2.course = '英语' AND s2.course = '计算机';
#将计算机考试成绩按从高到低进行排序
SELECT grade
FROM db_test.score
WHERE course = '计算机'
ORDER BY grade DESC;
#从student表和score表中查询出学生的学号，然后合并查询结果
SELECT s1.id,s2.studentId
FROM db_test.student s1 LEFT OUTER JOIN db_test.score s2
    ON s1.id = s2.studentId;
#查询姓张或者姓王的同学的姓名、院系和考试科目及成绩
SELECT s1.name,s1.department,s2.course,s2.grade
FROM db_test.student s1 LEFT OUTER JOIN db_test.score s2
    ON s1.id = s2.studentId
WHERE s1.name REGEXP '王' OR s1.name REGEXP '张';
#查询都是湖南的学生的姓名、年龄、院系和考试科目及成绩
SELECT s1.name,s1.dob,s1.department,s2.course,s2.grade
FROM db_test.student s1 INNER JOIN db_test.score s2
    ON s1.id = s2.studentId
WHERE s1.address REGEXP '湖南';
