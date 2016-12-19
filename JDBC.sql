create table member(
			num char(4) primary key,
			name varchar2(10) not null,
			addr varchar2(10),
			phone varchar2(15)
			);
desc member;
select * from member;