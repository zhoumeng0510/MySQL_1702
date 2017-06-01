DROP DATABASE IF EXISTS db_user;
CREATE DATABASE db_user;
use db_user;
DROP TABLE IF EXISTS db_user.student;
CREATE TABLE IF NOT EXISTS db_user.student(
  id int AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  name VARCHAR(255) NOT NULL COMMENT '姓名',
  password VARCHAR(255) NOT NULL COMMENT '密码',
  packers VARCHAR(255)NOT NULL COMMENT '组别：one-第一组；two-第二组；three-第三组',
  type VARCHAR(255)NOT NULL COMMENT '类别：emp-组员；leader-组长'
)COMMENT '注册表';



CREATE TABLE IF NOT EXISTS db_user.blog(
  id int AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  content VARCHAR(255)NOT NULL COMMENT '内容',
  time DATETIME DEFAULT now() COMMENT '时间',

)
