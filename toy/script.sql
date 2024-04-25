show user; -- system


alter session set "_oracle_script" = true;
create user jspProject identified by java1234;
grant connect, resource, dba to jspProject;

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


-- 게시판
create table tblBoard (
    seq number primary key,                         --번호(PK)
    subject varchar2(300) not null,                 --제목
    content varchar2(4000) not null,                --내용
    id varchar2(50) not null references tblUser(id),--아이디(FK)
    regdate date default sysdate not null,          --작성날짜
    readcount number default 0 not null             --조회수
);

create sequence seqBoard;

select * from tblBoard;





create or replace view vwBoard
as
select 
    seq, subject, id, readcount,
    (select name from tblUser where id = tblBoard.id) as name,
    case
        when to_char(sysdate, 'yyyy-mm-dd') = to_char(regdate, 'yyyy-mm-dd')
            then to_char(regdate, 'hh24:mi:ss')
        else
            to_char(regdate, 'yyyy-mm-dd')
    end regdate,
    (sysdate - regdate) as isnew,
    content,
    (select count(*) from tblComment where bseq = tblBoard.seq) as commentCount,
    depth,
    secret
from tblBoard
    order by thread desc;


select * from vwBoard;

update tblBoard set
    regdate = regdate - 1
        where seq = 3;

commit;

select * from tblBoard order by seq desc;
delete from tblBoard where seq = 15;





select * from (select a.*, rownum as rnum from vwBoard a)
    where rnum between 1 and 10;








-- 댓글 테이블
create table tblComment (
    seq number primary key,                         --번호(PK)
    content varchar2(2000) not null,                --댓글
    id varchar2(50) not null references tblUser(id),--아이디(FK)
    regdate date default sysdate not null,          --작성날짜
    bseq number not null references tblBoard(seq)   --부모글(FK)
);

create sequence seqComment;

-- 2	안녕하세요. 강아지입니다.	dog	24/04/16	268
select * from tblComment;

select a.*, (select name from tblUser where id = a.id) as name from tblComment a;



drop table tblComment;
drop table tblBoard;

-- 게시판(+답변)
create table tblBoard (
    seq number primary key,                         --번호(PK)
    subject varchar2(300) not null,                 --제목
    content varchar2(4000) not null,                --내용
    id varchar2(50) not null references tblUser(id),--아이디(FK)
    regdate date default sysdate not null,          --작성날짜
    readcount number default 0 not null,            --조회수
    thread number not null,                         --답변형(정렬)
    depth number not null                           --답변형(출력)
);


select * from tblBoard;
select * from tblComment;

delete from tblComment;
commit;

select * from
    (select b.*, rownum as rnum from
        (select a.*, (select name from tblUser where id = a.id) as name 
            from tblComment a where bseq = 281 order by seq desc) b)
                where rnum between 1 and 10;


delete from tblComment;
delete from tblBoard;

commit;





drop table tblComment;
drop table tblBoard;

-- 게시판(+첨부파일)
create table tblBoard (
    seq number primary key,                         --번호(PK)
    subject varchar2(300) not null,                 --제목
    content varchar2(4000) not null,                --내용
    id varchar2(50) not null references tblUser(id),--아이디(FK)
    regdate date default sysdate not null,          --작성날짜
    readcount number default 0 not null,            --조회수
    thread number not null,                         --답변형(정렬)
    depth number not null,                          --답변형(출력)
    attach varchar2(100) null                       --첨부파일
);




-- 게시물 1개 <- N : N -> 해시태그 1개

-- 해시태그
create table tblHashtag (
    seq number primary key,             --번호(PK)
    tag varchar2(100) unique not null   --해시태그(UQ)
);
create sequence seqHashtag;

-- 연결
create table tblTagging (
    seq number primary key,                         --번호(PK)
    bseq number not null references tblBoard(seq),  --글번호(FK)
    hseq number not null references tblHashtag(seq) --태그번호(FK)
);
create sequence seqTagging;


select * from tblHashtag;
select * from tblTagging;



select h.tag from tblBoard b
    inner join tblTagging t
        on b.seq = t.bseq
            inner join tblHashtag h
                on h.seq = t.hseq
                    where b.seq = 303;



select * from 
    (select a.*, rownum as rnum from vwBoard a %s) b
        inner join tblTagging t
            on b.seq = t.bseq
                inner join tblHashtag h
                    on h.seq = t.hseq
                        where rnum between %s and %s and h.tag = %s;




delete from tblTagging
    where bseq = ? and hseq = (select seq from tblHashtag where tag = ?);
    





drop table tblComment;
drop table tblTagging;
drop table tblBoard;

-- 게시판(+첨부파일)
create table tblBoard (
    seq number primary key,                         --번호(PK)
    subject varchar2(300) not null,                 --제목
    content varchar2(4000) not null,                --내용
    id varchar2(50) not null references tblUser(id),--아이디(FK)
    regdate date default sysdate not null,          --작성날짜
    readcount number default 0 not null,            --조회수
    thread number not null,                         --답변형(정렬)
    depth number not null,                          --답변형(출력)
    attach varchar2(100) null,                      --첨부파일
    secret number(1) not null                       --비밀글(0-공개,1-비밀)
);


select * from tblBoard;


select * from tbluser;


-- 접속 기록
create table tblLog (
    seq number primary key,                         --번호(PK)
    id varchar2(50) not null references tblUser(id),--아이디(FK)
    regdate date default sysdate not null           --접속시각
);
create sequence seqLog;

select * from tblLog order by regdate desc;
delete from tblLog;
delete from tblBoard;
commit;

select * from tblBoard;

select count(*) from tblBoard; --199
select count(*) from tblLog; --61


insert into tblUser (id, pw, name, email, lv, pic, intro, regdate)
    values ('hong', '1111', '홍길동', 'hong@gmail.com', 1, default, '반갑습니다.', default);

insert into tblUser (id, pw, name, email, lv, pic, intro, regdate)
    values ('dog', '1111', '강아지', 'dog@gmail.com', 1, default, '반갑습니다.', default);

insert into tblUser (id, pw, name, email, lv, pic, intro, regdate)
    values ('cat', '1111', '고양이', 'cat@gmail.com', 1, default, '반갑습니다.', default);

insert into tblUser (id, pw, name, email, lv, pic, intro, regdate)
    values ('tiger', '1111', '호랑이', 'tiger@gmail.com', 2, default, '관리자.', default);


select * from tbluser;
select * from tblcomment;

delete from tblcomment;
commit;


-- 한 달 간 > 로그인 날짜, 날짜(글쓴 횟수), 날짜(댓글 쓴 횟수)


select
    to_char(regdate,'yyyy-mm-dd') as regdate,
    count(*) as cnt,
    (select count(*) from tblBoard where to_char(regdate, 'yyyy-mm-dd') = to_char(a.regdate,'yyyy-mm-dd')) as bcnt,
    (select count(*) from tblBoard where to_char(regdate, 'yyyy-mm-dd') = to_char(a.regdate,'yyyy-mm-dd')) as ccnt
from tblLog a
    where to_char(regdate,'yyyy-mm') = '2024-04'  
    group by to_char(regdate,'yyyy-mm-dd');

select * from tblcomment;