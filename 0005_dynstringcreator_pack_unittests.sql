-----------------------------------------------------------------------
-- dynstringcreator_pack.getinsertdynstring_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0005.001.001';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getinsertdynstring_func';
    TEST_NAME varchar2 (120) := 'Valid params test with first ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('ID', 'testvarchar', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getinsertdynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.001.002';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getinsertdynstring_func';
    TEST_NAME varchar2 (120) := 'Valid param test with not first ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'ID', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getinsertdynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        if expected_result = upper(result_dynstring) then
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
    TEST_ID varchar2(30) := '0005.001.003';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getinsertdynstring_func';
    TEST_NAME varchar2 (120) := 'Case sensitive param test with ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getinsertdynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        if expected_result = upper(result_dynstring) then
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
    TEST_ID varchar2(30) := '0005.001.004';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getinsertdynstring_func';
    TEST_NAME varchar2 (120) := 'Null par_tablename param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := null;
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getinsertdynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
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
    TEST_ID varchar2(30) := '0005.001.005';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getinsertdynstring_func';
    TEST_NAME varchar2 (120) := 'Null value of par_listoftablecolumnames param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects(null, 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getinsertdynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
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
    TEST_ID varchar2(30) := '0005.001.006';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getinsertdynstring_func';
    TEST_NAME varchar2 (120) := 'Too long par_tablename param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(32) := 't012345678901234567890123456789';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getinsertdynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);

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
    TEST_ID varchar2(30) := '0005.001.007';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getinsertdynstring_func';
    TEST_NAME varchar2 (120) := 'count of par_listoftablecolumnames and count of par_listofvalidatedvalues equal test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20005';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getinsertdynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);

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
    TEST_ID varchar2(30) := '0005.001.008';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getinsertdynstring_func';
    TEST_NAME varchar2 (120) := 'Valid params test with last ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'testnumber', 'testnumberfraction','testdate', 'ID');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '100', '10,10', '20-FEBR. -04','1');
    
    expected_result varchar2(3000):=  upper('insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getinsertdynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
-- dynstringcreator_pack.getupdatedynstring_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0005.002.001';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getupdatedynstring_func';
    TEST_NAME varchar2 (120) := 'Valid params test with first ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('ID', 'testvarchar', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('update TEST_TABLE03 set testvarchar=''szöveg01'',testnumber=''100'',testnumberfraction=''10,10'',testdate=''20-FEBR. -04'' where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (ID, testvarchar, testnumber, testnumberfraction,testdate) values ('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
        result_dynstring := dynstringcreator_pack.getupdatedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.002.002';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getupdatedynstring_func';
    TEST_NAME varchar2 (120) := 'Valid params test with last ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'testnumber', 'testnumberfraction','testdate','ID');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '100', '10,10', '20-FEBR. -04', '1');
    
    expected_result varchar2(3000):=  upper('update TEST_TABLE03 set testvarchar=''szöveg01'',testnumber=''100'',testnumberfraction=''10,10'',testdate=''20-FEBR. -04'' where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (ID, testvarchar, testnumber, testnumberfraction,testdate) values ('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
        result_dynstring := dynstringcreator_pack.getupdatedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.002.003';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getupdatedynstring_func';
    TEST_NAME varchar2 (120) := 'Valid params test with not first ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'ID', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('update TEST_TABLE03 set testvarchar=''szöveg01'',testnumber=''100'',testnumberfraction=''10,10'',testdate=''20-FEBR. -04'' where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (ID, testvarchar, testnumber, testnumberfraction,testdate) values ('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
        result_dynstring := dynstringcreator_pack.getupdatedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.002.004';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getupdatedynstring_func';
    TEST_NAME varchar2 (120) := 'Case sensitive ID of value of par_listoftablecolumnames param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('update TEST_TABLE03 set testvarchar=''szöveg01'',testnumber=''100'',testnumberfraction=''10,10'',testdate=''20-FEBR. -04'' where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (ID, testvarchar, testnumber, testnumberfraction,testdate) values ('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
        result_dynstring := dynstringcreator_pack.getupdatedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.002.005';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getupdatedynstring_func';
    TEST_NAME varchar2 (120) := 'Null par_tablename param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := null;
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('update TEST_TABLE03 set testvarchar=''szöveg01'',testnumber=''100'',testnumberfraction=''10,10'',testdate=''20-FEBR. -04'' where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getupdatedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.002.006';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getupdatedynstring_func';
    TEST_NAME varchar2 (120) := 'Null value of par_listoftablecolumnames param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects(null, 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues(null, '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('update TEST_TABLE03 set testvarchar=''szöveg01'',testnumber=''100'',testnumberfraction=''10,10'',testdate=''20-FEBR. -04'' where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getupdatedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.002.007';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getupdatedynstring_func';
    TEST_NAME varchar2 (120) := 'Too long par_tablename param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(32) := 't012345678901234567890123456789';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('update TEST_TABLE03 set testvarchar=''szöveg01'',testnumber=''100'',testnumberfraction=''10,10'',testdate=''20-FEBR. -04'' where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getupdatedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.002.008';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getupdatedynstring_func';
    TEST_NAME varchar2 (120) :=  'Count of par_listoftablecolumnames and count of par_listofvalidatedvalues equal test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('update TEST_TABLE03 set testvarchar=''szöveg01'',testnumber=''100'',testnumberfraction=''10,10'',testdate=''20-FEBR. -04'' where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20005';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getupdatedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.002.009';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getupdatedynstring_func';
    TEST_NAME varchar2 (120) :=  'Invalid ID param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction', 'testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '2', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('update TEST_TABLE03 set testvarchar=''szöveg01'',testnumber=''100'',testnumberfraction=''10,10'',testdate=''20-FEBR. -04'' where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')';
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';

        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                    execute immediate 'truncate table TEST_TABLE03';
                    execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                    execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                    execute immediate 'truncate table TEST_TABLE03';
                    execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                    execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
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
-- dynstringcreator_pack.getdeletedynstring_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0005.003.001';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getdeletedynstring_func';
    TEST_NAME varchar2 (120) := 'Valid params test with first ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('ID', 'testvarchar', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('delete from TEST_TABLE03 where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (ID, testvarchar, testnumber, testnumberfraction,testdate) values ('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.003.002';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getdeletedynstring_func';
    TEST_NAME varchar2 (120) := 'Valid params test with last ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'testnumber', 'testnumberfraction','testdate','ID');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '100', '10,10', '20-FEBR. -04', '1');
    
    expected_result varchar2(3000):=  upper('delete from TEST_TABLE03 where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (ID, testvarchar, testnumber, testnumberfraction,testdate) values ('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.003.003';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getdeletedynstring_func';
    TEST_NAME varchar2 (120) := 'Valid params test with not first ID';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'ID', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('delete from TEST_TABLE03 where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (ID, testvarchar, testnumber, testnumberfraction,testdate) values ('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.003.004';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getdeletedynstring_func';
    TEST_NAME varchar2 (120) := 'Case sensitive ID of value of par_listoftablecolumnames param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('delete from TEST_TABLE03 where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        insert into test_table03 (ID, testvarchar, testnumber, testnumberfraction,testdate) values ('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        if expected_result = upper(result_dynstring) then
            TEST_RESULT := 'TRUE';
        end if;
                execute immediate 'truncate table TEST_TABLE03';
                execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.003.005';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getdeletedynstring_func';
    TEST_NAME varchar2 (120) := 'Null par_tablename param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := null;
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('delete from TEST_TABLE03 where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.003.006';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getdeletedynstring_func';
    TEST_NAME varchar2 (120) := 'Null value of par_listoftablecolumnames param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects(null, 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues(null, '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('delete from TEST_TABLE03 where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.003.007';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getdeletedynstring_func';
    TEST_NAME varchar2 (120) := 'Too long par_tablename param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(32) := 't012345678901234567890123456789';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction','testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('delete from TEST_TABLE03 where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.003.008';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getdeletedynstring_func';
    TEST_NAME varchar2 (120) :=  'Count of par_listoftablecolumnames and count of par_listofvalidatedvalues equal test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '1', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('delete from TEST_TABLE03 where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20005';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
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
    TEST_ID varchar2(30) := '0005.003.009';
    TEST_METHOD varchar2 (60) := 'dynstringcreator_pack.getdeletedynstring_func';
    TEST_NAME varchar2 (120) :=  'Invalid ID param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolumnames listofdbobjects := listofdbobjects('testvarchar', 'id', 'testnumber', 'testnumberfraction', 'testdate');
    par_listofvalidatedvalues listofvalues:=  listofvalues('szöveg01', '2', '100', '10,10', '20-FEBR. -04');
    
    expected_result varchar2(3000):=  upper('delete from TEST_TABLE03 where id=1');
    result_dynstring varchar2(3000);
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'insert into TEST_TABLE03 (testvarchar, testnumber, testnumberfraction, testdate) values (''szöveg01'', ''100'', ''10,10'', ''20-FEBR. -04'')';
        result_dynstring := dynstringcreator_pack.getdeletedynstring_func(par_tablename, par_listoftablecolumnames, par_listofvalidatedvalues);
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --dbms_output.put_line(expected_result);
        --dbms_output.put_line(upper(result_dynstring));
        execute immediate 'truncate table TEST_TABLE03';
        execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
        execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';

        exception 
            when others then
                if expected_exception = substr(sqlerrm, 1, 9) then
                    TEST_RESULT := 'TRUE';
                    exceptionmessage := sqlerrm;
                    execute immediate 'truncate table TEST_TABLE03';
                    execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                    execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
                else
                    TEST_RESULT := 'FALSE';
                    exceptionmessage := sqlerrm;
                    execute immediate 'truncate table TEST_TABLE03';
                    execute immediate 'drop sequence '||constantsettergetter_pack.const_schemaowner||'.test_table03_id_seq';
                    execute immediate 'CREATE SEQUENCE test_table03_id_seq START WITH 1 NOCACHE ORDER';
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
