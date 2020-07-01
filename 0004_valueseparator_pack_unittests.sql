 -----------------------------------------------------------------------
-- valueseparator_pack.validationofvalue_proc FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0004.001.001';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Valid integer type param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_columnname varchar2(30) := 'ID';
    par_valuestring varchar2(200) := '1';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        
        valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
        
        TEST_RESULT := 'TRUE';
        
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
    TEST_ID varchar2(30) := '0004.001.002';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Valid string type param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_columnname varchar2(30) := 'TESTVARCHAR';
    par_valuestring varchar2(200) := 'teststring';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
		
		valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
        
        TEST_RESULT := 'TRUE';
        
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
    TEST_ID varchar2(30) := '0004.001.003';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Valid number type param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_columnname varchar2(30) := 'TESTNUMBER';
    par_valuestring varchar2(200) := '15';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        
        valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
        
        TEST_RESULT := 'TRUE';
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
    TEST_ID varchar2(30) := '0004.001.004';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Valid number with fraction param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_columnname varchar2(30) := 'TESTNUMBERFRACTION';
    par_valuestring varchar2(200) := '15,3';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';

        valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
        
        TEST_RESULT := 'TRUE';
        
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
    TEST_ID varchar2(30) := '0004.001.005';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Valid date type param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_columnname varchar2(30) := 'TESTDATE';
    par_valuestring varchar2(200) := '20-FEBR. -04';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';

        valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
        
        TEST_RESULT := 'TRUE';
        
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
    TEST_ID varchar2(30) := '0004.001.006';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Null value param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_columnname varchar2(30) := 'TESTDATE';
    par_valuestring varchar2(200) := null;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
     
        valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
        
        TEST_RESULT := 'TRUE';
        
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
    TEST_ID varchar2(30) := '0004.001.007';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Null par_originaltablename param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(30) := null;
    par_columnname varchar2(30) := 'ID';
    par_valuestring varchar2(200) := 1;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
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
    TEST_ID varchar2(30) := '0004.001.008';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Null par_columnname param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_columnname varchar2(30) := null;
    par_valuestring varchar2(200) := 1;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
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
    TEST_ID varchar2(30) := '0004.001.009';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Too long par_originaltablename param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(32) := '01234567890123456789012345678901';
    par_columnname varchar2(30) := 'ID';
    par_valuestring varchar2(200) := 1;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
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
    TEST_ID varchar2(30) := '0004.001.009';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.validationofvalue_proc';
    TEST_NAME varchar2 (120) := 'Too long par_originaltablename param test';
    TEST_RESULT varchar2 (5);

    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_columnname varchar2(32) := '01234567890123456789012345678901';
    par_valuestring varchar2(200) := 1;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        valueseparator_pack.validationofvalue_proc(par_originaltablename, par_columnname, par_valuestring);
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
-- valueseparator_pack.getlistofvalue_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0004.002.001';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.getlistofvalue_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    
    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolmnnames listofdbobjects := listofdbobjects('ID', 'testvarchar', 'testnumber', 'testnumberfraction','testdate');
    par_valueliststring varchar2(2000) := '1³szöveg01³100³10,10³20-FEBR. -04';
    expected_result listofvalues:=  listofvalues('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
    result_listofvalues listofvalues;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'TRUE';
        result_listofvalues := valueseparator_pack.getlistofvalue_func(par_originaltablename, par_listoftablecolmnnames, par_valueliststring);
        
        for i in expected_result.first..expected_result.count loop
            if expected_result(i) <> result_listofvalues(i) then
                TEST_RESULT := 'FALSE';
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
    TEST_ID varchar2(30) := '0004.002.002';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.getlistofvalue_func';
    TEST_NAME varchar2 (120) := 'Null par_originaltablename param test';
    TEST_RESULT varchar2 (5);
    
    par_originaltablename varchar2(30) := null;
    par_listoftablecolmnnames listofdbobjects := listofdbobjects('ID', 'testvarchar', 'testnumber', 'testnumberfraction','testdate');
    par_valueliststring varchar2(2000) := '1³szöveg01³100³10,10³20-FEBR. -04';
    expected_result listofvalues:=  listofvalues('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
    result_listofvalues listofvalues;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'false';
        result_listofvalues := valueseparator_pack.getlistofvalue_func(par_originaltablename, par_listoftablecolmnnames, par_valueliststring);
        
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
    TEST_ID varchar2(30) := '0004.002.003';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.getlistofvalue_func';
    TEST_NAME varchar2 (120) := 'Null par_listoftablecolmnnames param test';
    TEST_RESULT varchar2 (5);
    
    par_originaltablename varchar2(30) := 'TEST_TABLE03';
    par_listoftablecolmnnames listofdbobjects := null;
    par_valueliststring varchar2(2000) := '1³szöveg01³100³10,10³20-FEBR. -04';
    expected_result listofvalues:=  listofvalues('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
    result_listofvalues listofvalues;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'false';
        result_listofvalues := valueseparator_pack.getlistofvalue_func(par_originaltablename, par_listoftablecolmnnames, par_valueliststring);
        
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
    TEST_ID varchar2(30) := '0004.002.004';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.getlistofvalue_func';
    TEST_NAME varchar2 (120) := 'Too long par_originaltablename param test';
    TEST_RESULT varchar2 (5);
    
    par_originaltablename varchar2(33) := 'v01234567890123456789012345678901';
    par_listoftablecolmnnames listofdbobjects := listofdbobjects('ID', 'testvarchar', 'testnumber', 'testnumberfraction','testdate');
    par_valueliststring varchar2(2000) := '1³szöveg01³100³10,10³20-FEBR. -04';
    expected_result listofvalues:=  listofvalues('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
    result_listofvalues listofvalues;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'false';
        result_listofvalues := valueseparator_pack.getlistofvalue_func(par_originaltablename, par_listoftablecolmnnames, par_valueliststring);
        
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
    TEST_ID varchar2(30) := '0004.002.005';
    TEST_METHOD varchar2 (60) := 'valueseparator_pack.getlistofvalue_func';
    TEST_NAME varchar2 (120) := 'Count of lists equal test';
    TEST_RESULT varchar2 (5);
    
    par_originaltablename varchar2(33) := 'TEST_TABLE03';
    par_listoftablecolmnnames listofdbobjects := listofdbobjects('ID', 'testvarchar', 'testnumber', 'testnumberfraction','testdate');
    par_valueliststring varchar2(2000) := '1³szöveg01³10,10³20-FEBR. -04';
    expected_result listofvalues:=  listofvalues('1', 'szöveg01', '100', '10,10', '20-FEBR. -04');
    result_listofvalues listofvalues;
    expected_exception varchar2(9) := 'ORA-20005';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'false';
        result_listofvalues := valueseparator_pack.getlistofvalue_func(par_originaltablename, par_listoftablecolmnnames, par_valueliststring);
        
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