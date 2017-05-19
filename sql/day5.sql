SELECT *
FROM scott.emp
LIMIT 3;

SELECT *
FROM scott.emp
LIMIT 3,4;

SELECT *
FROM scott.emp
LIMIT 5 OFFSET 0; -- offset 偏移,\ 抵消,\ 位移

SELECT *
FROM scott.emp
ORDER BY ENAME
LIMIT 3 OFFSET 0;

SELECT *
FROM scott.emp
WHERE ENAME LIKE 'a%'; -- like  想  模糊匹配  % 表示任意长度的任意字符

SELECT *
FROM scott.emp
WHERE ENAME LIKE '%\_%' ESCAPE '\\';

INSERT INTO scott.emp (EMPNO, ENAME) VALUES (2222, 'A_ADAMS');

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[^a-c]+';

SELECT *
FROM scott.emp
WHERE HIREDATE REGEXP '';

SELECT *
FROM scott.emp
WHERE DEPTNO NOT IN (10,20);

SELECT *
FROM scott.emp
WHERE JOB NOT IN ('manager','clerk');

SELECT *
FROM scott.emp
-- WHERE sal >= 2000 AND sal <=3000;
WHERE SAL NOT BETWEEN 2000 AND 3000;

SELECT ENAME AS '姓名',SAL AS '基本工资' -- as 可以不写
FROM scott.emp;

SELECT *
FROM scott.emp AS e ;

SELECT *
FROM scott.emp
WHERE DEPTNO IS NOT NULL ;

SELECT *
FROM scott.emp
WHERE COMM IS NULL ;

UPDATE scott.emp
    SET JOB = NULL
WHERE ENAME = 'jones';

SELECT
  ENAME,
  SAL + ifnull(COMM,0)
FROM scott.emp;