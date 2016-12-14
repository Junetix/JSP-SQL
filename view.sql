--CREATE OR REPLACE VIEW

CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPT;

CREATE TABLE EMP_COPY
AS
SELECT * FROM EMP;

CREATE VIEW EMP_VIEW30
AS SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;

--VIEW�� ���� �����Ͱ� �ƴ� AS������ �������� �����ϰ��ִ°� ���̴�.

SELECT * FROM EMP_VIEW30;
DESC EMP_VIEW30;

--VIEW �� ����� TEXT �������� �˾ƺ���

SELECT VIEW_NAME, TEXT
FROM USER_VIEWS; --TEXT�� �ش� �������� ����Ǿ��ִ�.(�����������·� �����ϴ°��̴�)


INSERT INTO EMP_VIEW30
VALUES(1111,'AAAA',30);

SELECT * FROM EMP_VIEW30; --VIEW���� �翬�� ����Ǿ��ִ�.
SELECT * FROM EMP_COPY; --VIEW�� ������� ���� ���̺� �����Ͱ� ���ԵǾ��ִ�.(�� ������� ���� ����ڿ��� ���ٹ����� �����Ҽ��ִ�)

CREATE OR REPLACE
VIEW EMP_VIEW(�����ȣ,�����,�޿�,�μ���ȣ) --�÷���Ī ����
AS SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP_COPY;

SELECT * FROM EMP_VIEW 
WHERE "�μ���ȣ"=20; --�÷� ��

--�����÷� ������ VIEW �� �ݵ�� ��Ī�� �����ؾ��Ѵ�. 
--VIEW�� �⺻���̺��� �����÷��� ����Ҽ��� ����.
CREATE VIEW VIEW_SAL
AS
SELECT DEPTNO, SUM(SAL) AS "SALSUM", 
		AVG(SAL) AS "SALAVG"
		FROM EMP_COPY
		GROUP BY DEPTNO;
		
SELECT * FROM VIEW_SAL;

--�⺻������ VIEW �� INSERT�� NULL�� ����ؾ߸� �۵��Ѵ�. �÷��� NOT NULL�� �����Ǿ�������
--����� �� ����.


--���� ��~
--JOIN�� ���̺� ���� ��
--�߿��� ���δ�.

CREATE VIEW EMP_VIEW_DEPT
AS 
SELECT  E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
ORDER BY EMPNO DESC; --EMPNO ��������
--�� ���̺��� ������ �並 �������.

SELECT * FROM EMP_VIEW_DEPT;

CREATE OR REPLACE VIEW SAL_VIEW
AS
SELECT DEPT.DNAME, MIN(SAL) "MIN_SAL", MAX(SAL) "MAX_SAL"
FROM EMP, DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO
GROUP BY DNAME;

SELECT * FROM SAL_VIEW;
--WITH CHECK OPTION ����
CREATE OR REPLACE VIEW VIEW_CHK30
AS
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30 WITH CHECK OPTION;
--DEPTNO=30�� CHECK OPTION�̴�.
SELECT * FROM VIEW_CHK30;

UPDATE VIEW_CHK30 SET DEPTNO=20
WHERE SAL>=500;
--CHECK OPTION�� �����
SELECT *
FROM USER_VIEWS;


--WITH READ ONLY
--�б⸸ �����ϴ�. ������ �Ұ��ϴ�.
CREATE OR REPLACE VIEW VIEW_READ30
AS
SELECT EMPNO,ENAME,SAL,COMM,DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30 WITH READ ONLY;

UPDATE VIEW_READ30  SET COMM=3000; --READ ONLY ����

--ROW NUM Ȯ��
SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM EMP;

SELECT ROWNUM, EMPNO,ENAME,HIREDATE
FROM EMP
ORDER BY HIREDATE;

--ROW NUM�����ʹ� �̹� �����ϱ� ������ ORDER BY�� �߰��ϸ� ������ ������ ���� �ʴ´�.
--����Ŭ���� ���������� �ο��Ǿ��ִ�. ���� �̹� �����Ǿ������Ƿ� �ٲ����ʴ´�.
--���ĵ� ������� �Ű����� �ϰ�ʹٸ� ���ο� VIEW�� �����ؾ��Ѵ�.

--INLINE VIEW
--�並 �����Ҷ� VIEW�� ROWNUM�� ���� �ȴ�.
CREATE OR REPLACE VIEW VIEW_HIRE
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;
--SORTING
SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM VIEW_HIRE
WHERE ROWNUM<=5;
--TOP 5;
--�ι��� ������  �ۼ��ߴ�. �̰� �ϳ��� ��ģ�ٸ�..
--VIEW�� ����� ���ο� ROWNUM�� �ο��ȴ�.
--FROM�� ���������� �����ؼ� ���̺� ó�� �̿��غ����� �̰��� INLINE VIEW

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM (SELECT ROWNUM AS RNUM, EMPNO, ENAME, HIREDATE
	FROM (SELECT EMPNO, ENAME,HIREDATE
		FROM EMP
		ORDER BY HIREDATE)
	WHERE ROWNUM<=10) --���⼭ VIEW�� �����Ǹ鼭 ���ο� ROWNUM�� �����ȴ�.
--�ζ��� ���� ����. �Խ��� ������ �̵��� �� ����� ����Ѵ�(�������� �÷����� ������ ������ �̵�)
WHERE RNUM>=5 ; --�ű⼭ TOP-5
--SUBQUERY�� �ΰ� ������ BETWEEN ȿ���� ���� ���� �ִ�. �� ù��° ���������� ROWNUM�� ��Ī���� �̸��� �ٲ����ؾ��Ѵ�.(���ο� �÷� �ϳ� ����)

--����
SELECT ROWNUM AS RANGKING, EMPNO, ENAME, SAL
FROM(SELECT ROWNUM, EMPNO,ENAME, SAL
	FROM EMP
	ORDER BY SAL DESC)
	WHERE ROWNUM<=3;
