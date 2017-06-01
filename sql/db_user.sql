DROP DATABASE IF EXISTS db_user;
CREATE DATABASE db_user;
USE db_user;
DROP TABLE IF EXISTS db_user.student;
CREATE TABLE IF NOT EXISTS db_user.student (
  id       INT                   AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name     VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  packers  VARCHAR(255) NOT NULL
  COMMENT '组别：one-第一组；two-第二组；three-第三组',
  type     VARCHAR(255) NOT NULL DEFAULT '员工'
  COMMENT '类别：emp-组员；leader-组长'
)
  COMMENT '注册表';
SELECT *
FROM db_user.student;


CREATE TABLE IF NOT EXISTS db_user.blog (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content TEXT NOT NULL
  COMMENT '内容',
  time    DATE NOT NULL
  COMMENT '时间',
  userId  INT COMMENT 'FK用户 ID'
)
  COMMENT '日志表';
SELECT *
FROM db_user.blog;

INSERT INTO db_user.student (name, password, packers, type) VALUE ('emp1', '123', '第一组', '组员');
INSERT INTO db_user.student (name, password, packers, type) VALUE ('emp2', '123', '第一组', '组员');
INSERT INTO db_user.student (name, password, packers, type) VALUE ('emp3', '123', '第二组', '组员');
INSERT INTO db_user.student (name, password, packers, type) VALUE ('leader1', '123', '第一组', '组长');
INSERT INTO db_user.student (name, password, packers, type) VALUE ('leader2', '123', '第二组', '组长');

INSERT INTO db_user.blog VALUE (NULL, 'content1 1', '2017-5-31', 1);
INSERT INTO db_user.blog VALUE (NULL, 'content1 2', '2017-6-1', 1);
INSERT INTO db_user.blog VALUE (NULL, 'content2 1', '2017-5-31', 2);
INSERT INTO db_user.blog VALUE (NULL, 'content2 2', '2017-6-1', 2);
INSERT INTO db_user.blog VALUE (NULL, 'content3 1', '2017-5-31', 3);
INSERT INTO db_user.blog VALUE (NULL, 'content4 1', '2017-5-31', 4);
INSERT INTO db_user.blog VALUE (NULL, 'content5 1', '2017-5-31', 5);

-- 登录

SELECT *
FROM db_user.student
WHERE name = 'emp1' AND password = '123';

-- 员工查看自己的日志

SELECT
  content,
  time
FROM db_user.blog
WHERE userId = 1;

-- 组长查看本组日志

SELECT
  s.name,
  b.content,
  b.time
FROM db_user.student s LEFT OUTER JOIN db_user.blog b
    ON s.id = b.userId
WHERE s.packers = '第一组';

SELECT
  s.name,
  b.content,
  b.time
FROM db_user.student s INNER JOIN db_user.blog b
    ON s.id = b.userId
WHERE s.packers = '第一组' AND s.name = 'emp1';

SELECT
  s.name,
  b.content,
  b.time
FROM db_user.student s INNER JOIN db_user.blog b
    ON s.id = b.userId
WHERE s.packers = '第一组' AND b.time = '2017-6-1';

SELECT
  s.name,
  b.content,
  b.time
FROM db_user.student s INNER JOIN db_user.blog b
    ON s.id = b.userId
WHERE s.packers = '第一组' AND s.name = 'emp2' AND b.time = '2017-5-31';
