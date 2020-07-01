create or replace package relation_pack as
    function getviewname_func(par_tablename varchar2)return varchar2;
    function getsynonmyname_func(par_viewname varchar2)return varchar2;
    function getparenttablesynonym1n_func(par_viewsynonymname varchar2) return varchar2;

end relation_pack;
/
create or replace package body relation_pack as
    function getviewname_func(par_tablename varchar2)return varchar2 as
        var_vieworiginalname varchar2(30);
        begin
            if par_tablename is null then
                RAISE_APPLICATION_ERROR (-20000, '');
            end if;
            if length(par_tablename) > 30 then
                RAISE_APPLICATION_ERROR (-20001, '');
            end if;
            SELECT name into var_vieworiginalname FROM all_dependencies WHERE TYPE = 'VIEW' and referenced_name = upper(par_tablename) and rownum = 1
                AND substr(name,1,2) = constantsettergetter_pack.const_default_language;
            return var_vieworiginalname;
            exception when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'relation_pack.getviewname_func: par_tablename cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'relation_pack.getviewname_func: par_tablename length cannot be more than 30.');
                else
                    RAISE_APPLICATION_ERROR (-20003, 'relation_pack.getviewname_func: '|| sqlerrm);
                end if;
        end getviewname_func;
    function getsynonmyname_func(par_viewname varchar2)return varchar2 as
        var_synonymname varchar2(30);
        begin
            if par_viewname is null then
                RAISE_APPLICATION_ERROR (-20000, '');
            end if;
            if length(par_viewname) > 30 then
                RAISE_APPLICATION_ERROR (-20001, '');
            end if;
            select synonym_name into var_synonymname from user_synonyms where table_name = upper(par_viewname) and rownum = 1;
            return var_synonymname;
            exception when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'relation_pack.getsynonmyname_func: par_viewname cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'relation_pack.getsynonmyname_func: par_viewname length cannot be more than 30.');
                else
                    RAISE_APPLICATION_ERROR (-20003, 'relation_pack.getsynonmyname_func: '|| sqlerrm);
                end if;
        end getsynonmyname_func;
    function getparenttablesynonym1n_func(par_viewsynonymname varchar2) return varchar2 as
        var_listofparentsynonym varchar2(180);
        var_vieworiginalname varchar2(30);
        var_tablename varchar2(30);
        var__resulttablename varchar2(30);
        var_resultvieworiginalname varchar2(30);
        var_resultsynonymname varchar2 (30);
        cursor cur_listoftablename (par_tablename varchar2) is 
                                    select r.table_name
                                    from   user_constraints t
                                    join   user_constraints r on t.r_constraint_name = r.constraint_name
                                    where  t.constraint_type = 'R' and t.table_name = upper(par_tablename);
        var_resulttablenamerow cur_listoftablename%rowtype;
        begin
            if par_viewsynonymname is null then
                RAISE_APPLICATION_ERROR (-20000, '');
            end if;
            if length(par_viewsynonymname) > 30 then
                RAISE_APPLICATION_ERROR (-20001, '');
            end if;
            var_vieworiginalname := getoriginalname_pack.getviewname_func(par_viewsynonymname);
            var_tablename := getoriginalname_pack.getoriginaltablename_func(var_vieworiginalname);
            open cur_listoftablename(var_tablename);
                loop 
                    fetch cur_listoftablename into var_resulttablenamerow;
                    exit when cur_listoftablename%notfound;
                    var__resulttablename := var_resulttablenamerow.table_name;
                    var_resultvieworiginalname := getviewname_func(var__resulttablename);
                    var_resultsynonymname := getsynonmyname_func(var_resultvieworiginalname);
                    if var_listofparentsynonym is null then
                        var_listofparentsynonym := var_resultsynonymname;
                    else
                        var_listofparentsynonym := var_listofparentsynonym || constantsettergetter_pack.const_separator ||var_resultsynonymname;
                    end if;
                end loop;
                close cur_listoftablename;
            return var_listofparentsynonym;
            exception when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'relation_pack.getparenttablesynonym1n_func: par_viewsynonymname cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'relation_pack.getparenttablesynonym1n_func: par_viewsynonymname length cannot be more than 30.');
                else
                    RAISE_APPLICATION_ERROR (-20003, 'relation_pack.getparenttablesynonym1n_func: '|| sqlerrm);
                end if;
            end getparenttablesynonym1n_func;
end relation_pack;
