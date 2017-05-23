DROP DATABASE IF EXISTS db_sc;
CREATE DATABASE db_sc;

# 学生表
DROP TABLE IF EXISTS db_sc.student;
CREATE TABLE db_sc.student (
  id           INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name         VARCHAR(255) COMMENT '姓名',
  age          INT COMMENT '年龄',
  gender       VARCHAR(255) COMMENT '性别',
  dob          DATE COMMENT '出生日期',
  departmentId INT COMMENT 'FK 系 ID'
)
  COMMENT '学生表';

# 系别表
DROP TABLE IF EXISTS db_sc.department;
CREATE TABLE db_sc.department (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title VARCHAR(255) COMMENT '系名称',
  tel   VARCHAR(255) COMMENT '电话'
)
  COMMENT '系别表';

# 课程表
DROP TABLE IF EXISTS db_sc.course;
CREATE TABLE db_sc.course (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title  VARCHAR(255) COMMENT '课程名称',
  credit INT COMMENT '学分'
)
  COMMENT '课程表';

# 选课表
DROP TABLE IF EXISTS db_sc.student_course;
CREATE TABLE db_sc.student_course (
  studentId INT COMMENT 'FK 学生 ID',
  courseId  INT COMMENT 'FK 课程 ID',
  score     INT COMMENT '考试成绩',
  PRIMARY KEY (studentId, courseId)
)
  COMMENT '选课表';

ALTER TABLE db_sc.student
  ADD CONSTRAINT
  student_fk_departmentId
FOREIGN KEY (departmentId)
REFERENCES db_sc.department (id);

ALTER TABLE db_sc.student_course
  ADD CONSTRAINT
  student_course_fk_studentId
FOREIGN KEY (studentId)
REFERENCES db_sc.student (id);

ALTER TABLE db_sc.student_course
  ADD CONSTRAINT
  student_course_fk_courseId
FOREIGN KEY (courseId)
REFERENCES db_sc.course (id);

INSERT INTO db_sc.department VALUES (NULL, 'CS', '12345678'), (NULL, 'EE', '12345678');
INSERT INTO db_sc.student VALUES (NULL, 'name1', 20, 'M', '1999-1-1', 1), (NULL, 'name2', 20, 'M', '1999-1-1', 2);
INSERT INTO db_sc.course VALUES (NULL, 'Java SE', 5), (NULL, 'MySQL', 4);
INSERT INTO db_sc.student_course VALUES (1, 1, NULL), (1, 2, NULL), (2, 2, NULL);


SELECT *
FROM db_sc.student;
SELECT *
FROM db_sc.department;
SELECT *
FROM db_sc.course;
SELECT *
FROM db_sc.student_course;

INSERT INTO db_sc.student_course VALUES (1, 1, NULL);

-- id=1的学生选了哪些课？
SELECT
  s.name,
  c.title
FROM db_sc.student s INNER JOIN db_sc.course c
  INNER JOIN db_sc.student_course sc
    ON s.id = sc.studentId AND c.id = sc.courseId
WHERE s.id = 1;

-- id=2的课有哪些学生选？
SELECT
  c.title,
  s.name
FROM db_sc.student s INNER JOIN db_sc.course c
  INNER JOIN db_sc.student_course sc
    ON s.id = sc.studentId AND c.id = sc.courseId
WHERE c.id = 2;

-- 所有学生获得的总学分？ - student course student_course

/*
  ----------
  Tom   | 10
  ------+---
  Jerry |  5
*/


-- person
#   name
#   ...

-- address
#   loc
#   ...

# 1 person - 1 address  1 对 1
# 1 person - n address  1 对 多
# n person - 1 address  多 对 1
# n person - n address  多 对 多

# student - course n:n
# student - student_course 1:n
# course - student_course 1:n
