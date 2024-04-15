show user; -- system


alter session set "_oracle_script" = true;
create user toy identified by java1234;
grant connect, resource, dba to toy;

show user; -- toy


insert into tblUser (id,pw,name, email,lv,pic,intro,regdate,ing) values(

);



alter table tblUser
add(ing number(1) default 1 not null);

















