desc dual;

--���� �Լ���

select 34.5678, 
floor(34.5678)
from dual;

SELECT *
from emp
WHERE  mod(empno,2)=1;
--�Լ��� ù��° ���ڰ� �÷�,

SELECT  'welcom oracle', upper('welcom oracle')
from dual;
--�빮�� ��ȯ
select  'Welcom to oracle', lower('WELCOM TO ORACLE')
from dual;
--�ҹ��� ��ȯ
select  'welcome to oracle', initcap('welcome to oracle')
from dual;
--ù���ڸ� �빮�ڷ�

select length('oracle'), length('����Ŭ')
from dual;
--���� ���� ���ϱ�

select lengthb('oracle'), lengthb('����Ŭ')
from dual;
--����Ʈ ������ ���ڼ���

select substr('welcome to oracle',4,3)
from dual;
--���� ���� (�ռ��� �׹�°, ������ ����)
select substr('welcome to oracle', -4,3)
from dual;

select substr(hiredate,1,2)�⵵, substr(hiredate,4,2)��
from emp;

select *
from emp
where substr(hiredate, 4,2)='09';
--9�� �Ի��� ��� ��

select *
from emp
where substr(hiredate,1,2)='87';

select *
from emp
where substr(ename,-1,1)='E';

select *
from emp 
where instr(ename,'R')=3;

select lpad('oracle',20,'#')
from dual;
--���ʺ��� 20�� ������ #�� ä��
select rpad('oracle',20,'#')
from dual;
--������ ����  �� 20�������� #�� ä��

select ltrim('         oracle      ')
from dual;

select rtrim('          oracle           ')
from dual;

select trim('a' from 'aaaaaaaOracleaaaa')
from dual;
--trim�� ���� from�տ�, �� �߶󳽴�.

select trim('        oracle        ')
from dual;
--�յڷ� �� �߶󳽴�.


select hiredate, Last_day(hiredate)
from emp;
--���� ������ ���� ���ϴ� �Լ�

select sysdate
from dual;
--���� ��¥ ���ϱ�
select sysdate, to_char(sysdate,'yyyy-mm-dd')
from dual;
--��¥�� ����������

select hiredate, to_char(hiredate,'yyyy-mm-dd')
from emp;

select hiredate, to_char(hiredate,'yy-mm-dd-dy')
from emp;
--dy�� ����

select to_char(sysdate,'yy-mm-dd-dy, hh24:mi:ss')
from dual;
--hh24 24�ð� mi�� ss��

select to_char(1230000)
from dual;

select ename,sal, to_char(sal,'L999,999')
from emp;
--���� ��ȭ�� �ٲٰ� ���ڸ������� ����

select to_char(12345600,'000000000000'), to_char(12345600,'999,999,999')
from dual;
--�����ڸ��� 0���� ä��ų� 9�� �����ϰų�..

select ename, hiredate 
from emp
where hiredate = to_date(19810220,'YYYYMMDD');
--�ش� �������� ��ȯ
select trunc(sysdate-to_date('2008/01/01','yyyy/mm/dd'))
from dual;
--���� ��¥���� �� ��¥�� ������ ���� 

select TO_NUMBER('20,000', '99,999') - to_number('10,000','99,999')
from dual;
--�������� ���������� ��ȯ�� ����

select ename, sal, comm, sal*12+nvl(comm,0)
from emp
order by job;
--nvl�� null�� ����Ҷ� Ȥ�� �ٸ������� ��ȯ�Ҷ�

select ename,sal,nvl(to_char(mgr,'9999'),'ceo')manager
from emp
where mgr is null;



select ename,deptno,
        decode(deptno,10,'ACCOUNTING',
        20,'RESEARCH',
        'SALES')
        as dname
        from emp;
        
--ǥ����, ����, ���, ����,���2, ����,���3 �⺻��� n)
select ename, sal,
decode(job, 'ANALIST',sal*1.05,
'SALESMAN',sal*1.1,
'MANAGER',sal*1.15,
sal*1.2) as UPSAL
from emp;
-- decode�� ��ġ�ϴ� ���Ǹ� ����� ������ش�.

select ename,deptno,
          case when deptno=10 then 'ACCOUNTING'
                  when deptno=20 then 'RESERCH'
                  when deptno=30 then 'SALES'
                  when deptno=40 then 'OPERATIONS'
                  end as dname --else 'OPERATIONS'�� ��밡��
                  from emp;
--case when then �� ��ȣ �Ӹ��ƴ϶� �ε�ȣ�� ��

select sum(sal)
from emp;
--�ش� �÷��� �հ� ���ϴ� �Լ�

select sum(sal)
from emp
where deptno=10;
--�׷쿬���� �����Ѵ� �ش� �÷���ü�� ����;;

SELECT SUM(COMM)
FROM EMP;
--NULL�� �����ϰ� ���Ѵ�.

SELECT MAX(SAL), MIN(SAL)
FROM EMP;
--�׷��Լ����� ������ ������� �ϳ��� ��µȴ�.

SELECT MAX(HIREDATE),MIN(HIREDATE)
FROM EMP;
--��¥�� ����


SELECT COUNT(COMM)
FROM EMP;
--�ο��� ������ ������ NULL�� �����Ѵ�.

SELECT  COUNT(*)
FROM EMP;
--*�� ������ ��ü ROW�� ������ ���Ѵ�.

SELECT COMM
FROM EMP
WHERE COMM IS NULL;

SELECT COUNT(COMM)
FROM EMP
WHERE DEPTNO=10;
--���ó� �׷���ü�� �����ϰ� �ϳ��� ����������.

SELECT COUNT(DISTINCT JOB)
FROM EMP;
--DISTINCTŰ����� �ߺ������ϰ� ������������ ���ϱ�

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--�׷��� �и��ϰ� SUM�� �����ϸ� �ش� �׷쿡 ���� ������� ������ �ִ�.

SELECT DEPTNO,MAX(SAL),MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, COUNT(*), COUNT(COMM)
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL)>=2000;
--HAVING ���� �ݵ�� GROUP BY �� �Բ� ���Ǹ� �׷���  Ư�� ������ �߰��� �� �ִ�.

SELECT DEPTNO,COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>=5;

