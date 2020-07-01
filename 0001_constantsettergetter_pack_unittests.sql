-----------------------------------------------------------------------
-- constantsettergetter_pack.setschemaowner_proc PROCEDURE UNIT TESTS:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0001.001.001';
    TEST_METHOD varchar2 (60) := 'constantsettergetter_pack.setschemaowner_proc';
    TEST_NAME varchar2 (120) := 'Change schemaowner with string param';
    TEST_RESULT varchar2 (5);
    expected_result varchar2(30) := 'x';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
                    DECLARE
                      PAR_SCHEMAOWNER VARCHAR2(200);
                    BEGIN
                      PAR_SCHEMAOWNER := 'x';
                    
                      CONSTANTSETTERGETTER_PACK.SETSCHEMAOWNER_PROC(
                        PAR_SCHEMAOWNER => PAR_SCHEMAOWNER
                      );
                    END;
                    
        if expected_result = constantsettergetter_pack.const_schemaowner then
            TEST_RESULT := 'TRUE';
        else 
            TEST_RESULT := 'FALSE';
        end if;
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        CONSTANTSETTERGETTER_PACK.SETSCHEMAOWNER_PROC('PROPALLADMIN');
        
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
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
                CONSTANTSETTERGETTER_PACK.SETSCHEMAOWNER_PROC('PROPALLADMIN');
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
    end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0001.001.002';
    TEST_METHOD varchar2 (60) := 'constantsettergetter_pack.setschemaowner_proc';
    TEST_NAME varchar2 (120) := 'Null param exception test';
    TEST_RESULT varchar2 (5);
    expected_result varchar2(30) := null;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (2000);
    
    begin
                    DECLARE
                      PAR_SCHEMAOWNER VARCHAR2(200);
                    BEGIN
                      PAR_SCHEMAOWNER := null;
                    
                      CONSTANTSETTERGETTER_PACK.SETSCHEMAOWNER_PROC(
                        PAR_SCHEMAOWNER => PAR_SCHEMAOWNER
                      );
                    END;
                    
        if expected_result = constantsettergetter_pack.const_schemaowner then
            TEST_RESULT := 'TRUE';
        else 
            TEST_RESULT := 'FALSE';
        end if;
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        CONSTANTSETTERGETTER_PACK.SETSCHEMAOWNER_PROC('PROPALLADMIN');
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        
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
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
                CONSTANTSETTERGETTER_PACK.SETSCHEMAOWNER_PROC('PROPALLADMIN');
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
    end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0001.001.003';
    TEST_METHOD varchar2 (60) := 'constantsettergetter_pack.setschemaowner_proc';
    TEST_NAME varchar2 (120) := 'Too long param exception test';
    TEST_RESULT varchar2 (5);
    expected_result varchar2(30) := null;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    
    begin
                    DECLARE
                      PAR_SCHEMAOWNER VARCHAR2(200);
                    BEGIN
                      PAR_SCHEMAOWNER := '0123456789012345678901234567890';
                    
                      CONSTANTSETTERGETTER_PACK.SETSCHEMAOWNER_PROC(
                        PAR_SCHEMAOWNER => PAR_SCHEMAOWNER
                      );
                    --rollback; 
                    END;
                    
        if expected_result = constantsettergetter_pack.const_schemaowner then
            TEST_RESULT := 'TRUE';
        else 
            TEST_RESULT := 'FALSE';
        end if;
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        CONSTANTSETTERGETTER_PACK.SETSCHEMAOWNER_PROC('PROPALLADMIN');
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        
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
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
                CONSTANTSETTERGETTER_PACK.SETSCHEMAOWNER_PROC('PROPALLADMIN');
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
    end;
/

