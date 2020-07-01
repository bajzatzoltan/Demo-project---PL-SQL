----------------------------------------------------------------------------------------------------------------
--Create environment of tests
----------------------------------------------------------------------------------------------------------------
--Create testuser
create user testuser identified by jelszo container = current;
grant create session to testuser;
grant insert on "Teszttábla 03" to testuser;
grant delete on "Teszttábla 03" to testuser;
grant select on "Teszttábla 03" to testuser;
grant update on "Teszttábla 03" to testuser;

commit;

CREATE TABLE viewnametablename (
    viewname    VARCHAR2(30) NOT NULL,
    tablename   VARCHAR2(30) NOT NULL
);
ALTER TABLE viewnametablename ADD CONSTRAINT viewname_tablename_un UNIQUE ( viewname, tablename );
/

create table test_table01 (
    testid integer not null, 
    testvarchar VARCHAR2(10), 
    testnumber number(4) not null,
    testnumberfraction number(4,2),
    testdate date)
/


create table test_table02 (
    testid integer not null, 
    testtable02varchar VARCHAR2(20) )
/
create table test_table03 (
    id integer not null, 
    testvarchar VARCHAR2(10), 
    testnumber number(4) not null,
    testnumberfraction number(4,2),
    testdate date)
/
alter table test_table03 add constraint test_table03_pk_cons primary key (id);
/
CREATE SEQUENCE test_table01_testid_seq START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER test_table01_testid_trg BEFORE
    INSERT ON test_table01
    FOR EACH ROW
    WHEN ( new.testid IS NULL )
BEGIN
    :new.testid := test_table01_testid_seq.nextval;
END;
/
CREATE SEQUENCE test_table02_testid_seq START WITH 1 NOCACHE ORDER;
/

CREATE OR REPLACE TRIGGER test_table02_testid_trg BEFORE
    INSERT ON test_table02
    FOR EACH ROW
    WHEN ( new.testid IS NULL )
BEGIN
    :new.testid := test_table02_testid_seq.nextval;
END;
/
CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER test_table03_id_trg BEFORE
    INSERT ON test_table03
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := test_table03_id_seq.nextval;
END;
/

create view HU_view_test_tables as
select 
    test_table01.testid AS "ID", 
    test_table01.testvarchar AS "TESZTSZÖVEG01", 
    test_table01.testnumber AS "TESZTSZÁM", 
    test_table01.testnumberfraction AS "TESZTTÖRT", 
    test_table01.testdate AS "TESZTDÁTUM",
    test_table02.testid AS "TESZTIDOFtest_table02",
    test_table02.testtable02varchar AS "TESZTSZÖVEGTABLE02"
from test_table01 
inner join test_table02 
on test_table01.testid = test_table02.testid ;
/

create view HU_view_test_table01 as
select 
    test_table01.testid AS "ID", 
    test_table01.testvarchar AS "TESZTSZÖVEG01", 
    test_table01.testnumber AS "TESZTSZÁM", 
    test_table01.testnumberfraction AS "TESZTTÖRT", 
    test_table01.testdate AS "TESZTDÁTUM",
    test_table02.testid AS "TESZTIDOFtest_table02",
    test_table02.testtable02varchar AS "TESZTSZÖVEGTABLE02"
from test_table01 
inner join test_table02 
on test_table01.testid = test_table02.testid ;
commit;
/
create view HU_view_test_table03 as
select 
    test_table03.id AS "ID", 
    test_table03.testvarchar AS "TESZTSZÖVEG01", 
    test_table03.testnumber AS "TESZTSZÁM", 
    test_table03.testnumberfraction AS "TESZTTÖRT", 
    test_table03.testdate AS "TESZTDÁTUM"
from test_table03 ;
commit;
/
create or replace synonym "Teszttábla 03" for HU_view_test_table03;
commit;
create or replace synonym "Teszttábla" for HU_view_test_table01;
commit;
create or replace synonym "Testtable" for HU_view_test_tables;
commit;
/
insert into viewnametablename (viewname, tablename) values ('HU_view_test_tables', 'test_table01');
insert into viewnametablename (viewname, tablename) values ('HU_view_test_tables', 'test_table02');
/
insert into test_table01 (testvarchar, testnumber, testnumberfraction, testdate) 
values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 

insert into test_table02 (testtable02varchar) 
values ('table02szöveg');

insert into test_table01 (testvarchar, testnumber, testnumberfraction, testdate) 
values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 

insert into test_table01 (testvarchar, testnumber, testnumberfraction, testdate) 
values ('szöveg03', 300, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 

insert into test_table01 (testvarchar, testnumber, testnumberfraction, testdate) 
values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
/
delete from test_table01 where testid = 2;
/
insert into test_table02 ( testtable02varchar) 
values ('table03szöveg');
/
delete from test_table02 where testid = 2;
commit;
/

create or replace package TEST_PACK as
end TEST_PACK;
/
create or replace package body TEST_PACK as
end TEST_PACK;
/

create table test_table04(
    id integer not null,
    name varchar2(30));
alter table test_table04 add constraint test_table04_pk_cons primary key (id);
/
create table test_table5(
    id integer not null,
    name varchar2(30));
alter table test_table5 add constraint test_table5_pk_cons primary key(id);
/
create table test_table6(
    id integer not null,
    name varchar2(30),
    fk_test_table4_id integer,
    fk_test_table5_id integer
    );
alter table test_table6 add constraint test_table6_pk_cons primary key(id);
alter table test_table6 add constraint testtable6_fk_testtable4_cons foreign key (fk_test_table4_id) references test_table04(id);
alter table test_table6 add constraint testtable6_fk_testtable5_cons foreign key (fk_test_table5_id) references test_table5(id);
/
create view HU_view_test_table4 as
select 
    test_table04.id AS "ID", 
    test_table04.name AS "TESZTNÉV" 
from test_table04 ;
create or replace synonym "Teszttábla 04" for HU_view_test_table04;
/
create view HU_view_test_table5 as
select 
    test_table5.id AS "ID", 
    test_table5.name AS "TESZTNÉV" 
from test_table5 ;
create or replace synonym "Teszttábla 5" for HU_view_test_table5;
/
create view HU_view_test_table6 as
select 
    test_table6.id AS "ID", 
    test_table6.name AS "TESZTNÉV",
    test_table6.fk_test_table4_id as "IDEGEN KULCS TESTTABLE4",
    test_table6.fk_test_table5_id as "IDEGEN KULCS TESTTABLE5"
from test_table6 ;
create or replace synonym "Teszttábla 6" for HU_view_test_table6;
/

/
-- Check environment of tests
select * from "Testtable";
select * from HU_view_test_tables;
select * from viewnametablename;
select * from test_table03;
/
select * from USER_SYNONYMS; 
commit;
/
