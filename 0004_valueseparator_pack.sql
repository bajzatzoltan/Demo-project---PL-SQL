create or replace package valueseparator_pack as
    function getlistofvalue_func(par_originaltablename varchar2, par_listoftablecolmnnames listofdbobjects, par_valueliststring varchar2) return listofvalues;
    procedure validationofvalue_proc(par_originaltablename varchar2, par_columnname varchar2, par_valuestring varchar2);
end valueseparator_pack;
/
create or replace package body valueseparator_pack as
    function getlistofvalue_func(par_originaltablename varchar2, par_listoftablecolmnnames listofdbobjects, par_valueliststring varchar2) return listofvalues as
        var_listofvalue listofvalues;
        begin
             if par_originaltablename is null or par_listoftablecolmnnames is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if; 
            if length(par_originaltablename) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'');
            end if;
            var_listofvalue := listofstringseparator_pack.separatevaluesstringlist_func(par_valueliststring);
            --kell a két lista hosszát ellenõrizni, ha nem egyezik akkor exception
            if par_listoftablecolmnnames.count <> var_listofvalue.count then
                RAISE_APPLICATION_ERROR (-20005,'');
            end if;
                for i in par_listoftablecolmnnames.first..par_listoftablecolmnnames.count loop
                    validationofvalue_proc(par_originaltablename, par_listoftablecolmnnames(i), var_listofvalue(i));
                end loop;
            return var_listofvalue;
            exception when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'valueseparator_pack.getlistofvalue_func: par_originaltablename, par_listoftablecolmnnames cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'valueseparator_pack.getlistofvalue_func: par_originaltablename length cannot be more than 30.');
                elsif sqlcode = -20005 then
                    RAISE_APPLICATION_ERROR (-20005,'valueseparator_pack.getlistofvalue_func: count of colmnnames and count of values are not equal.');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end getlistofvalue_func;
    procedure validationofvalue_proc(par_originaltablename varchar2, par_columnname varchar2, par_valuestring varchar2) as
        dynstring varchar2(3000);
        begin
            if par_originaltablename is null or par_columnname is null then
               RAISE_APPLICATION_ERROR (-20000,'');
            end if;
            if length(par_originaltablename) > 30 or length(par_columnname) > 30 then
               RAISE_APPLICATION_ERROR (-20001,'');
            end if;
            dynstring := '
                            declare 
                                value '||par_originaltablename||'.'||par_columnname||'%type;
                             begin 
                                value := :par_valuestring;
                             end;';
            --dbms_output.put_line(dynstring);
            execute immediate dynstring using par_valuestring;
            exception when others then
                if sqlcode = -20000 then
                    RAISE_APPLICATION_ERROR (-20000,'valueseparator_pack.validationofvalue_proc: par_originaltablename, par_columnname cannot be NULL.');
                elsif sqlcode = -20001 then
                   RAISE_APPLICATION_ERROR (-20001,'valueseparator_pack.validationofvalue_proc:  par_originaltablename, par_columnname length cannot be more than 30.');
                else
                    RAISE_APPLICATION_ERROR (-20003, 'valueseparator_pack.validationofvalue_proc: par_valuestring = '||par_valuestring||chr(10)||sqlerrm);
                end if;
        end validationofvalue_proc;
end valueseparator_pack;