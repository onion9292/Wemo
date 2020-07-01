/*
	cmd 들어가서 sys/1234 as sysdba 치고 다음 하나씩 복사 붙여넣기 하세요
	GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO WEMOADMIN IDENTIFIED BY WEMOES;
	ALTER USER WEMOADMIN DEFAULT TABLESPACE USERS;
	ALTER USER WEMOADMIN TEMPORARY TABLESPACE TEMP; 
*/

drop table memo purge;
drop table member purge;
create table member(
	USER_EMAIL varchar2(100) primary key,
	USER_PASS varchar2(30)  not null,
	USER_SUB varchar2(30),
	AUTH_TYPE varchar2(100),
	USER_NICK varchar2(30), /* 디폴트는 자바에서 설정*/
	USER_FORM varchar2(30) default 'STUDY'
);

create table memo(
	USER_EMAIL varchar2(100) references member(USER_EMAIL),
	MEMO_NUM number(20),
	MEMO_SUB varchar2(30),
	MEMO_POSITION varchar2(20) default('absolute'),
	MEMO_TOP varchar2(20),
	MEMO_LEFT varchar2(20),
	MEMO_COLOR varchar2(20),
	MEMO_ZIN number(20),
	MEMO_WIDTH varchar2(20),
	MEMO_HEIGHT varchar2(20),
	MEMO_TEX CLOB,
	MEMO_DATE date not null,
	MEMO_PRE date,
	PREV_TEX CLOB,	
	MEMO_FAV varchar2(3) default ('N'),
	MEMO_LOC varchar2(3) default ('N')
);

insert into member values('admin@admin.net','1','STUDY','NONE','admin','STUDY');

select*from member;
select*from memo;


