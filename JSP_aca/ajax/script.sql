
-- AjaxTest > script.sql

-- 설문 조사
create table tblSurvey (
    seq number primary key,             --번호(PK)
    question varchar2(300) not null,    --질문
    item1 varchar2(300) not null,       --항목1
    item2 varchar2(300) not null,       --항목2
    item3 varchar2(300) not null,       --항목3
    item4 varchar2(300) not null,       --항목4
    cnt1 number default 0 not null,     --선택1
    cnt2 number default 0 not null,     --선택2
    cnt3 number default 0 not null,     --선택3
    cnt4 number default 0 not null      --선택4
);

insert into tblSurvey values (1, '가장 자신있는 프로그래밍 언어는?'
    , 'JAVA', 'Python', 'C#', 'C++', default, default, default, default);
    
select * from tblSurvey;

commit;




--고양이 좌표 
create table tblCat(
    catid varchar2(50) primary key,             --img id 
    x number not null,
    y number not null
    );







