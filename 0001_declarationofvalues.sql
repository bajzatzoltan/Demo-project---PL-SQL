----------------------------------------------------------------------------------------------------------------
-- CREATE ADMIN USER 
----------------------------------------------------------------------------------------------------------------
create user propalladmin identified by jelszo container = current;
grant all privileges to propalladmin;
GRANT SELECT ANY DICTIONARY TO PROPALLADMIN;
grant create any table to propalladmin;
/

----------------------------------------------------------------------------------------------------------------
--CREATE OBJECTS
----------------------------------------------------------------------------------------------------------------
create or replace type listofdbobjects as
    varray(50) of varchar2(30);
/
create or replace type listofvalues as
    varray(50) of varchar2(200);

/
----------------------------------------------------------------------------------------------------------------
--CREATE CONSTANT AND constantsettergetter_pack
----------------------------------------------------------------------------------------------------------------
create or replace package constantsettergetter_pack as
    procedure setschemaowner_proc(par_schemaowner varchar2);
    const_schemaowner varchar(30) := 'PROPALLADMIN';
    procedure setseparator_proc(par_separator varchar2);
    const_separator varchar2(3) := '³';
    procedure setdefaulttablespace_proc(par_defaulttablespace varchar2);
    const_default_tablespace varchar2(30) := 'USERS';
    const_default_language varchar2(2) := 'HU';
end constantsettergetter_pack;
/
create or replace package body constantsettergetter_pack as
    procedure setschemaowner_proc(par_schemaowner varchar2) as
        begin
            if par_schemaowner is null then
                RAISE_APPLICATION_ERROR(-20000,'');
            end if;
            if length(par_schemaowner) > 30 then
                RAISE_APPLICATION_ERROR(-20001,'');
            end if;
            const_schemaowner := par_schemaowner;
            exception 
                when others then
                    if substr(sqlerrm, 1,9) = 'ORA-20000' then
                        RAISE_APPLICATION_ERROR (-20000, 'constantsettergetter_pack.setschemaowner_proc: parameter par_schemaowner cannot be NULL');
                    elsif substr(sqlerrm, 1,9) = 'ORA-20001' then
                        RAISE_APPLICATION_ERROR (-20001, 'constantsettergetter_pack.setschemaowner_proc: length of par_schemaowner must be between 1-30');
                    else
                        RAISE_APPLICATION_ERROR (-20003, 'constantsettergetter_pack.setschemaowner_proc: '|| sqlerrm);
                    end if;

        end setschemaowner_proc;
    procedure setseparator_proc(par_separator varchar2) as
        begin 
                if par_separator is null then
                    RAISE_APPLICATION_ERROR(-20000,'');
                end if;
                if length(par_separator) > 3 then
                    RAISE_APPLICATION_ERROR(-20001,'');
                end if;
                const_separator := par_separator;
            exception 
                when others then
                    if substr(sqlerrm, 1,9) = 'ORA-20000' then
                        RAISE_APPLICATION_ERROR (-20000, 'constantsettergetter_pack.setseparator_proc: parameter par_separator cannot be NULL');
                    elsif substr(sqlerrm, 1,9) = 'ORA-20001' then
                        RAISE_APPLICATION_ERROR (-20001, 'constantsettergetter_pack.setseparator_proc: length of par_separator must be between 1-3');
                    else
                        RAISE_APPLICATION_ERROR (-20003, 'constantsettergetter_pack.setdefaulttablespace_proc: '|| sqlerrm);
                    end if;
        end setseparator_proc;
    procedure setdefaulttablespace_proc(par_defaulttablespace varchar2) as
        begin
                if par_defaulttablespace is null then
                    RAISE_APPLICATION_ERROR(-20000,'');
                end if;
            const_default_tablespace := par_defaulttablespace;
            exception 
                when others then
                    if substr(sqlerrm, 1,9) = 'ORA-20000' then
                        RAISE_APPLICATION_ERROR (-20000, 'constantsettergetter_pack.setdefaulttablespace_proc: parameter par_defaulttablespace cannot be NULL');
                    else
                        RAISE_APPLICATION_ERROR (-20003, 'constantsettergetter_pack.setdefaulttablespace_proc: '|| sqlerrm);
                    end if;
        end setdefaulttablespace_proc;
end constantsettergetter_pack;
/

----------------------------------------------------------------------------------------------------------------
--CREATE CASH SYSTEM
----------------------------------------------------------------------------------------------------------------
create table cashtype(
    id number(2) not null, 
    cashname varchar2 (30),
    clause varchar2(30),
    columnaliasname varchar2(50),
    operatorvalue varchar2(30), 
    comparedvalue varchar2(200),
    ordercolumnaliasname varchar2(30) not null
    );
/
create table cashtable
    (id number (5) not null,
    cashtype_fk_id number(2) not null,
    synonymname varchar2(30) not null
    );
commit;
/
alter table cashtype add constraint cashtype_pk_cons primary key (id);
/
alter table cashtable add constraint cashtable_pk_cons primary key (id);
alter table cashtable add constraint cashtable_fk_cons foreign key (cashtype_fk_id) references cashtype(id);
alter table cashtable add constraint cashtable_syname_uq_cons unique (synonymname);
/
CREATE SEQUENCE cashtype_id_seq START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER cashtype_id_trg BEFORE
    INSERT ON cashtype
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := cashtype_id_seq.nextval;
END;
/

CREATE SEQUENCE cashtable_id_seq START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER cashtable_id_trg BEFORE
    INSERT ON cashtable
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := cashtable_id_seq.nextval;
END;
/
insert into cashtype (cashname, ordercolumnaliasname) values 
                    ('select_allrow', 'id' );
insert into cashtype (cashname, clause, columnaliasname, operatorvalue, comparedvalue, ordercolumnaliasname) values 
                    ('select_first50row', 'where','id', '<', '51', 'id');
insert into cashtype (cashname, clause, columnaliasname, operatorvalue, comparedvalue, ordercolumnaliasname) values 
                    ('select_last50row', 'where','id', '>', 'max(id)-50', 'id desc');
insert into cashtype (cashname, clause, columnaliasname, operatorvalue, comparedvalue, ordercolumnaliasname) values 
                    ('select_thisyearrow', 'where','extract(year from "TESZTDÁTUM")', '=', 'extract(year from sysdate)','id');
insert into cashtable(cashtype_fk_id, synonymname) values (1, 'Teszttábla 03');
update cashtable set cashtype_fk_id = 1;

