create or replace package getoriginalname_pack as
    function getviewname_func (par_viewsynonymname varchar2) return varchar2;
    function getoriginaltablename_func (par_vieworiginalname varchar2) return varchar2;
    function getlistoftablecolumnnames_func (par_vieworiginalname varchar2, par_columnsynonymlist varchar2, par_originalTableName varchar2) return listofdbobjects;
    function getoriginalcolumnname_func (par_vieworiginalname varchar2, par_columnsynonym varchar2, par_originalTableName varchar2) return varchar2;
    function getcolumnid_func (par_vieworiginalname varchar2, par_columnsynonym varchar2) return number;
end getoriginalname_pack;
/
create or replace package body getoriginalname_pack as
    function getviewname_func (par_viewsynonymname varchar2) return varchar2 as
        var_viewname varchar2 (30);
        begin 
            if par_viewsynonymname is null then
               RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getviewname_func: Parameter of viewsynonymname cannot be NULL.');
            end if;
            if length(par_viewsynonymname) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getviewname_func: Parameter of viewsynonymname length cannot be more than 30.');
            end if;
            select table_name into var_viewname from all_synonyms where owner = constantsettergetter_pack.const_schemaowner and upper(synonym_name) = upper(par_viewsynonymname);
            --select SUBSTR(vieworiginalname, 4) into vieworiginalname from dual; 
            --DBMS_OUTPUT.PUT_LINE(var_viewname);
            return var_viewname;
             exception when others then
                if substr(sqlerrm, 1, 9) = 'ORA-01403' then
                    RAISE_APPLICATION_ERROR (-20002,'getoriginalname_pack.getviewname_func: No data found');
                elsif sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getviewname_func: Parameter of viewsynonymname cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getviewname_func: Parameter of viewsynonymname length cannot be more than 30.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end getviewname_func;
    function getoriginaltablename_func (par_vieworiginalname varchar2) return varchar2 as
            var_originalTableName varchar2(30);
            var_sqlerrem varchar2(2000);
        begin
            if par_vieworiginalname is null then
               RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getoriginaltablename_func: par_vieworiginalname cannot be NULL.');
            end if;
            if length(par_vieworiginalname) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getoriginaltablename_func: par_vieworiginalname length cannot be more than 30.');
            end if;
            if regexp_instr(par_vieworiginalname,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'getoriginalname_pack.getoriginaltablename_func: par_vieworiginalname cannot contain whitespaces.');
            end if;
                select referenced_name into var_originalTableName from sys.all_dependencies where 
                owner = constantsettergetter_pack.const_schemaowner and 
                type = 'VIEW' and 
                referenced_type = 'TABLE' and 
                name = upper(par_vieworiginalname) and 
                ROWNUM = 1;
                --DBMS_OUTPUT.PUT_LINE('originalTableName: '||originalTableName);
            return var_originalTableName;
            exception when others then
                if substr(sqlerrm, 1, 9) = 'ORA-01403' then
                    RAISE_APPLICATION_ERROR (-20002,'getoriginalname_pack.getoriginaltablename_func: No data found');
                elsif sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getoriginaltablename_func: par_vieworiginalname cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getoriginaltablename_func: par_vieworiginalname length cannot be more than 30.');
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'getoriginalname_pack.getoriginaltablename_func: par_vieworiginalname cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end getoriginaltablename_func;
    function getlistoftablecolumnnames_func (par_vieworiginalname varchar2, par_columnsynonymlist varchar2, par_originalTableName varchar2) return listofdbobjects as
        var_listoftablecolumnames listofdbobjects;
        var_originalcolumnname varchar2(30);
        begin
            if par_vieworiginalname is null or par_columnsynonymlist is null or par_originalTableName is null then
               RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getlistoftablecolumnnames_func: par_vieworiginalname, par_columnsynonymlist, par_originalTableName cannot be NULL.');
            end if;
            if length(par_vieworiginalname) > 30 or length(par_originalTableName) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getlistoftablecolumnnames_func: par_vieworiginalname, par_originalTableName length cannot be more than 30.');
            end if;
            if regexp_instr(par_vieworiginalname,'[[:space:]]') > 0 or regexp_instr(par_originalTableName,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'getoriginalname_pack.getlistoftablecolumnnames_func: par_vieworiginalname, par_originalTableName cannot contain whitespaces.');
            end if;
            var_listoftablecolumnames := listofstringseparator_pack.separateobjectstringlist_func(par_columnsynonymlist);
            for i in var_listoftablecolumnames.first..var_listoftablecolumnames.count loop
                --dbms_output.put_line(var_listoftablecolumnames(i));
                var_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func (par_vieworiginalname, var_listoftablecolumnames(i), par_originalTableName);
                var_listoftablecolumnames(i) := var_originalcolumnname;
            end loop;
            return var_listoftablecolumnames;
            exception when others then
                if substr(sqlerrm, 1, 9) = 'ORA-01403' then
                    RAISE_APPLICATION_ERROR (-20002,'getoriginalname_pack.getlistoftablecolumnnames_func: No data found');
                elsif sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getlistoftablecolumnnames_func: par_vieworiginalname, par_columnsynonymlist, par_originalTableName cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getlistoftablecolumnnames_func: par_vieworiginalname, par_originalTableName length cannot be more than 30.');
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'getoriginalname_pack.getlistoftablecolumnnames_func: par_vieworiginalname, par_originalTableName cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end getlistoftablecolumnnames_func;
    function getoriginalcolumnname_func (par_vieworiginalname varchar2, par_columnsynonym varchar2, par_originalTableName varchar2) return varchar2 as
        var_originalcolumnname varchar2(30);
        var_column_id integer;
        begin
            
            if par_vieworiginalname is null or par_columnsynonym is null or par_originalTableName is null then
               RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getoriginalcolumnname_func: par_vieworiginalname, par_columnsynonym, par_originalTableName cannot be NULL.');
            end if;
            if length(par_vieworiginalname) > 30 or length(par_columnsynonym) > 30 or length(par_originalTableName) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getoriginalcolumnname_func: par_vieworiginalname, par_columnsynonym, par_originalTableName length cannot be more than 30.');
            end if;
            if regexp_instr(par_vieworiginalname,'[[:space:]]') > 0 or regexp_instr(par_originalTableName,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'getoriginalname_pack.getoriginalcolumnname_func: par_vieworiginalname, par_originalTableName cannot contain whitespaces.');
            end if;
            
            var_column_id := getColumnId_func(upper(par_vieworiginalname), upper(par_columnsynonym));
            select all_tab_columns.column_name 
                into var_originalColumnName
                from all_tab_columns 
                where owner = constantsettergetter_pack.const_schemaowner 
                and column_id = var_column_id
                and table_name = upper(par_originalTableName);
            return var_originalColumnName;
            
            exception when others then
                if substr(sqlerrm, 1, 9) = 'ORA-01403' then
                    RAISE_APPLICATION_ERROR (-20002,'getoriginalname_pack.getoriginalcolumnname_func: No data found');
                elsif sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getoriginalcolumnname_func: par_vieworiginalname, par_columnsynonym, par_originalTableName cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getoriginalcolumnname_func: par_vieworiginalname, par_columnsynonym, par_originalTableName length cannot be more than 30.');
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'getoriginalname_pack.getoriginalcolumnname_func: par_vieworiginalname, par_originalTableName cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end getoriginalcolumnname_func;
    function getcolumnid_func (par_vieworiginalname varchar2, par_columnsynonym varchar2) return number as
        var_columnid integer;
        begin
        
            if par_vieworiginalname is null or par_columnsynonym is null then
               RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getcolumnid_func: par_vieworiginalname and par_columnsynonym cannot be NULL.');
            end if;
            if length(par_vieworiginalname) > 30 or length(par_columnsynonym) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getcolumnid_func: par_vieworiginalname length and par_columnsynonym length cannot be more than 30.');
            end if;
            if  regexp_instr(par_vieworiginalname,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'getoriginalname_pack.getcolumnid_func: par_vieworiginalname cannot contain whitespaces.');
            end if;
                select ALL_TAB_COLUMNS.column_id 
                into var_columnid
                from ALL_TAB_COLUMNS 
                where owner = constantsettergetter_pack.const_schemaowner
                and ALL_TAB_COLUMNS.table_name = upper(par_vieworiginalname)
                and UPPER(ALL_TAB_COLUMNS.column_name) = upper(par_columnsynonym)
                and rownum = 1;
            return var_columnid;
            exception when others then
                if substr(sqlerrm, 1, 9) = 'ORA-01403' then
                    RAISE_APPLICATION_ERROR (-20002,'getoriginalname_pack.getcolumnid_func: No data found (par_vieworiginalname: ' || par_vieworiginalname || ', par_columnsynonym: '|| par_columnsynonym || ')');
                elsif sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'getoriginalname_pack.getcolumnid_func: par_vieworiginalname and par_columnsynonym cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'getoriginalname_pack.getcolumnid_func: par_vieworiginalname length and par_columnsynonym length cannot be more than 30.');
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'getoriginalname_pack.getcolumnid_func: par_vieworiginalname cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end getcolumnid_func;
end getoriginalname_pack;
        