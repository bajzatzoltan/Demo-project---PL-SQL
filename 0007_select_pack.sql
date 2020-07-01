create or replace package select_pack as
    type select_cur is ref cursor;
    function generalselect_func(par_viewsynonymname varchar2) return sys_refcursor;
    function selectall_func(par_viewsynonymname varchar2) return sys_refcursor;
    function selectsimplebuilder_func(par_viewsynonymname varchar2, par_wherecolumnaliasname varchar2, par_whereoperator varchar2, par_wherecomperedvalue varchar2, par_orderebycolumnaliasname varchar2, par_orderbydesc varchar2  ) return sys_refcursor;
end select_pack;
/
create or replace package body select_pack as
    function generalselect_func(par_viewsynonymname varchar2) return sys_refcursor as
        var_resultcursor select_cur;
        dynstring varchar2 (300);
        var_cashtypeid cashtype.id%type;
        cur_cashtyperow cashtype%rowtype;
        
        begin
                select cashtype_fk_id into var_cashtypeid from cashtable where synonymname = par_viewsynonymname;
                select * into cur_cashtyperow from cashtype where id = var_cashtypeid;
                dynstring := 'select * from "'||par_viewsynonymname||'" '||cur_cashtyperow.clause||' '
                ||cur_cashtyperow.columnaliasname||cur_cashtyperow.operatorvalue||cur_cashtyperow.comparedvalue|| 
                ' order by '|| cur_cashtyperow.ordercolumnaliasname;
                                    --dbms_output.put_line(dynstring);
                open var_resultcursor for dynstring; 
                return var_resultcursor;
        exception 
            when others then
                if substr(sqlerrm, 1, 9) = 'ORA-00942' or substr(sqlerrm, 1, 9) = 'ORA-01403' then
                    RAISE_APPLICATION_ERROR (-20002, 'select_pack.generalselect_func: '|| par_viewsynonymname ||' no data found. '|| sqlerrm);
                else
                    RAISE_APPLICATION_ERROR (-20003, 'select_pack.generalselect_func: '|| sqlerrm);
                end if;
        end generalselect_func;
    function selectall_func(par_viewsynonymname varchar2) return sys_refcursor as
        var_resultcursor select_cur;
        dynstring varchar2 (300);
        begin
                dynstring := 'select * from "'||par_viewsynonymname||'"';
                open var_resultcursor for dynstring; 
                return var_resultcursor;
        exception 
            when others then
                if substr(sqlerrm, 1, 9) = 'ORA-00942' or substr(sqlerrm, 1, 9) = 'ORA-01403' then
                    RAISE_APPLICATION_ERROR (-20002, 'select_pack.selectall_func: '|| par_viewsynonymname ||' no data found. '|| sqlerrm);
                else
                    RAISE_APPLICATION_ERROR (-20003, 'select_pack.selectall_func: '|| sqlerrm);
                end if;
        end selectall_func;
    
    
    function selectsimplebuilder_func
    (par_viewsynonymname varchar2, par_wherecolumnaliasname varchar2, par_whereoperator varchar2, par_wherecomperedvalue varchar2, par_orderebycolumnaliasname varchar2, par_orderbydesc varchar2 ) return sys_refcursor as
        var_resultcursor select_cur;
        var_validatedwhereoperator varchar2(10);
        var_validorderebycolumnaliasname varchar2(30);
        var_wherecomperedvalue varchar2(200);
        var_orderbydesc varchar2(4);
        var_where varchar2 (10):= ' where "';
        var_order varchar2 (15):= ' order by "';
        dynstring varchar2 (400);
        begin
            
            if par_wherecolumnaliasname is not null then
                if INSTR(upper(par_wherecolumnaliasname), 'SELECT ') <> 0 then
                    RAISE_APPLICATION_ERROR (-20003, par_wherecolumnaliasname||': invalid value.');
                else
                    if par_whereoperator = '=' then 
                        var_validatedwhereoperator := '" '||par_whereoperator;
                        
                    elsif par_whereoperator = '<>' then
                        var_validatedwhereoperator := '" '||par_whereoperator;
                    elsif par_whereoperator = '<' then
                        var_validatedwhereoperator := '" '||par_whereoperator;
                    elsif par_whereoperator = '>' then
                        var_validatedwhereoperator :=  '" '||par_whereoperator;
                    elsif par_whereoperator = '!=' then
                        var_validatedwhereoperator :=  '" '||par_whereoperator;
                    elsif par_whereoperator = 'like' then
                        var_validatedwhereoperator :=  '" '||par_whereoperator;
                    else 
                        RAISE_APPLICATION_ERROR (-20003, par_whereoperator||': invalid value.');
                    end if;
                    if INSTR(upper(par_wherecomperedvalue), 'SELECT ') <> 0 then
                        RAISE_APPLICATION_ERROR (-20003, par_wherecomperedvalue||': invalid value.');
                    elsif par_wherecomperedvalue is null then
                        RAISE_APPLICATION_ERROR (-20000,'par_wherecomperedvalue cannot be NULL.');
                    else
                        var_wherecomperedvalue := par_wherecomperedvalue;
                    end if;
                end if;
            else
                var_where := null;
            end if;

            if par_orderebycolumnaliasname is not null then
                if INSTR(upper(par_orderebycolumnaliasname), 'SELECT ') <> 0 then
                    RAISE_APPLICATION_ERROR (-20003, par_orderebycolumnaliasname||': invalid value.');
                else
                        var_validorderebycolumnaliasname := par_orderebycolumnaliasname||'" ';
                        if par_orderbydesc is not null then
                            var_orderbydesc := 'desc';
                        end if;
                end if;
            else
                var_order := null;
            end if;
                dynstring := 'select * from "'||par_viewsynonymname||'" '
                ||var_where||par_wherecolumnaliasname||var_validatedwhereoperator||var_wherecomperedvalue||
                var_order|| var_validorderebycolumnaliasname||var_orderbydesc;
                open var_resultcursor for dynstring; 
                return var_resultcursor;
        exception 
            when others then
                if substr(sqlerrm, 1, 9) = 'ORA-00942' or substr(sqlerrm, 1, 9) = 'ORA-01403' then
                    RAISE_APPLICATION_ERROR (-20002, 'select_pack.selectsimplebuilder_func: '|| par_viewsynonymname ||' no data found. '|| sqlerrm);
                elsif substr(sqlerrm, 1, 9) = 'ORA-20000' then
                    RAISE_APPLICATION_ERROR (-20000, 'select_pack.selectsimplebuilder_func: '|| sqlerrm);
                else
                    RAISE_APPLICATION_ERROR (-20003, 'select_pack.selectsimplebuilder_func: '|| sqlerrm);
                end if;
        end selectsimplebuilder_func;
end select_pack;
/
