create or replace package interfaceallprivileges_pack as
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
end interfaceallprivileges_pack;
/
create or replace package body interfaceallprivileges_pack as
    procedure createuser_proc(par_newusername varchar2, par_password varchar2) as
        begin
            privileges_pack.createuser_proc(par_newusername, par_password);
        end createuser_proc;
    procedure createrole_proc(par_newrolename varchar2, par_password varchar2) as
        begin
            privileges_pack.createrole_proc(par_newrolename, par_password);
        end createrole_proc;
    procedure grantselectoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2) as
        begin
            privileges_pack.grantselectoftabletorole_proc(par_rolename, par_viewsynonymname);
        end grantselectoftabletorole_proc;
    procedure grantinsertoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2) as
        begin
            privileges_pack.grantinsertoftabletorole_proc(par_rolename, par_viewsynonymname);
        end grantinsertoftabletorole_proc;
    procedure grantupdteoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2) as
        begin
            privileges_pack.grantupdteoftabletorole_proc(par_rolename, par_viewsynonymname);
        end grantupdteoftabletorole_proc;
    procedure grantdeleteoftabletorole_proc (par_rolename varchar2, par_viewsynonymname varchar2) as
        begin
            privileges_pack.grantdeleteoftabletorole_proc(par_rolename, par_viewsynonymname);
        end grantdeleteoftabletorole_proc;
    procedure grantprivofexecutetorole_proc (par_rolename varchar2, par_packagename varchar2) as
        begin
            privileges_pack.grantprivofexecutetorole_proc(par_rolename, par_packagename);
        end grantprivofexecutetorole_proc;
    procedure grantroletouser_proc (par_username varchar2, par_rolename varchar2) as
        begin
            privileges_pack.grantroletouser_proc(par_username, par_rolename);
        end grantroletouser_proc;
    function selectprivofrole_func (par_rolename varchar2) return sys_refcursor as
            var_resultcursor select_pack.select_cur;
        begin
            var_resultcursor := privileges_pack.selectprivofrole_func(par_rolename);
            return var_resultcursor;
        end selectprivofrole_func;
    function selectroleofuser_func (par_username varchar2) return sys_refcursor as
            var_resultcursor select_pack.select_cur;
        begin
            var_resultcursor := privileges_pack.selectroleofuser_func (par_username);
            return var_resultcursor;
        end selectroleofuser_func;
    function selectalltablepriv_func return sys_refcursor as
            var_resultcursor select_pack.select_cur;
        begin
            var_resultcursor := privileges_pack.selectalltablepriv_func;
            return var_resultcursor;
        end selectalltablepriv_func;
    function selectalluser_func return sys_refcursor as
            var_resultcursor select_pack.select_cur;
        begin
            var_resultcursor := privileges_pack.selectalluser_func;
            return var_resultcursor;
        end selectalluser_func;
    function selectallroles_func return sys_refcursor as
            var_resultcursor select_pack.select_cur;
        begin
            var_resultcursor := privileges_pack.selectallroles_func;
            return var_resultcursor;
        end selectallroles_func;
    procedure revokeselectprivfromrole_proc(par_rolename varchar2, par_viewname varchar2) as
        begin
            privileges_pack.revokeselectprivfromrole_proc(par_rolename, par_viewname);
        end revokeselectprivfromrole_proc;
    procedure revokeinserttprivfromrole_proc(par_rolename varchar2, par_viewname varchar2) as 
        begin
            privileges_pack.revokeinserttprivfromrole_proc(par_rolename, par_viewname);
        end revokeinserttprivfromrole_proc;
    procedure revokeupdateprivfromrole_proc(par_rolename varchar2, par_viewname varchar2) as
        begin
            privileges_pack.revokeupdateprivfromrole_proc(par_rolename, par_viewname);
        end revokeupdateprivfromrole_proc;
    procedure revokedeleteprivfromrole_proc(par_rolename varchar2, par_viewname varchar2) as
        begin
            privileges_pack.revokedeleteprivfromrole_proc(par_rolename, par_viewname);
        end revokedeleteprivfromrole_proc;
    procedure revokeexecuteprivfromrole_proc(par_rolename varchar2, par_packagename varchar2) as
        begin
            privileges_pack.revokeexecuteprivfromrole_proc(par_rolename, par_packagename);
        end revokeexecuteprivfromrole_proc;
    procedure revokerolefromuser_proc(par_rolename varchar2, par_username varchar2) as
        begin
            privileges_pack.revokerolefromuser_proc(par_rolename, par_username);
        end revokerolefromuser_proc;
    procedure droprole_proc(par_rolename varchar2) as
        begin
            privileges_pack.droprole_proc(par_rolename);
        end droprole_proc;
    procedure revokecreatesessionfromuser_proc(par_username varchar2) as
        begin
            privileges_pack.revokecreatesessionfromuser_proc(par_username);
        end revokecreatesessionfromuser_proc;
    procedure grantsessiontouser_proc(par_username varchar2) as
        begin
            privileges_pack.grantsessiontouser_proc(par_username);
        end grantsessiontouser_proc;
    procedure setaccuntstatustolock_proc(par_username varchar2) as
        begin
            privileges_pack.setaccuntstatustolock_proc(par_username);
        end setaccuntstatustolock_proc;
    procedure setaccuntstatustounlock_proc(par_username varchar2) as
        begin
            privileges_pack.setaccuntstatustounlock_proc(par_username);
        end setaccuntstatustounlock_proc;
end interfaceallprivileges_pack;