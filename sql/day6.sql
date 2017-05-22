# 返回拥有员工的部门名、部门号
SELECT DISTINCT
  dept.DEPTNO,
  DNAME
FROM scott.emp
  INNER JOIN scott.dept
    ON scott.dept.DEPTNO = scott.emp.DEPTNO;

#工资多于 scott 的员工信息
SELECT DISTINCT
  d.DEPTNO,
  d.DNAME
FROM scott.dept d
  INNER JOIN scott.emp e
    ON e.DEPTNO = d.DEPTNO;

# 返回员工和所属经理的姓名
SELECT
  e1.ENAME 员工姓名,
  e2.ENAME 经理姓名
FROM scott.emp e1 INNER JOIN scott.emp e2  -- 自连接
    ON e1.MGR = e2.EMPNO;

-- OUTER JOIN  外连接
SELECT e.ENAME, d.DNAME
FROM scott.emp e LEFT OUTER JOIN scott.dept d
  ON e.DEPTNO = d.DEPTNO;

