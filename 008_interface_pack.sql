create or replace package interface_pack as 
    procedure insert_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2);
    procedure update_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2);
    procedure delete_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2);
    function generalselect_func(par_viewsynonymname varchar2) return sys_refcursor;
    function selectall_func(par_viewsynonymname varchar2) return sys_refcursor;
    function selectsimplebuilder_func(par_viewsynonymname varchar2, par_wherecolumnaliasname varchar2, par_whereoperator varchar2, par_wherecomperedvalue varchar2, par_orderebycolumnaliasname varchar2, par_orderbydesc varchar2  ) return sys_refcursor;
end interface_pack;
/
create or replace package body interface_pack as
    procedure insert_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2) as
        var_validation integer;
        begin
           
            Select count(*) into var_validation from DBA_ROLE_PRIVS
            inner join ROLE_TAB_PRIVS 
            on ROLE_TAB_PRIVS.ROLE = DBA_ROLE_PRIVS.GRANTED_ROLE
            AND DBA_ROLE_PRIVS.grantee = USER 
            and (ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getoriginaltablename_func(getoriginalname_pack.getviewname_func(par_viewsynonymname))
            or ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname))
            and ROLE_TAB_PRIVS.privilege = 'INSERT';
            if var_validation >= 1 then
                dml_pack.insert_proc(par_viewsynonymname, par_columnsynonymlist, par_valueliststring);
            else
                RAISE_APPLICATION_ERROR (-20006, par_viewsynonymname || ': no insert privileges or do not contain.');
            end if;
        end insert_proc;
    procedure update_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2) as
        var_validation integer;
        begin
            
            Select count(*) into var_validation from DBA_ROLE_PRIVS
            inner join ROLE_TAB_PRIVS 
            on ROLE_TAB_PRIVS.ROLE = DBA_ROLE_PRIVS.GRANTED_ROLE
            AND DBA_ROLE_PRIVS.grantee = USER 
            and (ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getoriginaltablename_func(getoriginalname_pack.getviewname_func(par_viewsynonymname))
            or ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname))
            and ROLE_TAB_PRIVS.privilege = 'UPDATE';
            if var_validation >= 1 then
                dml_pack.update_proc(par_viewsynonymname, par_columnsynonymlist, par_valueliststring);
            else
                RAISE_APPLICATION_ERROR (-20006, par_viewsynonymname || ': no update privileges or do not contain.');
            end if;
        end update_proc;
    procedure delete_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2) as
        var_validation integer;
        begin
            
            Select count(*) into var_validation from DBA_ROLE_PRIVS
            inner join ROLE_TAB_PRIVS 
            on ROLE_TAB_PRIVS.ROLE = DBA_ROLE_PRIVS.GRANTED_ROLE
            AND DBA_ROLE_PRIVS.grantee = USER 
            and (ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getoriginaltablename_func(getoriginalname_pack.getviewname_func(par_viewsynonymname))
            or ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname))
            and ROLE_TAB_PRIVS.privilege = 'DELETE';

            if var_validation >= 1 then
                dml_pack.delete_proc(par_viewsynonymname, par_columnsynonymlist, par_valueliststring);
            else
                RAISE_APPLICATION_ERROR (-20006, par_viewsynonymname || ': no delete privileges or do not contain.');
            end if;
        end delete_proc;
    function generalselect_func(par_viewsynonymname varchar2) return sys_refcursor as
        var_resultcursor select_pack.select_cur;
        var_validation integer;
        begin 
            Select count(*) into var_validation from DBA_ROLE_PRIVS
            inner join ROLE_TAB_PRIVS 
            on ROLE_TAB_PRIVS.ROLE = DBA_ROLE_PRIVS.GRANTED_ROLE
            AND DBA_ROLE_PRIVS.grantee = USER 
            and (ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getoriginaltablename_func(getoriginalname_pack.getviewname_func(par_viewsynonymname))
            or ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname))
            and ROLE_TAB_PRIVS.privilege = 'SELECT';
            if var_validation >= 1 then
                var_resultcursor := select_pack.generalselect_func(par_viewsynonymname);
            else
                RAISE_APPLICATION_ERROR (-20006, par_viewsynonymname || ': no select privileges.');
            end if;
            return var_resultcursor;
        end generalselect_func;
    function selectall_func(par_viewsynonymname varchar2) return sys_refcursor as
        var_resultcursor select_pack.select_cur;
        var_validation integer;
        var_addvalidation integer;
        begin 
            Select count(*) into var_validation from DBA_ROLE_PRIVS
            inner join ROLE_TAB_PRIVS 
            on ROLE_TAB_PRIVS.ROLE = DBA_ROLE_PRIVS.GRANTED_ROLE
            AND DBA_ROLE_PRIVS.grantee = USER 
            and (ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getoriginaltablename_func(getoriginalname_pack.getviewname_func(par_viewsynonymname))
            or ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname))
            and ROLE_TAB_PRIVS.privilege = 'SELECT';

            if var_validation >= 1 then
                var_resultcursor := select_pack.selectall_func(par_viewsynonymname);
            else
                RAISE_APPLICATION_ERROR (-20006, par_viewsynonymname || ': no select privileges.');
            end if;
            return var_resultcursor;
        end selectall_func;
    function selectsimplebuilder_func(par_viewsynonymname varchar2, par_wherecolumnaliasname varchar2, par_whereoperator varchar2, par_wherecomperedvalue varchar2, par_orderebycolumnaliasname varchar2, par_orderbydesc varchar2) return sys_refcursor as        
        var_resultcursor select_pack.select_cur;
        var_validation integer;
        begin 
            Select count(*) into var_validation from DBA_ROLE_PRIVS
            inner join ROLE_TAB_PRIVS 
            on ROLE_TAB_PRIVS.ROLE = DBA_ROLE_PRIVS.GRANTED_ROLE
            AND DBA_ROLE_PRIVS.grantee = USER 
            and (ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getoriginaltablename_func(getoriginalname_pack.getviewname_func(par_viewsynonymname))
            or ROLE_TAB_PRIVS.table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname))
            and ROLE_TAB_PRIVS.privilege = 'SELECT';
            if var_validation >= 1 then
                var_resultcursor := select_pack.selectsimplebuilder_func(par_viewsynonymname, par_wherecolumnaliasname, par_whereoperator, par_wherecomperedvalue, par_orderebycolumnaliasname, par_orderbydesc);
            else
                RAISE_APPLICATION_ERROR (-20006, par_viewsynonymname || ': no select privileges.');
            end if;
            return var_resultcursor;
        end selectsimplebuilder_func;
end interface_pack;
/