-----------------------------------------------------------------------
-- constantsettergetter_pack.setseparator_proc PROCEDURE UNIT TEST:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0001.002.001';
    TEST_METHOD varchar2 (60) := 'constantsettergetter_pack.setseparator_proc';
    TEST_NAME varchar2 (120) := 'Change separator with string param';
    TEST_RESULT varchar2 (5);
    expected_result varchar2(3) := 'x';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin

                            DECLARE
                              PAR_SEPARATOR VARCHAR2(200);
                            BEGIN
                              PAR_SEPARATOR := 'x';
                            
                              CONSTANTSETTERGETTER_PACK.SETSEPARATOR_PROC(
                                PAR_SEPARATOR => PAR_SEPARATOR
                              );
                            END;
                    
        if expected_result = constantsettergetter_pack.const_separator then
            TEST_RESULT := 'TRUE';
        else 
            TEST_RESULT := 'FALSE';
        end if;
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        CONSTANTSETTERGETTER_PACK.SETSEPARATOR_PROC('³');
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        
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
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
                CONSTANTSETTERGETTER_PACK.SETSEPARATOR_PROC('³');
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
    end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0001.002.002';
    TEST_METHOD varchar2 (80) := 'constantsettergetter_pack.setseparator_proc';
    TEST_NAME varchar2 (120) := 'Null param exception test';
    TEST_RESULT varchar2 (6);
    par_separator varchar2 (3) := null;
    expected_result varchar2(3) := null;
    expected_exception varchar2(10) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
        TEST_RESULT := 'FALSE';
        DBMS_OUTPUT.PUT_LINE('chkp01');
        constantsettergetter_pack.setseparator_proc(par_separator);
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        CONSTANTSETTERGETTER_PACK.SETSEPARATOR_PROC('³');
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        
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
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
                CONSTANTSETTERGETTER_PACK.SETSEPARATOR_PROC('³');
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
    end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0001.002.003';
    TEST_METHOD varchar2 (60) := 'constantsettergetter_pack.setseparator_proc';
    TEST_NAME varchar2 (120) := 'Too long param exception test';
    TEST_RESULT varchar2 (5);
    expected_result varchar2(3) := null;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);
    begin

                            DECLARE
                              PAR_SEPARATOR VARCHAR2(200);
                            BEGIN
                              PAR_SEPARATOR := '0123';
                            
                              CONSTANTSETTERGETTER_PACK.SETSEPARATOR_PROC(
                                PAR_SEPARATOR => PAR_SEPARATOR
                              );
                            --rollback; 
                            END;
                    
        if expected_result = constantsettergetter_pack.const_separator then
            TEST_RESULT := 'TRUE';
        else 
            TEST_RESULT := 'FALSE';
        end if;
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        CONSTANTSETTERGETTER_PACK.SETSEPARATOR_PROC('³');
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
        
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
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
                CONSTANTSETTERGETTER_PACK.SETSEPARATOR_PROC('³');
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_schemaowner);
    end;
/

-----------------------------------------------------------------------
-- constantsettergetter_pack.setdefaulttablespace_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0001.002.001';
    TEST_METHOD varchar2 (60) := 'constantsettergetter_pack.setdefaulttablespace_proc';
    TEST_NAME varchar2 (120) := 'Change tablespace with string param';
    TEST_RESULT varchar2 (5);
    expected_result varchar2(30) := 'TESTSPACE';
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    begin
                    DECLARE
                      PAR_DEFAULTTABLESPACE VARCHAR2(200);
                    BEGIN
                      PAR_DEFAULTTABLESPACE := 'TESTSPACE';
                    
                      CONSTANTSETTERGETTER_PACK.SETDEFAULTTABLESPACE_PROC(
                        PAR_DEFAULTTABLESPACE => PAR_DEFAULTTABLESPACE
                      );
                    END;
                    
        if expected_result = constantsettergetter_pack.const_default_tablespace then
            TEST_RESULT := 'TRUE';
        else 
            TEST_RESULT := 'FALSE';
        end if;
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_default_tablespace);
        CONSTANTSETTERGETTER_PACK.SETDEFAULTTABLESPACE_PROC('USERS');
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_default_tablespace);
        
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
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_default_tablespace);
                CONSTANTSETTERGETTER_PACK.SETDEFAULTTABLESPACE_PROC('USERS');
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_default_tablespace);
    end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0001.002.002';
    TEST_METHOD varchar2 (60) := 'constantsettergetter_pack.setdefaulttablespace_proc';
    TEST_NAME varchar2 (120) := 'Null param exception test';
    TEST_RESULT varchar2 (5);
    expected_result varchar2(30) := null;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);
    begin
                    DECLARE
                      PAR_DEFAULTTABLESPACE VARCHAR2(200);
                    BEGIN
                      PAR_DEFAULTTABLESPACE := null;
                    
                      CONSTANTSETTERGETTER_PACK.SETDEFAULTTABLESPACE_PROC(
                        PAR_DEFAULTTABLESPACE => PAR_DEFAULTTABLESPACE
                      );
                    END;
                    
        if expected_result = constantsettergetter_pack.const_default_tablespace then
            TEST_RESULT := 'TRUE';
        else 
            TEST_RESULT := 'FALSE';
        end if;
        
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_default_tablespace);
        CONSTANTSETTERGETTER_PACK.SETDEFAULTTABLESPACE_PROC('USERS');
        --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_default_tablespace);
        
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
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_default_tablespace);
                CONSTANTSETTERGETTER_PACK.SETDEFAULTTABLESPACE_PROC('USERS');
                --DBMS_OUTPUT.PUT_LINE(constantsettergetter_pack.const_default_tablespace);
    end;
/
-----------------------------------------------------------------------

