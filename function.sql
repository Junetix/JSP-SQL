desc dual;

--숫자 함수들

select 34.5678, 
floor(34.5678)
from dual;

SELECT *
from emp
WHERE  mod(empno,2)=1;
--함수의 첫번째 인자가 컬럼,

SELECT  'welcom oracle', upper('welcom oracle')
from dual;
--대문자 변환
select  'Welcom to oracle', lower('WELCOM TO ORACLE')
from dual;
--소문자 변환
select  'welcome to oracle', initcap('welcome to oracle')
from dual;
--첫문자만 대문자로

select length('oracle'), length('오라클')
from dual;
--문자 개수 구하기

select lengthb('oracle'), lengthb('오라클')
from dual;
--바이트 단위로 문자세기

select substr('welcome to oracle',4,3)
from dual;
--문자 추출 (앞서터 네번째, 추출할 개수)
select substr('welcome to oracle', -4,3)
from dual;

select substr(hiredate,1,2)년도, substr(hiredate,4,2)달
from emp;

select *
from emp
where substr(hiredate, 4,2)='09';
--9월 입사사원 출력 예

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
--왼쪽부터 20개 나머지 #로 채움
select rpad('oracle',20,'#')
from dual;
--오른쪽 부터  총 20개나머지 #로 채움

select ltrim('         oracle      ')
from dual;

select rtrim('          oracle           ')
from dual;

select trim('a' from 'aaaaaaaOracleaaaa')
from dual;
--trim의 조건 from앞에, 는 잘라낸다.

select trim('        oracle        ')
from dual;
--앞뒤로 다 잘라낸다.


select hiredate, Last_day(hiredate)
from emp;
--월의 마지막 날을 구하는 함수

select sysdate
from dual;
--현재 날짜 구하기
select sysdate, to_char(sysdate,'yyyy-mm-dd')
from dual;
--날짜를 문자형으로

select hiredate, to_char(hiredate,'yyyy-mm-dd')
from emp;

select hiredate, to_char(hiredate,'yy-mm-dd-dy')
from emp;
--dy는 요일

select to_char(sysdate,'yy-mm-dd-dy, hh24:mi:ss')
from dual;
--hh24 24시간 mi분 ss초

select to_char(1230000)
from dual;

select ename,sal, to_char(sal,'L999,999')
from emp;
--지역 통화로 바꾸고 세자리수마다 끊기

select to_char(12345600,'000000000000'), to_char(12345600,'999,999,999')
from dual;
--남는자리를 0으로 채우거나 9는 생략하거나..

select ename, hiredate 
from emp
where hiredate = to_date(19810220,'YYYYMMDD');
--해당 포맷으로 변환
select trunc(sysdate-to_date('2008/01/01','yyyy/mm/dd'))
from dual;
--현재 날짜에서 저 날짜를 뺀값을 리턴 

select TO_NUMBER('20,000', '99,999') - to_number('10,000','99,999')
from dual;
--문자형을 숫자형으로 변환후 연산

select ename, sal, comm, sal*12+nvl(comm,0)
from emp
order by job;
--nvl은 null을 계산할때 혹은 다른값으로 변환할때

select ename,sal,nvl(to_char(mgr,'9999'),'ceo')manager
from emp
where mgr is null;



select ename,deptno,
        decode(deptno,10,'ACCOUNTING',
        20,'RESEARCH',
        'SALES')
        as dname
        from emp;
        
--표현식, 조건, 결과, 조건,결과2, 조건,결과3 기본결과 n)
select ename, sal,
decode(job, 'ANALIST',sal*1.05,
'SALESMAN',sal*1.1,
'MANAGER',sal*1.15,
sal*1.2) as UPSAL
from emp;
-- decode는 일치하는 조건만 결과만 만들어준다.

select ename,deptno,
          case when deptno=10 then 'ACCOUNTING'
                  when deptno=20 then 'RESERCH'
                  when deptno=30 then 'SALES'
                  when deptno=40 then 'OPERATIONS'
                  end as dname --else 'OPERATIONS'도 사용가능
                  from emp;
--case when then 은 등호 뿐만아니라 부등호도 됨

select sum(sal)
from emp;
--해당 컬럼의 합계 구하는 함수

select sum(sal)
from emp
where deptno=10;
--그룹연산을 수행한다 해당 컬럼전체에 대해;;

SELECT SUM(COMM)
FROM EMP;
--NULL은 제외하고 구한다.

SELECT MAX(SAL), MIN(SAL)
FROM EMP;
--그룹함수들은 무조건 결과값이 하나가 출력된다.

SELECT MAX(HIREDATE),MIN(HIREDATE)
FROM EMP;
--날짜도 가능


SELECT COUNT(COMM)
FROM EMP;
--로우의 갯수를 세지만 NULL은 제외한다.

SELECT  COUNT(*)
FROM EMP;
--*를 넣으면 전체 ROW의 개수를 구한다.

SELECT COMM
FROM EMP
WHERE COMM IS NULL;

SELECT COUNT(COMM)
FROM EMP
WHERE DEPTNO=10;
--역시나 그룹전체를 연산하고 하나의 값만가진다.

SELECT COUNT(DISTINCT JOB)
FROM EMP;
--DISTINCT키워드로 중복제외하고 직업종류개수 구하기

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--그룹을 분리하고 SUM을 수행하면 해당 그룹에 따라 결과값을 가질수 있다.

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
--HAVING 절은 반드시 GROUP BY 와 함께 사용되며 그룹의  특정 조건을 추가할 수 있다.

SELECT DEPTNO,COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>=5;

