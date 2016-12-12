select *
from emp,dept;
--cross join T1* T2 
--ū �ǹ̾��� ����

SELECT *
FROM EMP,DEPT
WHERE ENAME='SCOTT';

--EQUI JOIN
--�� ���̺��� �����ϴ� F KEY�� ��ġ�Ǵ� ���� �����ϴ� ���
SELECT *
FROM EMP,DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO;
--�ش� ���̺��� .���� �÷��� ����(������)

SELECT EMP.EMPNO,EMP.ENAME,EMP.DEPTNO,DEPT.DNAME 
FROM EMP,DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO
AND ENAME='SCOTT';
--���� �ϳ��� �ΰ��� ���̺����� ���ϴ� ���� ���ߴ�.
--����!!!! �� ���̺��� �������� ���� �÷����� �ݵ�� �����ؾ� �Ѵ�. 

--��Ī �����

SELECT E.NAME, D.DNAME, E.DEPTNO, D.DEPTNO
FROM EMP  E, DEPT  D
WHERE E.DEPTNO = D.DEPTNO
AND E.ENAME='SCOTT';

--������
SELECT ENAME, SAL
FROM EMP, DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO
AND DEPT.LOC='NEW YORK';

--ACCOUNTING �μ� 

SELECT ENAME,HIREDATE
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND DEPT.DNAME='ACCOUNTING';

--�Ŵ���
SELECT ENAME,DEPT.DNAME
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND EMP.JOB='MANAGER';

--NON EQUI JOIN

SELECT ENAME, SAL, GRADE, LOSAL,HISAL
FROM EMP,SALGRADE
WHERE SAL>=SALGRADE.LOSAL AND SAL<=HISAL;
--�ε�ȣ�� ����� JOIN �� NOT EQUI JOIN


--SELF JOIN ���� 
--MGR�� �����ȣ��. �ش� �����ȣ�� ���� ��縦 ���غ���
--�� ���̺����� ���� ���ؼ� ã�ƾ��ϴ� ���
SELECT ENAME, MGR
FROM EMP
WHERE ENAME='SMITH';

SELECT EMPNO, ENAME
FROM EMP
WHERE EMPNO=7902;
--�ΰ��� �������� ����ߴ�.
--SELF JOIN
SELECT E1.ENAME ||'�� �Ŵ�����'|| E2.ENAME ||'�Դϴ�'
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO --��簡 ������
AND E1.ENAME='SMITH'; --���̽��� 
--�ϳ��� ���̺��� ��Ī�� �ΰ� ���� ���� ���غ���.

SELECT E1.ENAME,E1.JOB
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E2.ENAME='KING';

SELECT E1.ENAME, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.DEPTNO= E2.DEPTNO
AND E1.ENAME='SCOTT';
--AND E2.ENAME<>'SCOTT';

SELECT *
FROM EMP
WHERE DEPTNO=20;


--OUTER JOIN
--(+)��ȣ�� ��Ÿ���� ��Ī�� ���� ���� �������� �����ش�.
SELECT E.ENAME ||'�� �Ŵ�����'||E2.ENAME||'�Դϴ�'
FROM EMP E, EMP E2
WHERE E.MGR =E2.EMPNO(+);


SELECT EMP.ENAME, DEPT.DEPTNO, DEPT.DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO(+)=DEPT.DEPTNO
ORDER BY DEPT.DEPTNO;


--ANSI ������
--���� ���� �������� ���Ǵ� JOIN����..
--CROSS JOIN
SELECT *
FROM EMP CROSS JOIN DEPT;

--INNER JOIN

SELECT ENAME, DNAME
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO=DEPT.DEPTNO --ON���� ���� ������ ��´�. WHERE ���� ������ �ٸ� ������ �����ϸ�ȴ�.
WHERE ENAME ='SCOTT';

--ON �� ���� �ʵ尡 �� ��� USING ���

SELECT ENAME, DNAME
FROM EMP INNER JOIN DEPT
USING (DEPTNO) --��Ī���� �� ���̺��� �����ʵ���� ��ȣ�ȿ� �ִ´�.
WHERE ENAME = 'SCOTT';

--NATURAL JOIN 
--�����÷��� �˾Ƽ� ã�� �������ش�.
--
SELECT *
FROM EMP NATURAL JOIN DEPT
ORDER BY DEPTNO;


--OUTER JOIN

DROP TABLE DEPT01;

CREATE TABLE DEPT01(
DEPTNO NUMBER(2),
DNAME VARCHAR(14));

DESC DEPT01;

SELECT *
FROM DEPT01;

INSERT INTO DEPT01(DEPTNO,DNAME) VALUES(10,'ACCOUNTING'); -- ����ʵ忡 ������ �Է��� ��� ���̺� �̸��տ� �ʵ���� ���������ϴ�
INSERT INTO DEPT01 VALUES(20,'RESERCH');

