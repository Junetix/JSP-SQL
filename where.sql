select * from emp
where deptno =10;

select empno, ename,sal 
from emp
where sal<=1500;

select empno,ename,sal
from emp
where ename='FORD';

select empno,ename,sal
from emp
where ename ='SCOTT';

select *
from emp
where hiredate>='82/01/01';

select *
from emp
where deptno= 10 and job='MANAGER';

select * 
from emp
where deptno=10 or job = 'MANAGER';

select *
from emp
where not deptno=10;

select *
from emp
where sal>=2000 and sal<=3000;

select *
from emp
where comm=300 or comm=500 or comm=1400; 

select empno,sal 
from emp
where empno=7521 or empno= 7654 or empno=7844;

select *
from emp
where sal between 1500 and 3000;

select *
from emp
where sal not between 2000 and 3000;


select *
from emp
where hiredate between '87/01/01' and '87/12/31';

select *
from emp
where comm in(300,500,1400);

select *
from emp 
where empno in(7521,7654,7844);


select *
from emp
where comm not in(300,500,1400);

select *
from emp
where empno not in(7521,7654,7884);

select *
from emp
where not empno=7521 and not empno=7654 and not empno=7884; 


select *
from emp
where ename like 'F%';

select *
from emp
where ename like 'J%';

select *
from emp
where ename like 'J%' or ename like '%A%';

select *
from emp
where ename like '%N';

select  empno,ename
from emp
where ename like 'K%';

select *
from emp
where ename like '_A%';

select *
from emp;

select *
from emp
where comm is not null;

select *
from emp
where mgr is null;

select *
from emp
order by sal asc;
-- 정렬은 order
select *
from emp
order by sal;

select *
from emp
order by hiredate desc;
--(desc는 내림 asc는 오름차순 asending desending)
select *
from emp
order by sal desc, ename asc;
--첫번째를 우선으로.. 두번째는 그 정렬 내에서 (나열 순서)

select *
from emp
order by deptno asc, hiredate desc;

--부서번호는 빠른순서 입사일은 최근 입사자부터..


