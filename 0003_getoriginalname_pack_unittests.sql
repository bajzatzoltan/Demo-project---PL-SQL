-----------------------------------------------------------------------
-- getoriginalname_pack.getviewname_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.001.001';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Null param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := null;
    expected_result varchar2(30):=  'HU_VIEW_TEST_TABLES';
    resultofviewname varchar2(30);
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultofviewname := getoriginalname_pack.getviewname_func(par_viewsynonymname);
        
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.001.002';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Too long param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(32) := '01234567890123456789012345678901';
    expected_result varchar2(30):=  'HU_VIEW_TEST_TABLES';
    resultofviewname varchar2(30);
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultofviewname := getoriginalname_pack.getviewname_func(par_viewsynonymname);
        
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.001.003';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'TESTTABLE';
    expected_result varchar2(30):=  'HU_VIEW_TEST_TABLES';
    resultofviewname varchar2(30);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultofviewname := getoriginalname_pack.getviewname_func(par_viewsynonymname);
        if resultofviewname = expected_result then
            TEST_RESULT := 'TRUE';
        end if;
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.001.004';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Case sensitive param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'TesTTable';
    expected_result varchar2(30):=  'HU_VIEW_TEST_TABLES';
    resultofviewname varchar2(30);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultofviewname := getoriginalname_pack.getviewname_func(par_viewsynonymname);
        if resultofviewname = expected_result then
            TEST_RESULT := 'TRUE';
        end if;
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.001.005';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Invalid param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(32) := 'invalidname';
    expected_result varchar2(30):=  null;
    resultofviewname varchar2(30);
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultofviewname := getoriginalname_pack.getviewname_func(par_viewsynonymname);
        
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
end;
/
-----------------------------------------------------------------------
-- getoriginalname_pack.getoriginaltablename_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.002.001';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginaltablename_func';
    TEST_NAME varchar2 (120) := 'Null param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := null;
    expected_result varchar2(30):=  'TEST_TABLE01';
    resultoftablename varchar2(30);
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultoftablename := getoriginalname_pack.getoriginaltablename_func(par_vieworiginalname);
        
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.002.002';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginaltablename_func';
    TEST_NAME varchar2 (120) := 'Too long param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(35) := '01234567890123456789012345678901';
    expected_result varchar2(30):=  'TEST_TABLE01';
    resultoftablename varchar2(30);
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultoftablename := getoriginalname_pack.getoriginaltablename_func(par_vieworiginalname);
        
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.002.003';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginaltablename_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    expected_result varchar2(30):=  'TEST_TABLE01';
    resultoftablename varchar2(30);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultoftablename := getoriginalname_pack.getoriginaltablename_func(par_vieworiginalname);
        if resultoftablename = expected_result then
            TEST_RESULT := 'TRUE';
        end if;
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
end;
/
-----------------------------------------------------------------------


declare
    TEST_ID varchar2(30) := '0003.002.004';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginaltablename_func';
    TEST_NAME varchar2 (120) := 'Case sensitive param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_view_test_tables';
    expected_result varchar2(30):=  'TEST_TABLE01';
    resultoftablename varchar2(30);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultoftablename := getoriginalname_pack.getoriginaltablename_func(par_vieworiginalname);
        if resultoftablename = expected_result then
            TEST_RESULT := 'TRUE';
        end if;
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.002.005';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginaltablename_func';
    TEST_NAME varchar2 (120) := 'Invalid param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'invalidname';
    expected_result varchar2(30):=  'TEST_TABLE01';
    resultoftablename varchar2(30);
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultoftablename := getoriginalname_pack.getoriginaltablename_func(par_vieworiginalname);
        
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
end;
/
-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.002.006';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginaltablename_func';
    TEST_NAME varchar2 (120) := 'Contain whitespaces param test';
    TEST_RESULT varchar2 (5);
        par_vieworiginalname varchar2(30) := 'HU_view_test_ tables';
    expected_result varchar2(30):=  'TEST_TABLE01';
    resultoftablename varchar2(30);
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultoftablename := getoriginalname_pack.getoriginaltablename_func(par_vieworiginalname);
        
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
end;
/
-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.002.007';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginaltablename_func';
    TEST_NAME varchar2 (120) := 'Contain enter param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_view_test_
tables';
    expected_result varchar2(30):=  'TEST_TABLE01';
    resultoftablename varchar2(30);
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultoftablename := getoriginalname_pack.getoriginaltablename_func(par_vieworiginalname);
        
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
end;
/

