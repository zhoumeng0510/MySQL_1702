# drop table if exists db_1702;
# create database db_1702;

DROP TABLE IF EXISTS db_1702.student;
CREATE TABLE db_1702.student (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id',
  name   VARCHAR(255) COMMENT '姓名',
  intro  TEXT COMMENT '简介',
  gender CHAR(2) COMMENT '性别',
  age    INT UNSIGNED COMMENT '年龄',
  height DOUBLE(3, 2) COMMENT '身高',
  price  DECIMAL(6, 2) COMMENT '价格',
  dob    DATE COMMENT '出生日期', -- date of birth
  time   DATETIME COMMENT '时间'
);

INSERT INTO db_1702.student VALUE (NULL, 'tom', 'yellow', 'm', 18, 1.75, 123.456, '1996-5-10', '2017-5-16 10:55:00');

SELECT *
FROM db_1702.student;

DELETE FROM db_1702.student
WHERE id > 1 AND id < 18;

DELETE FROM db_1702.student;

TRUNCATE TABLE db_1702.student; -- truncate  清空

-- 课程表 课程名 学分 ...
DROP TABLE IF EXISTS db_1702.course;
CREATE TABLE db_1702.course (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID Pk',
  title  VARCHAR(191) UNIQUE
  COMMENT '课程名',
  credit INT COMMENT '学分'
);

-- 选课表 学生<->课程
DROP TABLE IF EXISTS db_1702.student_course;
CREATE TABLE db_1702.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT '学生 ID',
  courseId  INT COMMENT '课程 ID',
  score     INT COMMENT '考试成绩'
  --  PRIMARY KEY (studentId, courseId) -- 联合主键
);

SELECT *
FROM db_1702.student;

INSERT INTO db_1702.course VALUES (NULL, 'Java SE', 4);
INSERT INTO db_1702.course VALUES (NULL, 'MySQL', 3);
INSERT INTO db_1702.course VALUES (NULL, NULL, 3);
INSERT INTO db_1702.course VALUES (NULL, NULL, 3);
INSERT INTO db_1702.course VALUES (NULL, NULL, 3);

SELECT *
FROM db_1702.course;

INSERT INTO db_1702.student_course VALUES (NULL, 2, 1, NULL);
INSERT INTO db_1702.student_course VALUES (NULL, 2, 2, NULL);
INSERT INTO db_1702.student_course VALUES (NULL, 1, 2, NULL);

SELECT *
FROM db_1702.student_course;

UPDATE db_1702.student_course
SET db_1702.student_course.score = 50
WHERE id = 1;
-- WHERE db_1702.student_course.courseId = 2 AND db_1702.student_course.studentId = 1;

SHOW FULL COLUMNS FROM db_1702.student_course;

SHOW VARIABLES LIKE 'char%';