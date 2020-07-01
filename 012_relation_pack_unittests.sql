 -----------------------------------------------------------------------
-- relation_pack.getviewname_func function UNIT TESZT:
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.001.001';
    TEST_METHOD varchar2 (60) := 'relation_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Valid params test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'TEST_TABLE03';
    result_viewname varchar2(30);
    expected_result varchar2(30) := 'HU_view_test_table03';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_viewname := relation_pack.getviewname_func(par_tablename);
        if upper(expected_result) = upper(result_viewname) then
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.001.002';
    TEST_METHOD varchar2 (60) := 'relation_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Case sensitive params test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'Test_TABLE03';
    result_viewname varchar2(30);
    expected_result varchar2(30) := 'HU_view_test_table03';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_viewname := relation_pack.getviewname_func(par_tablename);
        if upper(expected_result) = upper(result_viewname) then
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.001.003';
    TEST_METHOD varchar2 (60) := 'relation_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Null params test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := null;
    result_viewname varchar2(30);
    expected_result varchar2(30) := 'HU_view_test_table03';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_viewname := relation_pack.getviewname_func(par_tablename);
        
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.001.004';
    TEST_METHOD varchar2 (60) := 'relation_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Too long param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(50) := 'TEST_TABLE03012345678901234567890123456789';
    result_viewname varchar2(30);
    expected_result varchar2(30) := 'HU_view_test_table03';
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_viewname := relation_pack.getviewname_func(par_tablename);
        
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.001.005';
    TEST_METHOD varchar2 (60) := 'relation_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Invalid param test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(50) := 'invalidtablename';
    result_viewname varchar2(30);
    expected_result varchar2(30) := 'HU_view_test_table03';
    expected_exception varchar2(9) := 'ORA-20003';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_viewname := relation_pack.getviewname_func(par_tablename);
        
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
-- relation_pack.getsynonmyname_func function UNIT TESZT:
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.002.001';
    TEST_METHOD varchar2 (60) := 'relation_pack.getsynonmyname_func';
    TEST_NAME varchar2 (120) := 'Valid params test';
    TEST_RESULT varchar2 (5);
    par_viewname varchar2(30) := upper('HU_view_test_table03');
    result_synonymname varchar2(30);
    expected_result varchar2(30) := 'Teszttábla 03';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_synonymname := relation_pack.getsynonmyname_func(par_viewname);
        if upper(expected_result) = upper(result_synonymname) then
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.002.002';
    TEST_METHOD varchar2 (60) := 'relation_pack.getsynonmyname_func';
    TEST_NAME varchar2 (120) := 'Case sensitive params test';
    TEST_RESULT varchar2 (5);
    par_viewname varchar2(30) := 'HU_view_test_table03';
    result_synonymname varchar2(30);
    expected_result varchar2(30) := 'Teszttábla 03';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_synonymname := relation_pack.getsynonmyname_func(par_viewname);
        if upper(expected_result) = upper(result_synonymname) then
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.002.003';
    TEST_METHOD varchar2 (60) := 'relation_pack.getsynonmyname_func';
    TEST_NAME varchar2 (120) := 'Null param test';
    TEST_RESULT varchar2 (5);
    par_viewname varchar2(30) := null;
    result_synonymname varchar2(30);
    expected_result varchar2(30) := 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_synonymname := relation_pack.getsynonmyname_func(par_viewname);        
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.002.004';
    TEST_METHOD varchar2 (60) := 'relation_pack.getsynonmyname_func';
    TEST_NAME varchar2 (120) := 'Too long param test';
    TEST_RESULT varchar2 (5);
    par_viewname varchar2(50) := 'TEST_TABLE03012345678901234567890123456789';
    result_synonymname varchar2(30);
    expected_result varchar2(30) := 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_synonymname := relation_pack.getsynonmyname_func(par_viewname);        
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.002.004';
    TEST_METHOD varchar2 (60) := 'relation_pack.getsynonmyname_func';
    TEST_NAME varchar2 (120) := 'Too long param test';
    TEST_RESULT varchar2 (5);
    par_viewname varchar2(30) := 'Invalidtablename';
    result_synonymname varchar2(30);
    expected_result varchar2(30) := 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20003';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_synonymname := relation_pack.getsynonmyname_func(par_viewname);        
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
-- relation_pack.getparenttablesynonym1n_func function UNIT TESZT:
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.003.001';
    TEST_METHOD varchar2 (60) := 'relation_pack.getparenttablesynonym1n_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Teszttábla 6';
    result_listofparentsynonym varchar2(200);
    expected_result varchar2(30) := 'Teszttábla 04'||constantsettergetter_pack.const_separator||'Teszttábla 5';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_listofparentsynonym := relation_pack.getparenttablesynonym1n_func(par_viewsynonymname);
        --dbms_output.put_line(result_listofparentsynonym);
        if upper(expected_result) = upper(result_listofparentsynonym) then
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.003.002';
    TEST_METHOD varchar2 (60) := 'relation_pack.getparenttablesynonym1n_func';
    TEST_NAME varchar2 (120) := 'Null param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := null;
    result_listofparentsynonym varchar2(200);
    expected_result varchar2(30) := 'Teszttábla 04'||constantsettergetter_pack.const_separator||'Teszttábla 5';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_listofparentsynonym := relation_pack.getparenttablesynonym1n_func(par_viewsynonymname);
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.003.003';
    TEST_METHOD varchar2 (60) := 'relation_pack.getparenttablesynonym1n_func';
    TEST_NAME varchar2 (120) := 'Too long param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(35) := 't0123456789012345678901234567890';
    result_listofparentsynonym varchar2(200);
    expected_result varchar2(30) := 'Teszttábla 04'||constantsettergetter_pack.const_separator||'Teszttábla 5';
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_listofparentsynonym := relation_pack.getparenttablesynonym1n_func(par_viewsynonymname);
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
------------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0012.003.003';
    TEST_METHOD varchar2 (60) := 'relation_pack.getparenttablesynonym1n_func';
    TEST_NAME varchar2 (120) := 'Invalid param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'invalid_viewsynonymname';
    result_listofparentsynonym varchar2(200);
    expected_result varchar2(30) := 'Teszttábla 04'||constantsettergetter_pack.const_separator||'Teszttábla 5';
    expected_exception varchar2(9) := 'ORA-20003';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_listofparentsynonym := relation_pack.getparenttablesynonym1n_func(par_viewsynonymname);
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
------------------------------------------------------------------------











