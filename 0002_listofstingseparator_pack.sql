create or replace package listofstringseparator_pack as
    function separateobjectstringlist_func (par_notseparatedstringlist varchar2) return listofdbobjects;
    function separatevaluesstringlist_func (par_notseparatedstringlist varchar2) return listofvalues;
end listofstringseparator_pack;
/
create or replace package body listofstringseparator_pack as
    function separateobjectstringlist_func (par_notseparatedstringlist varchar2) return listofdbobjects as
        var_listofdbobjects listofdbobjects;
        var_maxcounter int;
        begin
                if par_notseparatedstringlist is null then
                    RAISE_APPLICATION_ERROR(-20000,'listofstringseparator_pack.separateobjectstringlist_func: par_notseparatedstringlist cannot be null');
                end if;
             var_listofdbobjects := listofdbobjects();
             var_maxcounter := REGEXP_COUNT(par_notseparatedstringlist, constantsettergetter_pack.const_separator, 1, 'i') + 1;
             --DBMS_OUTPUT.PUT_line('var_maxcoutner: '||var_maxcoutner);
             for i in 1..var_maxcounter loop
                var_listofdbobjects.extend;
                --DBMS_OUTPUT.PUT_line('value ' || i || ': ' || REGEXP_SUBSTR(par_notseparatedstringlist,'(.*?)(\'||constantsettergetter_pack.const_separator||'|$)', 1, i, NULL, 1));
                var_listofdbobjects(i) := REGEXP_SUBSTR(par_notseparatedstringlist,'(.*?)(\'||constantsettergetter_pack.const_separator||'|$)', 1, i, NULL, 1);
                --DBMS_OUTPUT.PUT_LINE('listelement: '|| i || ': '||var_listofdbobjects(i));
             end loop;
             return var_listofdbobjects;
             exception when others then
                if substr(sqlerrm, 1, 9)= 'ORA-06502' then
                    RAISE_APPLICATION_ERROR(-20001,'listofstringseparator_pack.separateobjectstringlist_func: length of par_notseparatedstringlist must be between 1-30');
                elsif substr(sqlerrm, 1, 9)= 'ORA-20000' then
                    RAISE_APPLICATION_ERROR(-20000,'listofstringseparator_pack.separateobjectstringlist_func: par_notseparatedstringlist cannot be null');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end separateobjectstringlist_func;
    function separatevaluesstringlist_func (par_notseparatedstringlist varchar2) return listofvalues as
        var_listofvalues listofvalues;
        var_maxcounter int;
        begin
            if par_notseparatedstringlist is null then
                RAISE_APPLICATION_ERROR(-20000,'listofstringseparator_pack.separatevaluesstringlist_func: par_notseparatedstringlist cannot be null');
            end if;
             var_listofvalues := listofvalues();
             var_maxcounter := REGEXP_COUNT(par_notseparatedstringlist, constantsettergetter_pack.const_separator, 1, 'i') + 1;
             --DBMS_OUTPUT.PUT_line('var_maxcoutner: '||var_maxcoutner);
             for i in 1..var_maxcounter loop
                var_listofvalues.extend;
                --DBMS_OUTPUT.PUT_line('value ' || i || ': ' || REGEXP_SUBSTR(par_notseparatedstringlist,'(.*?)(\'||constantsettergetter_pack.const_separator||'|$)', 1, i, NULL, 1));
                var_listofvalues(i) := REGEXP_SUBSTR(par_notseparatedstringlist,'(.*?)(\'||constantsettergetter_pack.const_separator||'|$)', 1, i, NULL, 1);
                --DBMS_OUTPUT.PUT_LINE('listelement: '|| i || ': '||var_listofdbobjects(i));
             end loop;
            return var_listofvalues;
            exception when others then
                if substr(sqlerrm, 1, 9)= 'ORA-06502' then
                    RAISE_APPLICATION_ERROR(-20001,'listofstringseparator_pack.separateobjectstringlist_func: length of par_notseparatedstringlist must be between 1-30');
                elsif substr(sqlerrm, 1, 9)= 'ORA-20000' then
                    RAISE_APPLICATION_ERROR(-20000,'listofstringseparator_pack.separatevaluesstringlist_func: par_notseparatedstringlist cannot be null');
                else
                    RAISE_APPLICATION_ERROR (-20003, sqlerrm);
                end if;
        end separatevaluesstringlist_func;
end listofstringseparator_pack;
/
