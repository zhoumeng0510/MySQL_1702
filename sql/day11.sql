use scott;

show TABLES ;

SELECT *
FROM scott.emp;

SELECT *
FROM scott.dept;

-- NF  Normal Forms 范式   ;没有复义的列，列值唯一;

SELECT *
FROM scott.salgrade;

show full COLUMNS FROM scott.salgrade;