CREATE TABLE DEPT02(
DEPTNO NUMBER(2),
DNAME VARCHAR2(14));

INSERT INTO DEPT02 VALUES(10,'ACCOUNTING');
INSERT INTO DEPT02 VALUES(30,'SALES');

SELECT *
FROM DEPT02;

SELECT *
FROM DEPT01,DEPT02
WHERE DEPT01.DEPTNO = DEPT02.DEPTNO(+);

SELECT *
FROM DEPT01 LEFT OUTER JOIN DEPT02
ON DEPT01.DEPTNO = DEPT02.DEPTNO;

SELECT *
FROM DEPT01 RIGHT OUTER JOIN DEPT02
USING(DEPTNO);

--���� ����
-- ���������� SELECT Ű���� ���� �ٸ� SELECT ��
--���������� ���� ���� �������� �� �ѹ��� ����ȴ�.

--������ �������� �ʵ�=���ϳ�
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
                        FROM EMP
                        WHERE ENAME='SCOTT' )
	 AND NOT ENAME='SCOTT';

SELECT *
FROM EMP
WHERE JOB=(SELECT JOB
                    FROM EMP
                    WHERE ENAME='SCOTT');
--SCOTT�� �޿��� �����ϰų� �������
SELECT *
FROM EMP
WHERE SAL>=(SELECT SAL
                      FROM EMP
                      WHERE ENAME='SCOTT');
                      
--DALLAS���� �ٹ��ϴ� ����̸� �μ���ȣ
SELECT EMP.ENAME,EMP.DEPTNO
FROM EMP
WHERE EMP.DEPTNO=(SELECT DEPTNO
                          FROM DEPT
                          WHERE LOC='DALLAS');

--SALES�μ� �޿� �̸� ���
SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
                          FROM DEPT
                          WHERE DNAME='SALES');
--���(MGR)�� KING�� ����� ���		      
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO --���� ���� �� �ʵ�� ���� ���� ���⼭ ����Ʈ �Ѵ�.(���ϰ�)
		      FROM EMP
		      WHERE ENAME='KING');
		      
--�׷��Լ��� ���� ���̱� ������(�Ѱ��� ��) �������� ����
SELECT ENAME , SAL
FROM EMP
WHERE SAL>(SELECT AVG(SAL)
		FROM EMP);
SELECT AVG(SAL)
FROM EMP;

--������ ��������
--���� ������� �ϳ� �̻��ϰ�쿡
--IN(�ϳ��� ��ġ), ALL(���), ANY(�ϳ��̻�)...


--IN
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DISTINCT DEPTNO
			FROM EMP
			WHERE SAL>=3000);

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
		FROM EMP
		GROUP BY DEPTNO);

SELECT DEPTNO, DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
		FROM EMP
		WHERE JOB='MANAGER');
		
-- ALL
SELECT ENAME, SAL
FROM EMP
WHERE SAL >(SELECT MAX(SAL) 
			FROM EMP
			WHERE DEPTNO=30);
--�׷��Լ��� 30�� �μ��� �ƽ��� �����ְų�			
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL   (SELECT SAL
			FROM EMP
			WHERE DEPTNO=30);
			
-- ALL�� ��� ����� ���϶� ���̴�. 30�� �μ��� SAL�� ��� ����������	�׺��� ū����鸸 ������ ��µȴ�.

--ANY ������
--�ϳ��̻� �����ϸ� �ȴ�.
--�ּҰ����� ũ�� ���̵ȴ�. MIN(FID)

SELECT ENAME, SAL
FROM EMP
WHERE SAL>ANY(SELECT SAL
			FROM EMP
			WHERE DEPTNO=30);

SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT MIN(SAL)
		FROM EMP
		WHERE DEPTNO=30);

--254P 10��
SELECT ENAME, SAL
FROM EMP
WHERE SAL> ANY(SELECT SAL
			FROM EMP
			WHERE JOB = 'SALESMAN')
		AND JOB<>'SALESMAN';
			
--254P 11��
SELECT ENAME, JOB
FROM EMP
WHERE JOB = ANY (SELECT JOB
				FROM EMP
				WHERE ENAME='SMITH');
--254P 12��
SELECT ENAME, SAL
FROM EMP
WHERE SAL> ALL( SELECT SAL
			FROM EMP
			WHERE JOB='SALESMAN'
			)
	AND DEPTNO <>20;
	
--254P 13��
SELECT ENAME,SAL
FROM EMP
WHERE SAL>ANY(SELECT SAL
			FROM EMP
			WHERE JOB='SALESMAN')
	AND DEPTNO<>20;
