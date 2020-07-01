-----------------------------------------------------------------------
-- select_pack.generalselect_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.001.001';
    TEST_METHOD varchar2 (60) := 'select_pack.generalselect_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'TRUE';
        insert into cashtable (cashtype_fk_id, synonymname) values (1, par_viewsynonymname);
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 300, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03;
        result_sysrefcursor := select_pack.generalselect_func(par_viewsynonymname);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            /*DBMS_OUTPUT.put_line('result: '||
                                    rec_res_sysrefcur.id||' - '||
                                    rec_res_sysrefcur."TESZTSZÖVEG01"||' - '||
                                    rec_res_sysrefcur."TESZTSZÁM"||' - '||
                                    rec_res_sysrefcur."TESZTTÖRT"||' - '||
                                    rec_res_sysrefcur."TESZTDÁTUM"||' - ');
            DBMS_OUTPUT.put_line('expected: '||
                                    rec_exp_sysrefcur.id||' - '||
                                    rec_exp_sysrefcur.testvarchar||' - '||
                                    rec_exp_sysrefcur.testnumber||' - '||
                                    rec_exp_sysrefcur.testnumberfraction||' - '||
                                    rec_exp_sysrefcur.testdate||' - ');*/
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        delete from cashtable where synonymname = par_viewsynonymname;
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                TEST_RESULT := 'FALSE';
                exceptionmessage := sqlerrm;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
                delete from cashtable where synonymname = par_viewsynonymname;
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.001.002';
    TEST_METHOD varchar2 (60) := 'select_pack.generalselect_func';
    TEST_NAME varchar2 (120) := 'Invalid param par_viewsynonymname test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla03';
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'TRUE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 300, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03;
        result_sysrefcursor := select_pack.generalselect_func(par_viewsynonymname);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/
-----------------------------------------------------------------------
-- select_pack.selectall_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.002.001';
    TEST_METHOD varchar2 (60) := 'select_pack.selectall_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'TRUE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 300, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03;
        result_sysrefcursor := select_pack.selectall_func(par_viewsynonymname);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                TEST_RESULT := 'FALSE';
                exceptionmessage := sqlerrm;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.002.002';
    TEST_METHOD varchar2 (60) := 'select_pack.selectall_func';
    TEST_NAME varchar2 (120) := 'Invalid param par_viewsynonymname test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla03';
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'TRUE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 300, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03;
        result_sysrefcursor := select_pack.selectall_func(par_viewsynonymname);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/

-----------------------------------------------------------------------
-- select_pack.selectsimplebuilder_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.001';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= 'TESZTSZÁM';
    par_whereoperator varchar2 (10):= '=';
    par_wherecomperedvalue varchar2 (50):= '200';
    par_orderebycolumnaliasname varchar2 (30) := 'TESZTSZÖVEG01'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'TRUE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                TEST_RESULT := 'FALSE';
                exceptionmessage := sqlerrm;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.002';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'invalid par_viewsynonymname param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla03';
    
    par_wherecolumnaliasname varchar2 (30):= 'TESZTSZÁM';
    par_whereoperator varchar2 (10):= '=';
    par_wherecomperedvalue varchar2 (50):= '200';
    par_orderebycolumnaliasname varchar2 (30) := 'TESZTSZÖVEG01'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.003';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'invalid par_wherecolumnaliasname param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= 'TESZTSZÁM ';
    par_whereoperator varchar2 (10):= '=';
    par_wherecomperedvalue varchar2 (50):= '200';
    par_orderebycolumnaliasname varchar2 (30) := 'TESZTSZÖVEG01'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20003';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.004';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'invalid par_whereoperator param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= 'TESZTSZÁM';
    par_whereoperator varchar2 (10):= '==';
    par_wherecomperedvalue varchar2 (50):= '200';
    par_orderebycolumnaliasname varchar2 (30) := 'TESZTSZÖVEG01'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20003';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.005';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'invalid par_wherecolumnaliasname param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= 'select * from table';
    par_whereoperator varchar2 (10):= '=';
    par_wherecomperedvalue varchar2 (50):= '200';
    par_orderebycolumnaliasname varchar2 (30) := 'TESZTSZÖVEG01'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20003';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/


-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.006';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'invalid par_wherecomperedvalue param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= 'TESZTSZÁM';
    par_whereoperator varchar2 (10):= '=';
    par_wherecomperedvalue varchar2 (50):= 'Select * from table';
    par_orderebycolumnaliasname varchar2 (30) := 'TESZTSZÖVEG01'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20003';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/