declare
    TEST_ID varchar2(30) := '0012.001.001';
    TEST_METHOD varchar2 (60) := 'relation_pack.getviewname_func';
    TEST_NAME varchar2 (120) := 'Valid params test';
    TEST_RESULT varchar2 (5);
    par_tablename varchar2(30) := 'basicpartner';
    result_viewname varchar2(30);
    expected_result varchar2(30) := 'HU_VIEW_BASICPARTNER';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_viewname := relation_pack.getviewname_func(par_tablename);
        if upper(expected_result) = upper(result_viewname) then
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

declare
    TEST_ID varchar2(30) := '0012.002.001';
    TEST_METHOD varchar2 (60) := 'relation_pack.getsynonmyname_func';
    TEST_NAME varchar2 (120) := 'Valid params test';
    TEST_RESULT varchar2 (5);
    par_viewname varchar2(30) := upper('HU_VIEW_BASICPARTNER');
    result_synonymname varchar2(30);
    expected_result varchar2(30) := 'Partner';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_synonymname := relation_pack.getsynonmyname_func(par_viewname);
        if upper(expected_result) = upper(result_synonymname) then
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

declare
    TEST_ID varchar2(30) := '0012.003.001';
    TEST_METHOD varchar2 (60) := 'relation_pack.getparenttablesynonym1n_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_viewsynonymname varchar2(30) := 'Partner';
    result_listofparentsynonym varchar2(200);
    expected_result varchar2(300) := 'Ország³Közterület tipus³Megye³Település';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        result_listofparentsynonym := relation_pack.getparenttablesynonym1n_func(par_viewsynonymname);
        dbms_output.put_line(result_listofparentsynonym);
        if upper(expected_result) = upper(result_listofparentsynonym) then
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
