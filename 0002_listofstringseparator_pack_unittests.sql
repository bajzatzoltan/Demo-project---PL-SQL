-----------------------------------------------------------------------
-- listofstringseparator_pack.separateobjectstringlist_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0002.001.001';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separateobjectstringlist_func';
    TEST_NAME varchar2 (120) := 'Valid params test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) :=     'string01'||constantsettergetter_pack.const_separator||
                                                'string02'||constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator||
                                                'string05';
    expected_result listofdbobjects := listofdbobjects('string01','string02','string03','string04','string05') ;
    listofresult listofdbobjects;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        listofresult := listofstringseparator_pack.separateobjectstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.001.002';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separateobjectstringlist_func';
    TEST_NAME varchar2 (120) := 'A null param test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) :=     'string01'||constantsettergetter_pack.const_separator||
                                                constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator||
                                                'string05';
    expected_result listofdbobjects := listofdbobjects('string01',null,'string03','string04','string05') ;
    listofresult listofdbobjects;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        --DBMS_OUTPUT.put_line(notseparatedstringlist);
        listofresult := listofstringseparator_pack.separateobjectstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.001.003';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separateobjectstringlist_func';
    TEST_NAME varchar2 (120) := 'Null first param test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) :=     constantsettergetter_pack.const_separator||
                                                'string02'||constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator||
                                                'string05';
    expected_result listofdbobjects := listofdbobjects(null,'string02','string03','string04','string05') ;
    listofresult listofdbobjects;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        --DBMS_OUTPUT.put_line(notseparatedstringlist);
        listofresult := listofstringseparator_pack.separateobjectstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.001.004';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separateobjectstringlist_func';
    TEST_NAME varchar2 (120) := 'Null last param test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) :=     'string01'||constantsettergetter_pack.const_separator||
                                                'string02'||constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator;
    expected_result listofdbobjects := listofdbobjects('string01','string02','string03','string04',null) ;
    listofresult listofdbobjects;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        --DBMS_OUTPUT.put_line(notseparatedstringlist);
        listofresult := listofstringseparator_pack.separateobjectstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.001.005';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separateobjectstringlist_func';
    TEST_NAME varchar2 (120) := 'Too long params test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) :=     '01234567890123456789012345678901'||constantsettergetter_pack.const_separator||
                                                'string02'||constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator||
                                                'string05';
    expected_result listofdbobjects := listofdbobjects('string01','string02','string03','string04','string05') ;
    listofresult listofdbobjects;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := listofstringseparator_pack.separateobjectstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.001.006';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separateobjectstringlist_func';
    TEST_NAME varchar2 (120) := 'Null params test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) := null;
    expected_result listofdbobjects := listofdbobjects('string01','string02','string03','string04','string05') ;
    listofresult listofdbobjects;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := listofstringseparator_pack.separateobjectstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
-- listofstringseparator_pack.separatevaluesstringlist_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0002.002.001';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separatevaluesstringlist_func';
    TEST_NAME varchar2 (120) := 'Valid params test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) :=     'string01'||constantsettergetter_pack.const_separator||
                                                'string02'||constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator||
                                                'string05';
    expected_result listofvalues := listofvalues('string01','string02','string03','string04','string05') ;
    listofresult listofvalues;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        listofresult := listofstringseparator_pack.separatevaluesstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.002.002';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separatevaluesstringlist_func';
    TEST_NAME varchar2 (120) := 'Null param test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) :=     'string01'||constantsettergetter_pack.const_separator||
                                                constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator||
                                                'string05';
    expected_result listofvalues := listofvalues('string01',null,'string03','string04','string05') ;
    listofresult listofvalues;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        --DBMS_OUTPUT.put_line(notseparatedstringlist);
        listofresult := listofstringseparator_pack.separatevaluesstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.002.003';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separatevaluesstringlist_func';
    TEST_NAME varchar2 (120) := 'Null first param test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) :=     constantsettergetter_pack.const_separator||
                                                'string02'||constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator||
                                                'string05';
    expected_result listofvalues := listofvalues(null,'string02','string03','string04','string05') ;
    listofresult listofvalues;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        --DBMS_OUTPUT.put_line(notseparatedstringlist);
        listofresult := listofstringseparator_pack.separatevaluesstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.002.004';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separatevaluesstringlist_func';
    TEST_NAME varchar2 (120) := 'Null last param test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(200) :=     'string01'||constantsettergetter_pack.const_separator||
                                                'string02'||constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator;
    expected_result listofvalues := listofvalues('string01','string02','string03','string04',null) ;
    listofresult listofvalues;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
        --DBMS_OUTPUT.put_line(notseparatedstringlist);
        listofresult := listofstringseparator_pack.separatevaluesstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.002.005';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separatevaluesstringlist_func';
    TEST_NAME varchar2 (120) := 'Too long params test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(2000) :=     
    '01234567890123456789012345678901012345678901234567890123456789010123456789012345678901234567890101234567890123456789012345678901012345678901234567890123456789010123456789012345678901234567890101234567890123456789012345678901'
                                                ||constantsettergetter_pack.const_separator||
                                                'string02'||constantsettergetter_pack.const_separator||
                                                'string03'||constantsettergetter_pack.const_separator||
                                                'string04'||constantsettergetter_pack.const_separator||
                                                'string05';
    expected_result listofvalues := listofvalues('string01','string02','string03','string04','string05') ;
    listofresult listofvalues;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := listofstringseparator_pack.separatevaluesstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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
    TEST_ID varchar2(30) := '0002.002.006';
    TEST_METHOD varchar2 (60) := 'listofstringseparator_pack.separatevaluesstringlist_func';
    TEST_NAME varchar2 (120) := 'Null params test';
    TEST_RESULT varchar2 (5);
    notseparatedstringlist varchar2(2000) := null;
    expected_result listofvalues := listofvalues('string01','string02','string03','string04','string05') ;
    listofresult listofvalues;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        listofresult := listofstringseparator_pack.separatevaluesstringlist_func(notseparatedstringlist);
        TEST_RESULT := 'TRUE';
        for ind in expected_result.first..expected_result.count loop
            --DBMS_OUTPUT.put_line('expected_result ' ||ind||': '|| expected_result(ind));
            --DBMS_OUTPUT.put_line('listofresult ' ||ind||': '|| listofresult(ind));
            
            if expected_result(ind) <> listofresult(ind) then
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

