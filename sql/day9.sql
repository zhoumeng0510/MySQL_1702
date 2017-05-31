SELECT max(SAL)
FROM scott.emp;

SELECT
  JOB,
  max(SAL)
FROM scott.emp
GROUP BY JOB; -- group 组

SELECT password
FROM db_1702.csdn
GROUP BY password
ORDER BY count(password) DESC
LIMIT 10 OFFSET 0;

SELECT substr(email, locate('@', email) + 1)
FROM db_1702.csdn
GROUP BY substr(email, locate('@', email) + 1)
ORDER BY count(substr(email, locate('@', email) + 1)) DESC
LIMIT 10;

SELECT
  JOB,
  DEPTNO,
  max(SAL)
FROM scott.emp
GROUP BY JOB, DEPTNO;

-- --------------------------------------------------

SELECT *
FROM scott.emp;

SELECT *
FROM mysql.user;

-- DBA
-- DCL


GRANT CREATE ON scott.* TO 'tester'@'localhost';
GRANT SELECT ON scott.* TO 'tester'@'localhost';
GRANT DROP ON scott.* TO 'tester'@'localhost';
GRANT ALL ON scott.* TO 'tester'@'localhost';

REVOKE SELECT ON scott.* FROM 'tester'@'localhost';
REVOKE DROP ON scott.* FROM 'tester'@'localhost';

RENAME USER tester@'localhost' to tester_new;

DROP user tester_new@'%';



CREATE DATABASE db_test; -- 1. root
CREATE USER 'tester'@'localhost' -- 2. new user
  IDENTIFIED BY 'test123';
GRANT ALL ON db_test.* TO 'tester'@'localhost'; -- 3. grant all to new user