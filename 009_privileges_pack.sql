create or replace package privileges_pack as
    procedure createuser_proc(par_newusername varchar2, par_password varchar2);  
    procedure createrole_proc(par_newrolename varchar2, par_password varchar2);
    procedure grantselectoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2); 
    procedure grantinsertoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2); 
    procedure grantupdteoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2); 
    procedure grantdeleteoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2);
    procedure grantprivofexecutetorole_proc (par_rolename varchar2, par_packagename varchar2);
    procedure grantroletouser_proc (par_username varchar2, par_rolename varchar2);
    function selectprivofrole_func (par_rolename varchar2) return sys_refcursor;
    function selectroleofuser_func (par_username varchar2) return sys_refcursor; 
    function selectalltablepriv_func return sys_refcursor; 
    function selectalluser_func return sys_refcursor;
    function selectallroles_func return sys_refcursor;
    procedure revokeselectprivfromrole_proc(par_rolename varchar2, par_viewname varchar2);
    procedure revokeinserttprivfromrole_proc(par_rolename varchar2, par_viewname varchar2);
    procedure revokeupdateprivfromrole_proc(par_rolename varchar2, par_viewname varchar2);
    procedure revokedeleteprivfromrole_proc(par_rolename varchar2, par_viewname varchar2);
    procedure revokeexecuteprivfromrole_proc(par_rolename varchar2, par_packagename varchar2);
    procedure revokerolefromuser_proc(par_rolename varchar2, par_username varchar2);
    procedure droprole_proc(par_rolename varchar2);
    procedure revokecreatesessionfromuser_proc(par_username varchar2); 
    procedure grantsessiontouser_proc(par_username varchar2);
    procedure setaccuntstatustolock_proc(par_username varchar2); 
    procedure setaccuntstatustounlock_proc(par_username varchar2);
