create or replace package dml_pack as
    procedure insert_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2);
    procedure update_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2);
    procedure delete_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2);
end dml_pack;
/

create or replace package body dml_pack as
    procedure insert_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2) as
        var_vieworiginalname varchar2(30);
        var_tablename varchar2(30);
        var_listoftablecolumnnames listofdbobjects;
        var_listofvalidatedvalues listofvalues;
        var_dynstring varchar2(3000);
    begin
        var_vieworiginalname := getoriginalname_pack.getviewname_func(par_viewsynonymname);
        var_tablename := getoriginalname_pack.getoriginaltablename_func(var_vieworiginalname);
        var_listoftablecolumnnames := getoriginalname_pack.getlistoftablecolumnnames_func(var_vieworiginalname, par_columnsynonymlist, var_tablename);
        var_listofvalidatedvalues := valueseparator_pack.getlistofvalue_func(var_tablename,var_listoftablecolumnnames, par_valueliststring);
        var_dynstring := dynstringcreator_pack.getinsertdynstring_func(var_tablename, var_listoftablecolumnnames, var_listofvalidatedvalues);
        execute immediate var_dynstring;
        commit;
    end insert_proc;
    procedure update_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2) as
        var_vieworiginalname varchar2(30);
        var_tablename varchar2(30);
        var_listoftablecolumnnames listofdbobjects;
        var_listofvalidatedvalues listofvalues;
        var_dynstring varchar2(3000);
    begin
        var_vieworiginalname := getoriginalname_pack.getviewname_func(par_viewsynonymname);
        var_tablename := getoriginalname_pack.getoriginaltablename_func(var_vieworiginalname);
        var_listoftablecolumnnames := getoriginalname_pack.getlistoftablecolumnnames_func(var_vieworiginalname, par_columnsynonymlist, var_tablename);
        var_listofvalidatedvalues := valueseparator_pack.getlistofvalue_func(var_tablename,var_listoftablecolumnnames, par_valueliststring);
        var_dynstring := dynstringcreator_pack.getupdatedynstring_func(var_tablename, var_listoftablecolumnnames, var_listofvalidatedvalues);
        execute immediate var_dynstring;
        commit;
    end update_proc;
    procedure delete_proc(par_viewsynonymname varchar2, par_columnsynonymlist varchar2, par_valueliststring varchar2) as
        var_vieworiginalname varchar2(30);
        var_tablename varchar2(30);
        var_listoftablecolumnnames listofdbobjects;
        var_listofvalidatedvalues listofvalues;
        var_dynstring varchar2(3000);
    begin
        var_vieworiginalname := getoriginalname_pack.getviewname_func(par_viewsynonymname);
        var_tablename := getoriginalname_pack.getoriginaltablename_func(var_vieworiginalname);
        var_listoftablecolumnnames := getoriginalname_pack.getlistoftablecolumnnames_func(var_vieworiginalname, par_columnsynonymlist, var_tablename);
        var_listofvalidatedvalues := valueseparator_pack.getlistofvalue_func(var_tablename,var_listoftablecolumnnames, par_valueliststring);
        var_dynstring := dynstringcreator_pack.getdeletedynstring_func(var_tablename, var_listoftablecolumnnames, var_listofvalidatedvalues);
        execute immediate var_dynstring;
        commit;
    end delete_proc;
end dml_pack;