-----------------------------------------------------------------------
-- getoriginalname_pack.getcolumnid_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.003.001';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getcolumnid_func';
    TEST_NAME varchar2 (120) := 'Invalid param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'invalidvalue';
    resultid integer;
    expected_id integer := 2;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);
    begin
        resultid := getoriginalname_pack.getcolumnid_func(par_vieworiginalname, par_columnsynonym);
        if resultid = expected_id then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.003.002';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getcolumnid_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    resultid integer;
    expected_id integer := 2;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultid := getoriginalname_pack.getcolumnid_func(par_vieworiginalname, par_columnsynonym);
        if resultid = expected_id then 
            TEST_RESULT := 'TRUE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.003.003';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getcolumnid_func';
    TEST_NAME varchar2 (120) := 'par_vieworiginalname param null test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := null;
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    resultid integer;
    expected_id integer := 2;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        resultid := getoriginalname_pack.getcolumnid_func(par_vieworiginalname, par_columnsynonym);
        if resultid = expected_id then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.003.004';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getcolumnid_func';
    TEST_NAME varchar2 (120) := 'par_columnsynonym param null test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  null;
    resultid integer;
    expected_id integer := 2;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        resultid := getoriginalname_pack.getcolumnid_func(par_vieworiginalname, par_columnsynonym);
        if resultid = expected_id then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.003.005';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getcolumnid_func';
    TEST_NAME varchar2 (120) := 'par_columnsynonym param too long test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(32):=  '01234567890123456789012345678901';
    resultid integer;
    expected_id integer := 2;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        resultid := getoriginalname_pack.getcolumnid_func(par_vieworiginalname, par_columnsynonym);
        if resultid = expected_id then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.003.006';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getcolumnid_func';
    TEST_NAME varchar2 (120) := 'par_columnsynonym param too long test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(32) := '01234567890123456789012345678901';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    resultid integer;
    expected_id integer := 2;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        resultid := getoriginalname_pack.getcolumnid_func(par_vieworiginalname, par_columnsynonym);
        if resultid = expected_id then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/


-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.003.007';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getcolumnid_func';
    TEST_NAME varchar2 (120) := 'par_columnsynonym whitespace test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU _VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    resultid integer;
    expected_id integer := 2;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);
    begin
        resultid := getoriginalname_pack.getcolumnid_func(par_vieworiginalname, par_columnsynonym);
        if resultid = expected_id then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.003.008';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getcolumnid_func';
    TEST_NAME varchar2 (120) := 'Case sensitive par_vieworiginalname param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_vIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    resultid integer;
    expected_id integer := 2;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultid := getoriginalname_pack.getcolumnid_func(par_vieworiginalname, par_columnsynonym);
        if resultid = expected_id then 
            TEST_RESULT := 'TRUE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.003.009';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getcolumnid_func';
    TEST_NAME varchar2 (120) := 'Case sensitive par_columnsynonym param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'tESZTSZÖVEG01';
    resultid integer;
    expected_id integer := 2;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        resultid := getoriginalname_pack.getcolumnid_func(par_vieworiginalname, par_columnsynonym);
        if resultid = expected_id then 
            TEST_RESULT := 'TRUE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/



-----------------------------------------------------------------------
-- getoriginalname_pack.getoriginalcolumnname_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.001';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'TRUE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.002';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'Invalid par_vieworiginalname param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'invalidvalue';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20002';
    expected_exception2 varchar2(21) := 'ORA-20003: ORA-20002';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                elsif expected_exception2 = substr(sqlerrm, 1, 20) then
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.003';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'Invalid par_columnsynonym param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'invalidvalue';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20002';
    expected_exception2 varchar2(21) := 'ORA-20003: ORA-20002';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                elsif expected_exception2 = substr(sqlerrm, 1, 20) then
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.004';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'Invalid par_originalTableName param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(30) := 'invalidvalue';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20002';
    expected_exception2 varchar2(21) := 'ORA-20003: ORA-20002';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                elsif expected_exception2 = substr(sqlerrm, 1, 20) then
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.005';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_vieworiginalname null param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := null;
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.006';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_columnsynonym null param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  null;
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.007';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_originalTableName null param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(30) := null;
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.008';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_vieworiginalname too long param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(32) := '01234567890123456789012345678901';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.009';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_columnsynonym too long param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(32):=  '01234567890123456789012345678901';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.010';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_originalTableName too long param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(32) := '01234567890123456789012345678901';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.011';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_vieworiginalname whitespace param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_ VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(32) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.012';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_vieworiginalname whitespace param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(32) := 'TEST_ TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);
    begin
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'FALSE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.013';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_vieworiginalname param case sensitive test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_vIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'TRUE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.014';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_columnsynonym param case sensitive test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'tESZTSZÖVEG01';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'TRUE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0003.004.015';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getoriginalcolumnname_func';
    TEST_NAME varchar2 (120) := 'par_originalTableName param case sensitive test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_columnsynonym varchar2(30):=  'TESZTSZÖVEG01';
    par_originalTableName varchar2(30) := 'tEST_TABLE01';
    result_originalcolumnname varchar2(30);
    expected_originalcolumnname varchar2(30) := 'TESTVARCHAR';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_originalcolumnname := getoriginalname_pack.getoriginalcolumnname_func(par_vieworiginalname, par_columnsynonym, par_originalTableName);
        if result_originalcolumnname = expected_originalcolumnname then 
            TEST_RESULT := 'TRUE';
            dbms_output.put_line(TEST_ID|| chr(10) ||
                                'TESTDATA:'|| chr(10) ||
                                'Method: '|| TEST_METHOD || chr(10) ||
                                'Test name: ' || TEST_NAME || chr (10) ||
                                'Exception message: ' || exceptionmessage || chr (10) ||
                                'Result: '|| TEST_RESULT); 
        end if;
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
end;
/


