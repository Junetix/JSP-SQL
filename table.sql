--ROW ID ����Ŭ���� ����Ÿ ���Խ� �ο��ϴ� ROW�� �ּҰ�
SELECT ROWID, EMPNO, ENAME
FROM EMP;

--���̺� ����
CREATE TABLE EMP01(
			EMPNO NUMBER(4),
			ENAME VARCHAR2(20),
			SAL NUMBER(7,2));
DESC EMP01;

--������ �����͸� �����ϰ� ����� ������ AS SELECT ���������� ����(P KEY, F KEY)�� ���� �ʴ´�.
CREATE TABLE EMP02
AS
SELECT *FROM EMP;

SELECT *
FROM EMP02;
DESC EMP02;
DESC EMP;

CREATE TABLE EMP03
AS
SELECT EMPNO,ENAME
FROM EMP;

DESC EMP03;
SELECT *
FROM EMP03;
--DETNO�� 10�� ����� ����
CREATE TABLE EMP05
AS
SELECT *
FROM EMP
WHERE DEPTNO=10;

SELECT *
FROM EMP05;

--������ �����Ҷ� ������ (EX..1=0) ������ ���� WHERE���� �ִ´�.

CREATE  TABLE EMP06
AS
SELECT * 
FROM EMP
WHERE 1=0;

SELECT* 
FROM EMP06;

DROP TABLE DEPT02;

CREATE TABLE DEPT02
AS
SELECT *
FROM DEPT
WHERE 1=0;

SELECT *
FROM DEPT02;

--ALTER ���̺��� ������ �����ϴ� Ű����
--�÷� �߰� ���� ����,
--ADD, MODIFY,  DROP COLUMN
--ADD �߰�
ALTER TABLE EMP01
ADD(JOB VARCHAR2(9));

SELECT *
FROM DEPT02;

ALTER TABLE DEPT02
ADD(DMGR NUMBER(4));

DESC DEPT02;

DESC EMP01
--���� MODIFY
ALTER TABLE EMP01
MODIFY(JOB VARCHAR2(30));

--���� DROP COLUMN columnname 

ALTER TABLE EMP01
DROP COLUMN JOB;
DESC EMP01;

--SET UNUSED ������ ���������� �ɾ�� ���ִ�.(�����ʹ� ����������)

ALTER TABLE EMP02
SET UNUSED(JOB);

SELECT * FROM EMP02;


--DROP TABLE 
-- ���̺��� ��� �����Ϳ� ���̺��� �����Ѵ�.
DROP TABLE EMP01;

SELECT *
FROM EMP02;
--TRUNCATE �� ���� �Ұ��� ����
TRUNCATE TABLE EMP02;


RENAME EMP03 TO EMP02;

--DATA DICTIONARY ������ ����
--�������ʹ� �������� ������ ��ƴ�.
--DATA DICTIONARY VIEW�� �̿��ؼ� ������ Ȯ���Ѵ�.
--VIEW(�������̺�) �������ε����Ͱ� �������� �ʴ´�.

-- DBA_  ALL_   USER ..
--USER �ڽ��� ������ ������ ��ü���� ������ Ȯ���Ҽ��ִ�.

DESC USER_TABLES;

SHOW USER;--���� ����ڸ� �˷��ش�.

SELECT TABLE_NAME 
FROM USER_TABLES
ORDER BY TABLE_NAME DESC;
-- ������ ���̺� ����� Ȯ�� �Ҽ� �ִ�.

--DBA_ �� DBA �����ڸ� �����ϴ�.
SELECT TABLE_NAME, OWNER
FROM DBA_TABLES;
--SCOTT������ ���ٺҰ�

