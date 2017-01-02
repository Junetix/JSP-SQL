Create table Board(
board_num number,
board_name varchar2(20),
board_pass varchar2(15),
board_subject varchar2(50),
board_content varchar2(2000),
board_file varchar2(50),
board_re_ref number,
board_re_lev number,
board_readconut number,
board_date date,
primary key(board_num)
);
