select * from tab;

desc emp;

select * from dept;

select deptno,dname from dept;

select deptno as "�μ���ȣ" from dept;

select deptno  "�μ���ȣ" from dept;

select * from emp;

select empno,ename from emp;

select ename,sal, hiredate from emp;

select sal+comm from emp;
select sal-100 from emp;
select sal*10 as "����" from emp;

select ename,sal,job,comm, sal*12, sal *12+comm
from emp;

select ename,sal,job,comm, sal*12, sal *12+nvl(comm,0)
from emp;

select ename, sal*12+nvl(comm,0) as "total"
from emp;

select deptno as "�μ���ȣ", dname as "�μ���"
from dept;

select ename || 'is a' || job
from emp;

select deptno
from emp;

select distinct deptno
from emp;

select job
from emp;

select distinct job
from emp;

