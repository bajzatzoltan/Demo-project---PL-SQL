create or replace package dynstringcreator_pack as 
    function getinsertdynstring_func (par_tablename varchar2, par_listoftablecolumnames listofdbobjects, par_listofvalidatedvalues listofvalues) return varchar2;
    function getupdatedynstring_func (par_tablename varchar2, par_listoftablecolumnames listofdbobjects, par_listofvalidatedvalues listofvalues) return varchar2;
    function getdeletedynstring_func (par_tablename varchar2, par_listoftablecolumnames listofdbobjects, par_listofvalidatedvalues listofvalues) return varchar2;
end dynstringcreator_pack;
/
create or replace package body dynstringcreator_pack as
    function getinsertdynstring_func (par_tablename varchar2, par_listoftablecolumnames listofdbobjects, par_listofvalidatedvalues listofvalues) return varchar2 as
        var_dynstring varchar2(3000);
        var_stringlistofcolumnnames  varchar2(600);
        var_stringlistofvalues varchar2(2350);
        begin
            if par_tablename is null then
                RAISE_APPLICATION_ERROR (-20000, '');
            end if;
            if length(par_tablename) > 30 then
                RAISE_APPLICATION_ERROR (-20001, '');
            end if;
            if par_listoftablecolumnames.count <> par_listofvalidatedvalues.count then
                RAISE_APPLICATION_ERROR (-20005, '');
            end if;
            for i in par_listoftablecolumnames.first..par_listoftablecolumnames.count loop
                if par_listoftablecolumnames(i) is null then
                    RAISE_APPLICATION_ERROR (-20000, '');
                end if;
                if upper(par_listoftablecolumnames(i)) <> 'ID' then
                    if i = 1 then
                        var_stringlistofcolumnnames := par_listoftablecolumnames(i);
                        var_stringlistofvalues := par_listofvalidatedvalues(i);
                    elsif i = 2 and var_stringlistofcolumnnames is null then
                        var_stringlistofcolumnnames := par_listoftablecolumnames(i);
                        var_stringlistofvalues := par_listofvalidatedvalues(i);
                    elsif i > 1 and var_stringlistofcolumnnames is not null then
                        var_stringlistofcolumnnames := var_stringlistofcolumnnames||', '||par_listoftablecolumnames(i);
                        var_stringlistofvalues := var_stringlistofvalues||''', '''||par_listofvalidatedvalues(i);
                    end if;
                end if;
            end loop;
            var_dynstring := 'insert into '||par_tablename||' ('||var_stringlistofcolumnnames||') values ('''||var_stringlistofvalues||''')';
            return var_dynstring;
            exception when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'dynstringcreator_pack.getinsertdynstring_func: par_tablename, value in par_listofvalidatedvalues cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'dynstringcreator_pack.getinsertdynstring_func: par_tablename length cannot be more than 30.');
                elsif sqlcode = -20005 then
                    RAISE_APPLICATION_ERROR (-20005,'dynstringcreator_pack.getinsertdynstring_func: count of par_listoftablecolumnames and count of par_listofvalidatedvalues are not equal.');
                else
                    RAISE_APPLICATION_ERROR (-20003, 'dynstringcreator_pack.getinsertdynstring_func: '|| sqlerrm);
                end if;
        end getinsertdynstring_func;
    function getupdatedynstring_func (par_tablename varchar2, par_listoftablecolumnames listofdbobjects, par_listofvalidatedvalues listofvalues) return varchar2 as
        var_dynstring varchar2(3000);
        var_id integer;
        var_setterstring varchar2(2900);
        var_count integer;
        begin
            if par_tablename is null then
                RAISE_APPLICATION_ERROR (-20000, '');
            end if;
            if length(par_tablename) > 30 then
                RAISE_APPLICATION_ERROR (-20001, '');
            end if;
            if par_listoftablecolumnames.count <> par_listofvalidatedvalues.count then
                RAISE_APPLICATION_ERROR (-20005, '');
            end if;
             for i in par_listoftablecolumnames.first..par_listoftablecolumnames.count loop
                if par_listoftablecolumnames(i) is null then
                    RAISE_APPLICATION_ERROR (-20000, '');
                end if;
                if upper(par_listoftablecolumnames(i)) <> 'ID' then
                    if i = 1 then
                        var_setterstring := par_listoftablecolumnames(i)||'='''||par_listofvalidatedvalues(i)||'''';
                    elsif i = 2 and var_setterstring is null then
                        var_setterstring := par_listoftablecolumnames(i)||'='''||par_listofvalidatedvalues(i)||'''';
                    elsif i > 1 and var_setterstring is not null then
                        var_setterstring := var_setterstring||','||par_listoftablecolumnames(i)||'='''||par_listofvalidatedvalues(i)||'''';
                    end if;
                else 
                    var_id := par_listofvalidatedvalues(i);
                end if;
            end loop;
            execute immediate 'select count(*) from '||par_tablename||' where id = :b' into var_count using var_id;
            if var_count = 0 then
                RAISE_APPLICATION_ERROR (-20002,'');
            end if;
            var_dynstring := 'update '||par_tablename||' set '||var_setterstring||' where id='||var_id;
            dbms_output.put_line(var_dynstring);
            return var_dynstring;
            exception when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'dynstringcreator_pack.getupdatedynstring_func: par_tablename, value in par_listofvalidatedvalues cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'dynstringcreator_pack.getupdatedynstring_func: par_tablename length cannot be more than 30.');
                elsif sqlcode = -20002 then
                    RAISE_APPLICATION_ERROR (-20002,'dynstringcreator_pack.getupdatedynstring_func: No data found');
                elsif sqlcode = -20005 then
                    RAISE_APPLICATION_ERROR (-20005,'dynstringcreator_pack.getupdatedynstring_func: count of par_listoftablecolumnames and count of par_listofvalidatedvalues are not equal.');
                else
                    RAISE_APPLICATION_ERROR (-20003, 'dynstringcreator_pack.getupdatedynstring_func: '|| sqlerrm);
                end if;
        end getupdatedynstring_func;
    function getdeletedynstring_func (par_tablename varchar2, par_listoftablecolumnames listofdbobjects, par_listofvalidatedvalues listofvalues) return varchar2 as
        var_dynstring varchar2(3000);
        var_id integer;
        var_count integer;
        begin
            if par_tablename is null then
                RAISE_APPLICATION_ERROR (-20000, '');
            end if;
            if length(par_tablename) > 30 then
                RAISE_APPLICATION_ERROR (-20001, '');
            end if;
            if par_listoftablecolumnames.count <> par_listofvalidatedvalues.count then
                RAISE_APPLICATION_ERROR (-20005, '');
            end if;
             for i in par_listoftablecolumnames.first..par_listoftablecolumnames.count loop
                if par_listoftablecolumnames(i) is null then
                    RAISE_APPLICATION_ERROR (-20000, '');
                end if;
                if upper(par_listoftablecolumnames(i)) = 'ID' then
                    var_id := par_listofvalidatedvalues(i);
                    exit;
                end if;
            end loop;
            execute immediate 'select count(*) from '||par_tablename||' where id = :b' into var_count using var_id;
            if var_count = 0 then
                RAISE_APPLICATION_ERROR (-20002,'');
            end if;
            var_dynstring := 'delete from '||par_tablename||' where id='||var_id;
            return var_dynstring;
            exception when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'dynstringcreator_pack.getdeletedynstring_func: par_tablename, value in par_listofvalidatedvalues cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'dynstringcreator_pack.getdeletedynstring_func: par_tablename length cannot be more than 30.');
                elsif sqlcode = -20002 then
                    RAISE_APPLICATION_ERROR (-20002,'dynstringcreator_pack.getdeletedynstring_func: No data found');
                elsif sqlcode = -20005 then
                    RAISE_APPLICATION_ERROR (-20005,'dynstringcreator_pack.getdeletedynstring_func: count of par_listoftablecolumnames and count of par_listofvalidatedvalues are not equal.');
                else
                    RAISE_APPLICATION_ERROR (-20003, 'dynstringcreator_pack.getdeletedynstring_func: '|| sqlerrm);
                end if;
            
            return var_dynstring;
        end getdeletedynstring_func;
end dynstringcreator_pack;