end privileges_pack;
/
create or replace package body privileges_pack as 
    procedure createuser_proc(par_newusername varchar2, par_password varchar2) as
        var_createuserdynstring varchar2 (200);
        var_createsessiondynstring varchar2 (200);
        var_grantexecutedynstring varchar2 (200);
        begin
            if par_newusername is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if length(par_newusername) < 6 or length(par_newusername) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'');
            end if;
            if regexp_instr(par_newusername,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            if regexp_instr(par_newusername,'[^a-zA-Z]') > 0 then
               RAISE_APPLICATION_ERROR (-20008,'');
            end if;
            if par_password is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if length(par_password) < 6 or length(par_password) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'');
            end if;
            if regexp_instr(par_password,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_createuserdynstring := 'create user '||par_newusername||' identified by "'||par_password||'"';
            var_createsessiondynstring := 'grant create session to '||par_newusername;
            var_grantexecutedynstring := 'grant execute on '||constantsettergetter_pack.const_schemaowner||'.interface_pack to '|| par_newusername;
            execute immediate var_createuserdynstring;
            execute immediate var_createsessiondynstring;
            execute immediate var_grantexecutedynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.createuser_proc: newusername or password cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'privileges_pack.createuser_proc: newusername or password length cannot be more than 30 or cannor be less than 6.');
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.createuser_proc: newusername or password cannot contain whitespaces.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01920' then
                    RAISE_APPLICATION_ERROR (-20007, par_newusername||': username is exist.'||chr(10) || sqlerrm);
                elsif sqlcode = -20008 then
                    RAISE_APPLICATION_ERROR (-20008,'privileges_pack.createuser_proc: newusername cannot contain non alphabetic character');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end createuser_proc;
    procedure createrole_proc(par_newrolename varchar2, par_password varchar2) as
        var_createroledynstring varchar2(200);
        var_passwordsubdynstring varchar2(100);
        begin
            if par_newrolename is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if length(par_newrolename) < 6 or length(par_newrolename) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'');
            end if;
            if regexp_instr(par_newrolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            if regexp_instr(par_newrolename,'[^a-zA-Z]') > 0 then
               RAISE_APPLICATION_ERROR (-20008,'');
            end if;
            if par_password is not null and (length(par_password) < 6 or length(par_password) > 30) then
               RAISE_APPLICATION_ERROR (-20001,'');
            end if;
            if par_password is not null and regexp_instr(par_password,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            if par_password is not null then
                 var_passwordsubdynstring:= ' identified by '||par_password;
            end if;
            var_createroledynstring := 'create role '||par_newrolename||' '||var_passwordsubdynstring;
            execute immediate var_createroledynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.createrole_proc: rolename cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'privileges_pack.createrole_proc: rolename or password length cannot be more than 30 or cannor be less than 6.');
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.createrole_proc: rolename or password cannot contain whitespaces.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01921' then
                    RAISE_APPLICATION_ERROR (-20007, par_newrolename||': rolename is exist.'||chr(10) || sqlerrm);
                elsif sqlcode = -20008 then
                    RAISE_APPLICATION_ERROR (-20008,'privileges_pack.createrole_proc: rolename cannot contain non alphabetic character');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end createrole_proc;
    procedure grantselectoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2) as
        var_dynstring varchar2 (200);
        begin
            if par_rolename is null or par_viewsynonymname is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'grant select on '||getoriginalname_pack.getviewname_func(par_viewsynonymname)||' to '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.grantselectoftabletorole_proc: rolename or viewsynonymname cannot be NULL.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.grantselectoftabletorole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end grantselectoftabletorole_proc;
    procedure grantinsertoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2) as
        var_dynstring varchar2 (200);
        begin
            if par_rolename is null or par_viewsynonymname is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'grant insert on '||getoriginalname_pack.getviewname_func(par_viewsynonymname)||' to '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.grantinsertoftabletorole_proc: rolename or viewsynonymname cannot be NULL.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.grantinsertoftabletorole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end grantinsertoftabletorole_proc;
    procedure grantupdteoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2) as
        var_dynstring varchar2 (200);
        begin
            if par_rolename is null or par_viewsynonymname is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'grant update on '||getoriginalname_pack.getviewname_func(par_viewsynonymname)||' to '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.grantupdteoftabletorole_proc: rolename or viewsynonymname cannot be NULL.');
                elsif sqlcode = -01917 then
                --elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.grantupdteoftabletorole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end grantupdteoftabletorole_proc;
    procedure grantdeleteoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2) as
        var_dynstring varchar2 (200);
        begin
            if par_rolename is null or par_viewsynonymname is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'grant delete on '||getoriginalname_pack.getviewname_func(par_viewsynonymname)||' to '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.grantdeleteoftabletorole_proc: rolename or viewsynonymname cannot be NULL.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.grantdeleteoftabletorole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end grantdeleteoftabletorole_proc;
    procedure grantprivofexecutetorole_proc (par_rolename varchar2, par_packagename varchar2) as
        var_dynstring varchar2 (200);
        begin
            if par_rolename is null or par_packagename is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 or regexp_instr(par_packagename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'grant execute on '||par_packagename||' to '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.grantprivofexecutetorole_proc: rolename or par_packagename cannot be NULL.');
                elsif sqlcode = -01917 then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.grantprivofexecutetorole_proc: rolename and packagename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end grantprivofexecutetorole_proc;
    procedure grantroletouser_proc (par_username varchar2, par_rolename varchar2) as 
        var_dynstring varchar2 (200);
        begin
            if par_rolename is null or par_username is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 or regexp_instr(par_username,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'grant '||par_rolename||' to '||par_username;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.grantroletouser_proc: rolename or par_packagename cannot be NULL.');
                elsif sqlcode = -01919 or sqlcode = -01917 then
                    RAISE_APPLICATION_ERROR (-20007, par_username||' or '||par_rolename||': invalid username or rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.grantroletouser_proc: rolename and username cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end grantroletouser_proc;
    function selectprivofrole_func (par_rolename varchar2) return sys_refcursor as
        var_resultcursor select_pack.select_cur;
        var_validation int;
        dynstring varchar2 (300);
        begin
                select count(*) into var_validation from DBA_ROLES where role = par_rolename;
                if var_validation = 0 then
                    RAISE_APPLICATION_ERROR (-20002, '');
                end if;
                --dynstring := 'select table_name, privilege from ROLE_TAB_PRIVS where role = '''||upper(par_rolename)||'''';
                --open var_resultcursor for dynstring; 
                open var_resultcursor for select table_name, privilege from ROLE_TAB_PRIVS where role = par_rolename;
                --dynstring := 'select table_name, privilege from ROLE_TAB_PRIVS where role = :a';
                --open var_resultcursor for dynstring using upper(par_rolename);
            return var_resultcursor;
        exception 
            when others then
                if sqlcode = -20002 then
                    RAISE_APPLICATION_ERROR (-20002, 'privileges_pack.selectprivofrole_func: '|| par_rolename ||' no data found. '|| sqlerrm);
                else
                    RAISE_APPLICATION_ERROR (-20003, 'privileges_pack.selectprivofrole_func: '|| sqlerrm);
                end if;
        end selectprivofrole_func;
    function selectroleofuser_func (par_username varchar2) return sys_refcursor as
        var_resultcursor select_pack.select_cur;
        var_validation int;
        begin
                select count(*) into var_validation from all_users where username = upper(par_username);
                if var_validation = 0 then
                    RAISE_APPLICATION_ERROR (-20002, '');
                end if;
                open var_resultcursor for SELECT grantee, granted_role FROM  DBA_ROLE_PRIVS where grantee = upper(par_username);
            return var_resultcursor;
        exception 
            when others then
                if sqlcode = -20002 then
                    RAISE_APPLICATION_ERROR (-20002, 'privileges_pack.selectroleofuser_func: '|| par_username ||' no data found. '|| sqlerrm);
                else
                    RAISE_APPLICATION_ERROR (-20003, 'privileges_pack.selectroleofuser_func: '|| sqlerrm);
                end if;
        end selectroleofuser_func;
    function selectalltablepriv_func return sys_refcursor as
        var_resultcursor select_pack.select_cur;
        var_rowofresultcursor select_pack.select_cur;
        begin
            open var_resultcursor for 
                select (case when b.referenced_name = 'DUAL' then 'EXECUTE' else null end) as privilege_type, a.name synonym_name, a.referenced_name view_name, b.referenced_name as table_name
                        from sys.all_dependencies a join sys.all_dependencies b
                        on (a.referenced_name = b.name )
                        where (a.type = 'PACKAGE' and b.referenced_name = 'DUAL') and a.owner = 'PROPALLADMIN'
                union
                select (case when b.referenced_name <> 'DUAL' then 'INSERT' else null end) as privilege_type, a.name synonym_name, a.referenced_name view_name, b.referenced_name as table_name
                                    from sys.all_dependencies a join sys.all_dependencies b
                                    on (a.referenced_name = b.name )
                                    where (a.type = 'VIEW' or a.TYPE = 'SYNONYM')and a.owner = 'PROPALLADMIN'
                union
                select (case when b.referenced_name <> 'DUAL' then 'DELETE' else null end) as privilege_type, a.name synonym_name, a.referenced_name view_name, b.referenced_name as table_name
                                    from sys.all_dependencies a join sys.all_dependencies b
                                    on (a.referenced_name = b.name )
                                    where (a.type = 'VIEW' or a.TYPE = 'SYNONYM')and a.owner = 'PROPALLADMIN'
                union
                select (case when b.referenced_name <> 'DUAL' then 'UPDATE' else null end) as privilege_type, a.name synonym_name, a.referenced_name view_name, b.referenced_name as table_name
                                    from sys.all_dependencies a join sys.all_dependencies b
                                    on (a.referenced_name = b.name )
                                    where (a.type = 'VIEW' or a.TYPE = 'SYNONYM')and a.owner = 'PROPALLADMIN'
                union
                select (case when b.referenced_name <> 'DUAL' then 'SELECT' else null end) as privilege_type, a.name synonym_name, a.referenced_name view_name, b.referenced_name as table_name
                                    from sys.all_dependencies a join sys.all_dependencies b
                                    on (a.referenced_name = b.name )
                                    where (a.type = 'VIEW' or a.TYPE = 'SYNONYM')and a.owner = 'PROPALLADMIN'
                                    order by privilege_type;
            return var_resultcursor;
        end selectalltablepriv_func;
    function selectallroles_func return sys_refcursor as
        var_resultcursor select_pack.select_cur;
        begin
            open var_resultcursor for SELECT role_id id, role FROM DBA_ROLES where oracle_maintained = 'N' order by role;
            return var_resultcursor;
            exception
                when others then
                        RAISE_APPLICATION_ERROR (-20003, sqlerrm);
        end selectallroles_func;
    function selectalluser_func return sys_refcursor as
        var_resultcursor select_pack.select_cur;
        begin 
            open var_resultcursor for select user_id ID, username, account_status, created from dba_users 
            where default_tablespace = constantsettergetter_pack.const_default_tablespace and oracle_maintained = 'N' order by username;
            return var_resultcursor;
            exception
                when others then
                        RAISE_APPLICATION_ERROR (-20003, sqlerrm);
        end selectalluser_func;
    procedure revokeselectprivfromrole_proc(par_rolename varchar2, par_viewname varchar2) as
        var_dynstring varchar2(200);
        begin
            if par_rolename is null or par_viewname is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'revoke select on '||par_viewname||' from '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.revokeselectprivfromrole_proc: rolename or par_viewname cannot be NULL.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20002 or substr(sqlerrm, 1, 9) = 'ORA-00942'then
                    RAISE_APPLICATION_ERROR (-20002, sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.revokeselectprivfromrole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end revokeselectprivfromrole_proc;
    procedure revokeinserttprivfromrole_proc(par_rolename varchar2, par_viewname varchar2) as
        var_dynstring varchar2(200);
        begin
            if par_rolename is null or par_viewname is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'revoke insert on '||par_viewname||' from '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.revokeinserttprivfromrole_proc: rolename or par_viewname cannot be NULL.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20002 OR substr(sqlerrm, 1, 9) = 'ORA-00942' then
                    RAISE_APPLICATION_ERROR (-20002, sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.revokeinserttprivfromrole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end revokeinserttprivfromrole_proc;
    procedure revokeupdateprivfromrole_proc(par_rolename varchar2, par_viewname varchar2) as
        var_dynstring varchar2(200);
        begin
            if par_rolename is null or par_viewname is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'revoke update on '||par_viewname||' from '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.revokeupdateprivfromrole_proc: rolename or viewname cannot be NULL.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20002 OR substr(sqlerrm, 1, 9) = 'ORA-00942' then
                    RAISE_APPLICATION_ERROR (-20002, sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.revokeupdateprivfromrole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end revokeupdateprivfromrole_proc;
    procedure revokedeleteprivfromrole_proc(par_rolename varchar2, par_viewname varchar2) as
        var_dynstring varchar2(200);
        begin
            if par_rolename is null or par_viewname is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'revoke delete on '||par_viewname||' from '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.revokedeleteprivfromrole_proc: rolename or tablename cannot be NULL.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20002 OR substr(sqlerrm, 1, 9) = 'ORA-00942' then
                    RAISE_APPLICATION_ERROR (-20002, sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.revokedeleteprivfromrole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end revokedeleteprivfromrole_proc;
    procedure revokeexecuteprivfromrole_proc(par_rolename varchar2, par_packagename varchar2) as
        var_dynstring varchar2(200);
        begin
            if par_rolename is null or par_packagename is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 or regexp_instr(par_packagename,'[[:space:]]') > 0then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'revoke execute on '||par_packagename||' from '||par_rolename;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.revokeexecuteprivfromrole_proc: rolename or viewsynonymname cannot be NULL.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' or substr(sqlerrm, 1, 9) = 'ORA-04042' then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid rolename or packagename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20002 then
                    RAISE_APPLICATION_ERROR (-20002, sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.revokeexecuteprivfromrole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end revokeexecuteprivfromrole_proc;
    procedure revokerolefromuser_proc(par_rolename varchar2, par_username varchar2) as
        var_dynstring varchar2 (200);
        begin
            if par_rolename is null or par_username is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 or regexp_instr(par_username,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'revoke '||par_rolename||' from '||par_username;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.grantroletouser_proc: rolename or par_packagename cannot be NULL.');
                elsif sqlcode = -01919 or sqlcode = -01917 then
                    RAISE_APPLICATION_ERROR (-20007, par_username||' or '||par_rolename||': invalid username or rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.grantroletouser_proc: rolename and username cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end revokerolefromuser_proc;
    procedure droprole_proc(par_rolename varchar2) as
        var_dynstring varchar2 (200);
        begin
            if par_rolename is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if regexp_instr(par_rolename,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            var_dynstring := 'drop role "'||par_rolename||'"';
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.droprole_proc: rolename cannot be NULL.');
                elsif sqlcode = -01919 or sqlcode = -01917 then
                    RAISE_APPLICATION_ERROR (-20007, par_rolename||': invalid  rolename.'||chr(10) || sqlerrm);
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.droprole_proc: rolename cannot contain whitespaces.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end droprole_proc;
    procedure revokecreatesessionfromuser_proc(par_username varchar2) as
        var_dynstring varchar2 (200);
        begin
            if par_username is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if length(par_username) < 6 or length(par_username) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'');
            end if;
            if regexp_instr(par_username,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            if regexp_instr(par_username,'[^a-zA-Z]') > 0 then
               RAISE_APPLICATION_ERROR (-20008,'');
            end if;
            
            var_dynstring := 'revoke create session from '||par_username;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.revokecreatesessionfromuser_proc: newusername cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'privileges_pack.revokecreatesessionfromuser_proc: newusername length cannot be more than 30 or cannor be less than 6.');
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.revokecreatesessionfromuser_proc: newusername cannot contain whitespaces.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_username||': invalid username.'||chr(10) || sqlerrm);
                elsif sqlcode = -20008 then
                    RAISE_APPLICATION_ERROR (-20008,'privileges_pack.revokecreatesessionfromuser_proc: newusername cannot contain non alphabetic character');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end revokecreatesessionfromuser_proc;
    procedure grantsessiontouser_proc(par_username varchar2) as
        var_dynstring varchar2 (200);
        begin
            if par_username is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if length(par_username) < 6 or length(par_username) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'');
            end if;
            if regexp_instr(par_username,'[[:space:]]') > 0 then
               RAISE_APPLICATION_ERROR (-20004,'');
            end if;
            if regexp_instr(par_username,'[^a-zA-Z]') > 0 then
               RAISE_APPLICATION_ERROR (-20008,'');
            end if;
            
            var_dynstring := 'grant create session to '||par_username;
            execute immediate var_dynstring;
        exception
            when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'privileges_pack.grantsessiontouser_proc: newusername cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'privileges_pack.grantsessiontouser_proc: newusername length cannot be more than 30 or cannor be less than 6.');
                elsif sqlcode = -20004 then
                    RAISE_APPLICATION_ERROR (-20004,'privileges_pack.grantsessiontouser_proc: newusername cannot contain whitespaces.');
                elsif substr(sqlerrm, 1, 9) = 'ORA-01917' then
                    RAISE_APPLICATION_ERROR (-20007, par_username||': invalid username.'||chr(10) || sqlerrm);
                elsif sqlcode = -20008 then
                    RAISE_APPLICATION_ERROR (-20008,'privileges_pack.grantsessiontouser_proc: newusername cannot contain non alphabetic character');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end grantsessiontouser_proc;
    procedure setaccuntstatustolock_proc (par_username varchar2) as 
            var_validation int;
            dynstring varchar2(200);
        begin
            select count(*) into var_validation from all_users where username = upper(par_username);
                if var_validation = 0 then
                    RAISE_APPLICATION_ERROR (-20002, '');
                end if;
            dynstring := 'ALTER USER '||par_username||' ACCOUNT LOCK';
            execute immediate dynstring;
            exception 
                when others then
                    if sqlcode = -20002 then
                        RAISE_APPLICATION_ERROR (-20002, 'privileges_pack.setaccuntstatustolock_proc: '|| par_username ||' no data found. '|| sqlerrm);
                    else
                        RAISE_APPLICATION_ERROR (-20003, 'privileges_pack.setaccuntstatustolock_proc: '|| sqlerrm);
                    end if;
        end setaccuntstatustolock_proc;
    procedure setaccuntstatustounlock_proc (par_username varchar2) as 
            var_validation int;
            dynstring varchar2(200);
        begin
            select count(*) into var_validation from all_users where username = upper(par_username);
                if var_validation = 0 then
                    RAISE_APPLICATION_ERROR (-20002, '');
                end if;
            dynstring := 'ALTER USER '||par_username||' ACCOUNT UNLOCK';
            execute immediate dynstring;
            exception 
                when others then
                    if sqlcode = -20002 then
                        RAISE_APPLICATION_ERROR (-20002, 'privileges_pack.setaccuntstatustounlock_proc: '|| par_username ||' no data found. '|| sqlerrm);
                    else
                        RAISE_APPLICATION_ERROR (-20003, 'privileges_pack.setaccuntstatustounlock_proc: '|| sqlerrm);
                    end if;
        end setaccuntstatustounlock_proc;
end privileges_pack;
/
commit;