-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.007';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'invalid par_orderebycolumnaliasname param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= 'TESZTSZÁM';
    par_whereoperator varchar2 (10):= '=';
    par_wherecomperedvalue varchar2 (50):= '200';
    par_orderebycolumnaliasname varchar2 (30) := 'select * from table'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20003';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.008';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'Null par_wherecolumnaliasname param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= null;
    par_whereoperator varchar2 (10):= '=';
    par_wherecomperedvalue varchar2 (50):= '50';
    par_orderebycolumnaliasname varchar2 (30) := 'TESZTSZÖVEG01'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin

        TEST_RESULT := 'TRUE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));

        open expected_sysrefcursor for select * from test_table03 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);
        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.009';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'Null par_whereoperator param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= 'TESZTSZÁM';
    par_whereoperator varchar2 (10):= null;
    par_wherecomperedvalue varchar2 (50):= '200';
    par_orderebycolumnaliasname varchar2 (30) := 'TESZTSZÖVEG01'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20003';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.010';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'Null par_wherecomperedvalue param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= 'TESZTSZÁM';
    par_whereoperator varchar2 (10):= '=';
    par_wherecomperedvalue varchar2 (50):= null;
    par_orderebycolumnaliasname varchar2 (30) := 'TESZTSZÖVEG01'; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200 order by testvarchar desc;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0007.003.011';
    TEST_METHOD varchar2 (60) := 'select_pack.selectsimplebuilder_func';
    TEST_NAME varchar2 (120) := 'Null par_orderebycolumnaliasname param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    
    par_wherecolumnaliasname varchar2 (30):= 'TESZTSZÁM';
    par_whereoperator varchar2 (10):= '=';
    par_wherecomperedvalue varchar2 (50):= '200';
    par_orderebycolumnaliasname varchar2 (30) := null; 
    par_orderbydesc varchar2(4) := '1';
    
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    
    rec_exp_sysrefcur test_table03%rowtype;
    rec_res_sysrefcur "Teszttábla 03"%rowtype;
    begin
        TEST_RESULT := 'TRUE';
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg01', 100, 10.10, TO_DATE('2001/01/01 01:22:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg02', 200, 20.20, TO_DATE('2002/02/02 02:22:22', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg03', 200, 30.30, TO_DATE('2003/03/03 03:33:33', 'yyyy/mm/dd hh24:mi:ss')); 
        insert into test_table03 (testvarchar, testnumber, testnumberfraction, testdate) 
            values ('szöveg04', 400, 40.40, TO_DATE('2004/04/04 04:44:44', 'yyyy/mm/dd hh24:mi:ss'));
        open expected_sysrefcursor for select * from test_table03 where testnumber = 200;
        result_sysrefcursor := select_pack.selectsimplebuilder_func
                    (par_viewsynonymname,par_wherecolumnaliasname,par_whereoperator,par_wherecomperedvalue,par_orderebycolumnaliasname,par_orderbydesc);

        loop 
            FETCH expected_sysrefcursor INTO rec_exp_sysrefcur;
            FETCH result_sysrefcursor INTO rec_res_sysrefcur;
            /*DBMS_OUTPUT.put_line('result: '||
                                    rec_res_sysrefcur.id||' - '||
                                    rec_res_sysrefcur."TESZTSZÖVEG01"||' - '||
                                    rec_res_sysrefcur."TESZTSZÁM"||' - '||
                                    rec_res_sysrefcur."TESZTTÖRT"||' - '||
                                    rec_res_sysrefcur."TESZTDÁTUM"||' - ');
            DBMS_OUTPUT.put_line('expected: '||
                                    rec_exp_sysrefcur.id||' - '||
                                    rec_exp_sysrefcur.testvarchar||' - '||
                                    rec_exp_sysrefcur.testnumber||' - '||
                                    rec_exp_sysrefcur.testnumberfraction||' - '||
                                    rec_exp_sysrefcur.testdate||' - ');*/
            if rec_exp_sysrefcur.id <> rec_res_sysrefcur.id or rec_res_sysrefcur.id is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testvarchar <> rec_res_sysrefcur."TESZTSZÖVEG01" or rec_res_sysrefcur."TESZTSZÖVEG01" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if rec_exp_sysrefcur.testnumber <> rec_res_sysrefcur."TESZTSZÁM" or rec_res_sysrefcur."TESZTSZÁM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testnumberfraction <> rec_res_sysrefcur."TESZTTÖRT" or rec_res_sysrefcur."TESZTTÖRT" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;if rec_exp_sysrefcur.testdate <> rec_res_sysrefcur."TESZTDÁTUM" or rec_res_sysrefcur."TESZTDÁTUM" is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        exception 
            when others then
                TEST_RESULT := 'FALSE';
                exceptionmessage := sqlerrm;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
end;
/

-----------------------------------------------------------------------
