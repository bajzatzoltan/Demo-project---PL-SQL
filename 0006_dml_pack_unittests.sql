-----------------------------------------------------------------------
-- dml_pack.insert_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0006.001.001';
    TEST_METHOD varchar2 (60) := 'dml_pack.insert_proc';
    TEST_NAME varchar2 (120) := 'Valid params test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    par_columnsynonymlist varchar2(500) := 'ID³TESZTSZÖVEG01³TESZTSZÁM³TESZTTÖRT³TESZTDÁTUM';
    par_valueliststring varchar2(2500) := '1³szöveg01³100³10,1³20-FEBR. -04';
    result_dml TEST_TABLE03%rowtype;
    expected_result TEST_TABLE03%rowtype; 
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        expected_result.id := 1;
        expected_result.testvarchar := 'szöveg01';
        expected_result.testnumber := 100;
        expected_result.testnumberfraction := 10.1 ;
        expected_result.testdate := '20-FEBR. -04';
        TEST_RESULT := 'TRUE';
        dml_pack.insert_proc(par_viewsynonymname, par_columnsynonymlist, par_valueliststring);
        select * into result_dml from TEST_TABLE03;
        if expected_result.id <> result_dml.id then
            TEST_RESULT := 'FALSE';
        end if;
        if expected_result.testvarchar <> result_dml.testvarchar then
            TEST_RESULT := 'FALSE';
            
        end if;
        if expected_result.testnumber <> result_dml.testnumber then
            TEST_RESULT := 'FALSE';
        end if;
        if expected_result.testnumberfraction <> result_dml.testnumberfraction then
            TEST_RESULT := 'FALSE';
        end if;
        if expected_result.testdate <> result_dml.testdate then
            TEST_RESULT := 'FALSE';
        end if;
        
        --DBMS_OUTPUT.put_line(expected_result.id||' - '|| result_dml.id);
        --DBMS_OUTPUT.put_line(expected_result.testvarchar||' - '|| result_dml.testvarchar);
        --DBMS_OUTPUT.put_line(expected_result.testnumber||' - '|| result_dml.testnumber);
        --DBMS_OUTPUT.put_line(expected_result.testnumberfraction||' - '|| result_dml.testnumberfraction);
        --DBMS_OUTPUT.put_line(expected_result.testdate||' - '|| result_dml.testdate);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        
        exception 
            when others then
                TEST_RESULT := 'FALSE';
                exceptionmessage := sqlerrm;
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
end;
/
-----------------------------------------------------------------------
-- dml_pack.update_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0006.002.001';
    TEST_METHOD varchar2 (60) := 'dml_pack.update_proc';
    TEST_NAME varchar2 (120) := 'Valid params test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    par_columnsynonymlist varchar2(500) := 'ID³TESZTSZÖVEG01³TESZTSZÁM³TESZTTÖRT³TESZTDÁTUM';
    par_valueliststring varchar2(2500) := '1³szöveg02³102³10,2³20-FEBR. -06';
    result_dml TEST_TABLE03%rowtype;
    expected_result TEST_TABLE03%rowtype; 
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        expected_result.id := 1;
        expected_result.testvarchar := 'szöveg02';
        expected_result.testnumber := 102;
        expected_result.testnumberfraction := 10.2 ;
        expected_result.testdate := '20-FEBR. -06';
        TEST_RESULT := 'TRUE';
        execute immediate 'insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')';
        dml_pack.update_proc(par_viewsynonymname, par_columnsynonymlist, par_valueliststring);
        select * into result_dml from TEST_TABLE03;
        if expected_result.id <> result_dml.id then
            TEST_RESULT := 'FALSE';
        end if;
        if expected_result.testvarchar <> result_dml.testvarchar then
            TEST_RESULT := 'FALSE';
            
        end if;
        if expected_result.testnumber <> result_dml.testnumber then
            TEST_RESULT := 'FALSE';
        end if;
        if expected_result.testnumberfraction <> result_dml.testnumberfraction then
            TEST_RESULT := 'FALSE';
        end if;
        if expected_result.testdate <> result_dml.testdate then
            TEST_RESULT := 'FALSE';
        end if;
        
        --DBMS_OUTPUT.put_line(expected_result.id||' - '|| result_dml.id);
        --DBMS_OUTPUT.put_line(expected_result.testvarchar||' - '|| result_dml.testvarchar);
        --DBMS_OUTPUT.put_line(expected_result.testnumber||' - '|| result_dml.testnumber);
        --DBMS_OUTPUT.put_line(expected_result.testnumberfraction||' - '|| result_dml.testnumberfraction);
        --DBMS_OUTPUT.put_line(expected_result.testdate||' - '|| result_dml.testdate);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        
        exception 
            when others then
                TEST_RESULT := 'FALSE';
                exceptionmessage := sqlerrm;
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
end;
/

-----------------------------------------------------------------------
-- dml_pack.delete_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0006.003.001';
    TEST_METHOD varchar2 (60) := 'dml_pack.delete_proc';
    TEST_NAME varchar2 (120) := 'Valid params test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 03';
    par_columnsynonymlist varchar2(500) := 'ID³TESZTSZÖVEG01³TESZTSZÁM³TESZTTÖRT³TESZTDÁTUM';
    par_valueliststring varchar2(2500) := '1³szöveg01³100³10,1³20-FEBR. -04';
    expected_result integer; 
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')';
        dml_pack.delete_proc(par_viewsynonymname, par_columnsynonymlist, par_valueliststring);
        select count(*) into expected_result from TEST_TABLE03;
        --DBMS_OUTPUT.put_line(expected_result);
        if expected_result = 0 then
            TEST_RESULT := 'TRUE';
        end if;
   
        --DBMS_OUTPUT.put_line(expected_result.id||' - '|| result_dml.id);
        --DBMS_OUTPUT.put_line(expected_result.testvarchar||' - '|| result_dml.testvarchar);
        --DBMS_OUTPUT.put_line(expected_result.testnumber||' - '|| result_dml.testnumber);
        --DBMS_OUTPUT.put_line(expected_result.testnumberfraction||' - '|| result_dml.testnumberfraction);
        --DBMS_OUTPUT.put_line(expected_result.testdate||' - '|| result_dml.testdate);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        
        exception 
            when others then
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
                TEST_RESULT := 'FALSE';
                exceptionmessage := sqlerrm;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
end;
/
-----------------------------------------------------------------------