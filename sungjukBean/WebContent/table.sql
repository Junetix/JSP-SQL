create table s_member (
	hakbun varchar2(5),
	pw varchar2(20),
	irum varchar2(10),
	age number,
	gender varchar2(5),
	email varchar2(30),
	primary key(hakbun)
);

create table sungjuk (
  hakbun varchar2(5),
  irum varchar2(10),
  kor number,
  eng number,
  math number,
  tot number,
  avg number(6,2),
  grade varchar2(3),
  primary key(hakbun)
);