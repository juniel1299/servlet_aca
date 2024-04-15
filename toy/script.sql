show user; -- system


alter session set "_oracle_script" = true;
create user toy identified by java1234;
grant connect, resource, dba to toy;

show user; -- toy

create table tblUser (
    id varchar2(50) primary key,                    --아이디
    pw varchar2(50) not null,                       --암호
    name varchar2(50) not null,                     --이름
    email varchar2(100) not null,                   --이메일
    lv number(1) not null,                          --등급(1-일반,2-관리자)
    pic varchar2(100) default 'pic.png' not null,   --사진
    intro varchar2(500) null,                       --자기소개
    regdate date default sysdate not null,          --가입날짜    
    ing number(1) default 1 not null                --탈퇴(1-활동,0-탈퇴)
);

alter table tblUser
    add (ing number(1) default 1 not null);

insert into tblUser (id, pw, name, email, lv, pic, intro, regdate)
    values ('hong', '1111', '홍길동', 'hong@gmail.com', 1, default,
            '반갑습니다.', default);

insert into tblUser (id, pw, name, email, lv, pic, intro, regdate)
    values ('tiger', '1111', '호랑이', 'tiger@gmail.com', 2, default,
            '관리자입니다.', default);


select * from tblUser;

commit;


--게시판
create table tblBoard(
seq number primary key,                             --번호PK
subject varchar2(300) not null,                     --제목
content varchar2(4000) not null,                --내용
id varchar2(50) not null references tblUser(id),     --작성자
regdate date default sysdate not null,              --작성날짜
readcount number default 0 not null                 --조회수
);

create sequence seqBoard;

select * from tblBoard;

select * from tbluser;

create or replace view vwBoard
as
select
seq,subject,id,readcount,
(select name from tblUser where id=tblBoard.id) as name,
case
    when to_char(sysdate,'yyyy-mm-dd') = to_char(regdate,'yyyy-mm-dd')
    then to_char(regdate, 'hh24:mi:ss')
    else
    to_char(regdate,'yyyy-mm-dd')
end regdate,
(sysdate - regdate) as isnew
from tblBoard order by seq desc;

select * from vwboard;

update tblboard set regdate = regdate - 3 where seq = 1;
update tblboard set regdate = regdate - 2 where seq = 2;
update tblboard set regdate = regdate - 1 where seq = 3;
commit;












