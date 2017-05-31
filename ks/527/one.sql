DROP DATABASE IF EXISTS ks_test;
CREATE DATABASE ks_test;

DROP TABLE IF EXISTS ks_test.t1;
CREATE TABLE ks_test.t1 (
  id       INT                   AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  email     VARCHAR(255) UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '账户',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  role     VARCHAR(255) NOT NULL DEFAULT 'user'
  COMMENT '角色：user-用户；admin-管理员'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS ks_test.message;
CREATE TABLE ks_test.message (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content TEXT     NOT NULL
  COMMENT '内容',
  time    DATETIME NOT NULL DEFAULT now()
  COMMENT '时间',
  userId  INT      NOT NULL
  COMMENT 'FK 用户ID'
)
  COMMENT '留言表';

ALTER TABLE ks_test.message
  ADD CONSTRAINT message_fk_userId
FOREIGN KEY (userId)
  REFERENCES ks_test.t1(id);

-- SQL
# 1.用户登录
INSERT INTO ks_test.t1(email, username, password) VALUE ('tester@qq.com','tom','123');

SELECT *
FROM ks_test.t1;

# 2.登陆判断

SELECT *
FROM ks_test.t1
WHERE email = 'tester@qq.com'AND password='123';

# 3.发布留言

INSERT INTO ks_test.message(content,userId)
    VALUE ('留言内容1...',1);
INSERT INTO ks_test.message(content,userId)
    VALUE ('留言内容2...',1);

SELECT *
FROM ks_test.message;

# 4.添加管理员

INSERT INTO ks_test.t1
    VALUE (NULL ,'admin@qq.com','Jerry','123','admin');

SELECT *
FROM ks_test.t1;

# 5.查询留言列表


SELECT t.username,m.content,m.time
FROM ks_test.t1 t INNER JOIN ks_test.message m
ON t.id= m.userId;

# 6.删除留言

delete from ks_test.message
WHERE id=2;