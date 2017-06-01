DROP TABLE db_1702.csdn;
CREATE TABLE IF NOT EXISTS db_1702.csdn (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  username VARCHAR(255) COMMENT '用户名',
  password VARCHAR(255) COMMENT '密码',
  email    VARCHAR(255) COMMENT '邮箱'
)
  COMMENT 'CSDN 用户表';

SELECT count(*)
FROM db_1702.csdn;

LOAD DATA LOCAL INFILE 'C:\\Users\\ASUS\\Desktop\\www.csdn.net.sql'
INTO TABLE db_1702.csdn
FIELDS TERMINATED BY ' # ' (username, password, email)
SET id = NULL;

SELECT password
FROM db_1702.csdn
GROUP BY password
ORDER BY count(password) DESC
LIMIT 10;

SELECT *
FROM db_1702.csdn;