-----------------------------------------------------------------------
-- getoriginalname_pack.getlistoftablecolumnnames_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.001';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    par_columnsynonymlist varchar2(200) :=      'ID'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÖVEG01'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÁM'||constantsettergetter_pack.const_separator||
                                                'TESZTTÖRT'||constantsettergetter_pack.const_separator||
                                                'TESZTDÁTUM';
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            --DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.002';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Invalid par_vieworiginalname param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'invalidname';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    par_columnsynonymlist varchar2(200) :=      'ID'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÖVEG01'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÁM'||constantsettergetter_pack.const_separator||
                                                'TESZTTÖRT'||constantsettergetter_pack.const_separator||
                                                'TESZTDÁTUM';
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := 'ORA-20002';
    expected_exception2 varchar2(33) := 'ORA-20003: ORA-20003: ORA-20002:';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
                elsif expected_exception2 = substr(sqlerrm, 1, 32) then
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
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.003';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Invalid par_originalTableName param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_originalTableName varchar2(30) := 'invalidname';
    par_columnsynonymlist varchar2(200) :=      'ID'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÖVEG01'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÁM'||constantsettergetter_pack.const_separator||
                                                'TESZTTÖRT'||constantsettergetter_pack.const_separator||
                                                'TESZTDÁTUM';
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := 'ORA-20002';
    expected_exception2 varchar2(21) := 'ORA-20003: ORA-20002';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
                elsif expected_exception2 = substr(sqlerrm, 1, 20) then
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
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.004';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Null par_vieworiginalname param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := null;
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    par_columnsynonymlist varchar2(200) :=      'ID'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÖVEG01'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÁM'||constantsettergetter_pack.const_separator||
                                                'TESZTTÖRT'||constantsettergetter_pack.const_separator||
                                                'TESZTDÁTUM';
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.005';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Null par_originalTableName param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_originalTableName varchar2(30) := null;
    par_columnsynonymlist varchar2(200) :=      'ID'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÖVEG01'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÁM'||constantsettergetter_pack.const_separator||
                                                'TESZTTÖRT'||constantsettergetter_pack.const_separator||
                                                'TESZTDÁTUM';
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.006';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Null par_columnsynonymlist param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    par_columnsynonymlist varchar2(200) := null;
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.007';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Too long par_vieworiginalname param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(32) := '01234567890123456789012345678901';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    par_columnsynonymlist varchar2(200) :=      'ID'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÖVEG01'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÁM'||constantsettergetter_pack.const_separator||
                                                'TESZTTÖRT'||constantsettergetter_pack.const_separator||
                                                'TESZTDÁTUM';
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.008';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Too long par_originalTableName param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(32) := 'HU_VIEW_TEST_TABLES';
    par_originalTableName varchar2(32) := '01234567890123456789012345678901';
    par_columnsynonymlist varchar2(200) :=      'ID'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÖVEG01'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÁM'||constantsettergetter_pack.const_separator||
                                                'TESZTTÖRT'||constantsettergetter_pack.const_separator||
                                                'TESZTDÁTUM';
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.009';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Whitespace par_vieworiginalname param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_ VIEW_TEST_TABLES';
    par_originalTableName varchar2(30) := 'TEST_TABLE01';
    par_columnsynonymlist varchar2(200) :=      'ID'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÖVEG01'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÁM'||constantsettergetter_pack.const_separator||
                                                'TESZTTÖRT'||constantsettergetter_pack.const_separator||
                                                'TESZTDÁTUM';
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0003.005.010';
    TEST_METHOD varchar2 (60) := 'getoriginalname_pack.getlistoftablecolumnnames_func';
    TEST_NAME varchar2 (120) := 'Whitespace par_vieworiginalname param test';
    TEST_RESULT varchar2 (5);
    par_vieworiginalname varchar2(30) := 'HU_VIEW_TEST_TABLES';
    par_originalTableName varchar2(30) := 'TEST _TABLE01';
    par_columnsynonymlist varchar2(200) :=      'ID'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÖVEG01'||constantsettergetter_pack.const_separator||
                                                'TESZTSZÁM'||constantsettergetter_pack.const_separator||
                                                'TESZTTÖRT'||constantsettergetter_pack.const_separator||
                                                'TESZTDÁTUM';
    listofresult listofdbobjects;
    expected_result listofdbobjects :=  listofdbobjects('TESTID','TESTVARCHAR','TESTNUMBER','TESTNUMBERFRACTION','TESTDATE');
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := getoriginalname_pack.getlistoftablecolumnnames_func(par_vieworiginalname, par_columnsynonymlist, par_originalTableName);
        TEST_RESULT := 'TRUE';
        for i in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||i||': '|| expected_result(i));
            DBMS_OUTPUT.put_line('listofresult ' ||i||': '|| listofresult(i));
            if expected_result(i) <> listofresult(i) then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
        end loop;

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
end;
/