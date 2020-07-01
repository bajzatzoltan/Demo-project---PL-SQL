-----------------------------------------------------------------------
-- privileges_pack.createuser_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.001.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Valid param create user test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'UNITTESTUSER';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);
        
        select count(*) into var_validation from dba_users where username = upper(par_newusername);
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Valid param grant create session test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'UNITTESTUSER';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);
        
        select count(*) into var_validation from DBA_SYS_PRIVS where grantee like par_newusername and privilege like 'CREATE SESSION';
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Valid param grant execute interface_pack test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'UNITTESTUSER';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);
        select count(*) into var_validation from dba_tab_PRIVS where grantee like par_newusername and table_name like 'INTERFACE_PACK';
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Double user test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'UNITTESTUSER';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create user UNITTESTUSER identified by "unittestjelszo"';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid too short par_newusername test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'IT';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid too long par_newusername test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (35):= 'IT012345678901234567890123456789';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.007';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid null par_newusername test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= null;
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.008';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid whitespace par_newusername test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'UNITT ESTUSER';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.009';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid non alphabetic character in par_newusername test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'UNITT.ESTUSER';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20008';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.010';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid too short par_password test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'UNITTESTUSER';
    par_password varchar2 (30):= 'it';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.011';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid too long par_password test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (35):= 'UNITTESTUSER';
    par_password varchar2 (35):= 'un012345678901234567890123456789';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.012';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid null par_password test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'UNITTESTUSER';
    par_password varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
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
    TEST_ID varchar2(30) := '0009.001.013';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid whitespace par_password test ';
    TEST_RESULT varchar2 (5);
    par_newusername varchar2 (30):= 'UNITTESTUSER';
    par_password varchar2 (30):= 'unittest jelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createuser_proc(par_newusername, par_password);

        execute immediate 'drop user '||upper(par_newusername);
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
                select count(*) into var_validation from dba_users where username = upper(par_newusername);
                if var_validation > 0 then
                    execute immediate 'drop user '||upper(par_newusername);
                end if;
                dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 

end;
/
----------------------------------------------------------------------
-- privileges_pack.createrole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.002.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (30):= 'UNITTESTROLE';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);
        select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Double role test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (30):= 'UNITTESTROLE';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_newrolename||' identified by "'||par_password||'"';
        privileges_pack.createrole_proc(par_newrolename, par_password);

        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid too short par_newrolename test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (30):= 'IT';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);

        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid too long par_newrolename test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (35):= 'IT012345678901234567890123456789';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);

        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid null par_newrolename test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (30):= null;
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);

        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid whitespace par_newrolename test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (30):= ' U NITTESTROLE';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);

        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.007';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid non alphabetic character in par_newrolename test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (30):= 'UNITT.ESTROLE';
    par_password varchar2 (30):= 'unittestjelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20008';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);

        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.008';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid too short par_password test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (30):= 'UNITTESTROLE';
    par_password varchar2 (30):= 'it';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);

        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.009';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid too long par_password test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (35):= 'UNITTESTROLE';
    par_password varchar2 (35):= 'un012345678901234567890123456789';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);

        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.010';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid whitespace par_password test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (30):= 'UNITTESTROLE';
    par_password varchar2 (30):= 'unittest jelszo';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);

        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
    TEST_ID varchar2(30) := '0009.002.011';
    TEST_METHOD varchar2 (60) := 'privileges_pack.createrole_proc';
    TEST_NAME varchar2 (120) := 'Valid par_password param is null test ';
    TEST_RESULT varchar2 (5);
    par_newrolename varchar2 (30):= 'UNITTESTROLE';
    par_password varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.createrole_proc(par_newrolename, par_password);
        select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop role '||upper(par_newrolename);
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
                select count(*) into var_validation from USER_ROLE_PRIVS where granted_role = upper(par_newrolename);
                if var_validation > 0 then
                    execute immediate 'drop role '||upper(par_newrolename);
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
-- privileges_pack.grantselectoftabletorole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.003.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantselectoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        privileges_pack.grantselectoftabletorole_proc (par_rolename, par_viewsynonymname);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname) and privilege = 'SELECT';
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        -- nem kell, elég a drop role: execute immediate 'revoke select on '||getoriginalname_pack.getviewname_func(par_viewsynonymname)||' from '||par_rolename;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.003.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantselectoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantselectoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.003.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantselectoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantselectoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.003.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantselectoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantselectoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.003.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantselectoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_viewsynonymname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= null;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantselectoftabletorole_proc (par_rolename, par_viewsynonymname);
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
-- privileges_pack.grantinsertoftabletorole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.004.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantinsertoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        privileges_pack.grantinsertoftabletorole_proc (par_rolename, par_viewsynonymname);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname) and privilege = 'INSERT';
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        -- nem kell, elég a drop role: execute immediate 'revoke select on '||getoriginalname_pack.getviewname_func(par_viewsynonymname)||' from '||par_rolename;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.004.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantinsertoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantinsertoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.004.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantinsertoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantinsertoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.004.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantinsertoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantinsertoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.004.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantinsertoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_viewsynonymname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= null;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantinsertoftabletorole_proc (par_rolename, par_viewsynonymname);
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
-- privileges_pack.grantupdteoftabletorole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.005.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantupdteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        privileges_pack.grantupdteoftabletorole_proc (par_rolename, par_viewsynonymname);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname) and privilege = 'UPDATE';
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        -- nem kell, elég a drop role: execute immediate 'revoke select on '||getoriginalname_pack.getviewname_func(par_viewsynonymname)||' from '||par_rolename;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.005.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantupdteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantupdteoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.005.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantupdteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantupdteoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.005.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantupdteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantupdteoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.005.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantupdteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_viewsynonymname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= null;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantupdteoftabletorole_proc (par_rolename, par_viewsynonymname);
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
-- privileges_pack.grantdeleteoftabletorole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.006.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantdeleteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        privileges_pack.grantdeleteoftabletorole_proc (par_rolename, par_viewsynonymname);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = getoriginalname_pack.getviewname_func(par_viewsynonymname) and privilege = 'DELETE';
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        -- nem kell, elég a drop role: execute immediate 'revoke select on '||getoriginalname_pack.getviewname_func(par_viewsynonymname)||' from '||par_rolename;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.006.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantdeleteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantdeleteoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.006.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantdeleteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantdeleteoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.006.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantdeleteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_viewsynonymname varchar2 (30):= 'Teszttábla 03';
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantdeleteoftabletorole_proc (par_rolename, par_viewsynonymname);
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
    TEST_ID varchar2(30) := '0009.006.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantdeleteoftabletorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_viewsynonymname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewsynonymname varchar2 (30):= null;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantdeleteoftabletorole_proc (par_rolename, par_viewsynonymname);
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
-- privileges_pack.grantprivofexecutetorole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.007.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_packagename varchar2 (30):= 'TEST_PACK';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        privileges_pack.grantprivofexecutetorole_proc (par_rolename, par_packagename);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = par_packagename and privilege = 'EXECUTE';
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.007.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_packagename varchar2 (30):= 'TEST_PACK';
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantprivofexecutetorole_proc (par_rolename, par_packagename);
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
    TEST_ID varchar2(30) := '0009.007.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_packagename varchar2 (30):= 'TEST_PACK';
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantprivofexecutetorole_proc (par_rolename, par_packagename);
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
    TEST_ID varchar2(30) := '0009.007.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_packagename varchar2 (30):= 'TEST_PACK';
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantprivofexecutetorole_proc (par_rolename, par_packagename);
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
    TEST_ID varchar2(30) := '0009.007.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_packagename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_packagename varchar2 (30):= null;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantprivofexecutetorole_proc (par_rolename, par_packagename);
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
    TEST_ID varchar2(30) := '0009.007.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_packagename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_packagename varchar2 (30):= 'TEST_ PACK';
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantprivofexecutetorole_proc (par_rolename, par_packagename);
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
-- privileges_pack.grantroletouser_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.008.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantroletouser_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER';
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        execute immediate 'create user '||par_username;
        privileges_pack.grantroletouser_proc (par_username, par_rolename);
        select count(*) into var_validation from DBA_ROLE_PRIVS where granted_role = par_rolename and grantee = upper(par_username);
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop user '||par_username;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop user '||par_username;
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.008.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantroletouser_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER2';
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        --execute immediate 'create user '||par_username;
        privileges_pack.grantroletouser_proc (par_username, par_rolename);
        --execute immediate 'drop user '||par_username;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.008.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantroletouser_proc';
    TEST_NAME varchar2 (120) := 'Null par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := null;
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        --execute immediate 'create user '||par_username;
        privileges_pack.grantroletouser_proc (par_username, par_rolename);
        --execute immediate 'drop user '||par_username;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.008.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantroletouser_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER ';
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        --execute immediate 'create role '||par_rolename;
        --execute immediate 'create user '||par_username;
        privileges_pack.grantroletouser_proc (par_username, par_rolename);
        --execute immediate 'drop user '||par_username;
        --execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.008.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantroletouser_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER';
    par_rolename varchar2 (30):= 'UNITTESTROLE2';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        --execute immediate 'create role '||par_rolename;
        execute immediate 'create user '||par_username;
        privileges_pack.grantroletouser_proc (par_username, par_rolename);
        execute immediate 'drop user '||par_username;
        --execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop user '||par_username;
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
    TEST_ID varchar2(30) := '0009.008.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantroletouser_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER';
    par_rolename varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        --execute immediate 'create role '||par_rolename;
        execute immediate 'create user '||par_username;
        privileges_pack.grantroletouser_proc (par_username, par_rolename);
        execute immediate 'drop user '||par_username;
        --execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop user '||par_username;
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
    TEST_ID varchar2(30) := '0009.008.007';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantroletouser_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER ';
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        --execute immediate 'create role '||par_rolename;
        --execute immediate 'create user '||par_username;
        privileges_pack.grantroletouser_proc (par_username, par_rolename);
        --execute immediate 'drop user '||par_username;
        --execute immediate 'drop role '||par_rolename;
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
-- privileges_pack.selectprivofrole_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.009.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.selectprivofrole_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2(30) := 'UNITTESTROLE';
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    
    expected_table_name ROLE_TAB_PRIVS."TABLE_NAME"%type;
    expected_privilege ROLE_TAB_PRIVS."PRIVILEGE"%type;
    result_table_name ROLE_TAB_PRIVS."TABLE_NAME"%type;
    result_privilege ROLE_TAB_PRIVS."PRIVILEGE"%type;

    begin
        TEST_RESULT := 'TRUE';
         execute immediate 'create role '||par_rolename;
         execute immediate 'grant insert on HU_view_test_table03 to '||par_rolename;
         execute immediate 'grant delete on HU_view_test_table03 to '||par_rolename;
         execute immediate 'grant update on HU_view_test_table03 to '||par_rolename;
         execute immediate 'grant execute on TEST_PACK to '||par_rolename;
        
        open expected_sysrefcursor for select table_name, privilege from ROLE_TAB_PRIVS where role = par_rolename;
        result_sysrefcursor := privileges_pack.selectprivofrole_func (par_rolename);
        loop 
            FETCH expected_sysrefcursor INTO expected_table_name, expected_privilege;
            FETCH result_sysrefcursor INTO result_table_name, result_privilege;
            
            if expected_table_name <> result_table_name or result_table_name is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if expected_privilege <> result_privilege or result_privilege is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.009.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.selectprivofrole_func';
    TEST_NAME varchar2 (120) := 'Invalid param test';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2(30) := 'UNITTESTROLE2';
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);


    begin
        TEST_RESULT := 'FALSE';
        result_sysrefcursor := privileges_pack.selectprivofrole_func (par_rolename);

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
-- privileges_pack.selectalluser_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.010.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.selectalluser_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2(30) := null;
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    
    expected_username dba_users.username%type;
    expected_user_id dba_users.user_id%type;
    expected_account_status dba_users.account_status%type;
    expected_created dba_users.created%type;
    
    result_username dba_users.username%type;
    result_user_id dba_users.user_id%type;
    result_account_status dba_users.account_status%type;
    result_created dba_users.created%type;

    begin
        TEST_RESULT := 'TRUE';
        execute immediate 'create user unitttestuser01 identified by jelszo container = current';
        execute immediate 'create user unitttestuser02 identified by jelszo container = current';
        
        open expected_sysrefcursor for select user_id, username, account_status, created from dba_users where default_tablespace = constantsettergetter_pack.const_default_tablespace and oracle_maintained = 'N' order by username;
        result_sysrefcursor := privileges_pack.selectalluser_func;
        loop 
            FETCH expected_sysrefcursor INTO expected_user_id, expected_username, expected_account_status, expected_created ;
            FETCH result_sysrefcursor INTO result_user_id, result_username, result_account_status, result_created;
            if expected_sysrefcursor%rowcount <> result_sysrefcursor%rowcount then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if expected_user_id <> result_user_id then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND or result_sysrefcursor%Notfound;
        end loop;
        
        
        execute immediate 'drop user unitttestuser01';
        execute immediate 'drop user unitttestuser02';
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
                execute immediate 'drop user unitttestuser01';
                execute immediate 'drop user unitttestuser02';
end;
/

-----------------------------------------------------------------------
-- privileges_pack.revokeselectprivfromrole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.011.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeselectprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        execute immediate 'grant select on '||par_viewname||' to '||par_rolename;
        privileges_pack.revokeselectprivfromrole_proc (par_rolename, par_viewname);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = par_viewname and privilege = 'SELECT';
        if var_validation = 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.011.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeselectprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE_invalid';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeselectprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.011.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeselectprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_viewname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= 'HU_view_test_table03_invalid';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeselectprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.011.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeselectprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeselectprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.011.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeselectprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Null par_viewname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeselectprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.011.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeselectprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeselectprivfromrole_proc (par_rolename, par_viewname);
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
-- privileges_pack.revokeinserttprivfromrole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.012.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeinserttprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        execute immediate 'grant insert on '||par_viewname||' to '||par_rolename;
        privileges_pack.revokeinserttprivfromrole_proc (par_rolename, par_viewname);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = par_viewname and privilege = 'INSERT';
        if var_validation = 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.012.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeinserttprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE_INVALID';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeinserttprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.012.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeinserttprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_viewname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= 'HU_view_test_table03_INVALID';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeinserttprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.012.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeinserttprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeinserttprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.012.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeinserttprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Null par_viewname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeinserttprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.012.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeinserttprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeinserttprivfromrole_proc (par_rolename, par_viewname);
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
-- privileges_pack.revokeupdateprivfromrole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.013.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeupdateprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        execute immediate 'grant update on '||par_viewname||' to '||par_rolename;
        privileges_pack.revokeupdateprivfromrole_proc (par_rolename, par_viewname);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = par_viewname and privilege = 'UPDATE';
        if var_validation = 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.013.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeupdateprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE_INVALID';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeupdateprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.013.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeupdateprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_viewname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= 'HU_view_test_table03_INVALID';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeupdateprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.013.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeupdateprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeupdateprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.013.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeupdateprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Null par_viewname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeupdateprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.013.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeupdateprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeupdateprivfromrole_proc (par_rolename, par_viewname);
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
-- privileges_pack.revokedeleteprivfromrole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.014.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokedeleteprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        execute immediate 'grant delete on '||par_viewname||' to '||par_rolename;
        privileges_pack.revokedeleteprivfromrole_proc (par_rolename, par_viewname);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = par_viewname and privilege = 'DELETE';
        if var_validation = 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.014.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokedeleteprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokedeleteprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.014.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokedeleteprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_viewname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= 'HU_view_test_table03_INVALID';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokedeleteprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.014.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokedeleteprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokedeleteprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.014.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokedeleteprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Null par_viewname param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_viewname varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokedeleteprivfromrole_proc (par_rolename, par_viewname);
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
    TEST_ID varchar2(30) := '0009.014.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokedeleteprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_viewname varchar2 (30):= 'HU_view_test_table03';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokedeleteprivfromrole_proc (par_rolename, par_viewname);
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
-- privileges_pack.revokeexecuteprivfromrole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.015.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_packagename varchar2 (30):= 'TEST_PACK';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        execute immediate 'grant execute on '|| par_packagename ||' to '||par_rolename;
        privileges_pack.revokeexecuteprivfromrole_proc (par_rolename, par_packagename);
        select count(*) into var_validation from ROLE_TAB_PRIVS where role = par_rolename and table_name = par_packagename and privilege = 'EXECUTE';
        if var_validation = 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.015.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_packagename varchar2 (30):= 'TEST_PACK';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantprivofexecutetorole_proc (par_rolename, par_packagename);
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
    TEST_ID varchar2(30) := '0009.015.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeexecuteprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_packagename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_packagename varchar2 (30):= 'TEST_PACK2';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeexecuteprivfromrole_proc (par_rolename, par_packagename);
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
    TEST_ID varchar2(30) := '0009.015.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    par_packagename varchar2 (30):= 'TEST_PACK';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantprivofexecutetorole_proc (par_rolename, par_packagename);
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
    TEST_ID varchar2(30) := '0009.015.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantprivofexecutetorole_proc';
    TEST_NAME varchar2 (120) := 'Null par_packagename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_packagename varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantprivofexecutetorole_proc (par_rolename, par_packagename);
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
    TEST_ID varchar2(30) := '0009.015.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeexecuteprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    par_packagename varchar2 (30):= 'TEST_PACK';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokeexecuteprivfromrole_proc (par_rolename, par_packagename);
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
    TEST_ID varchar2(30) := '0009.015.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokeexecuteprivfromrole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    par_packagename varchar2 (30):= 'TEST_PACK ';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        execute immediate 'grant execute on '|| par_packagename ||' to '||par_rolename;
        privileges_pack.revokeexecuteprivfromrole_proc (par_rolename, par_packagename);
        dbms_output.put_line(TEST_ID|| chr(10) ||
                            'TESTDATA:'|| chr(10) ||
                            'Method: '|| TEST_METHOD || chr(10) ||
                            'Test name: ' || TEST_NAME || chr (10) ||
                            'Exception message: ' || exceptionmessage || chr (10) ||
                            'Result: '|| TEST_RESULT); 
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;

end;
/


-----------------------------------------------------------------------
-- privileges_pack.revokerolefromuser_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.016.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokerolefromuser_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER';
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        execute immediate 'create user '||par_username;
        execute immediate 'grant '||par_rolename||' to '||par_username;
        privileges_pack.revokerolefromuser_proc (par_rolename, par_username);
        select count(*) into var_validation from DBA_ROLE_PRIVS where granted_role = par_rolename and grantee = upper(par_username);
        if var_validation = 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop user '||par_username;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop user '||par_username;
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.016.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokerolefromuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER2';
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        --execute immediate 'create user '||par_username;
        privileges_pack.revokerolefromuser_proc (par_username, par_rolename);
        --execute immediate 'drop user '||par_username;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.016.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokerolefromuser_proc';
    TEST_NAME varchar2 (120) := 'Null par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := null;
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        --execute immediate 'create user '||par_username;
        privileges_pack.revokerolefromuser_proc (par_username, par_rolename);
        --execute immediate 'drop user '||par_username;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.016.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokerolefromuser_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER ';
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        --execute immediate 'create role '||par_rolename;
        --execute immediate 'create user '||par_username;
        privileges_pack.revokerolefromuser_proc (par_username, par_rolename);
        --execute immediate 'drop user '||par_username;
        --execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.008.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantroletouser_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER';
    par_rolename varchar2 (30):= 'UNITTESTROLE2';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        --execute immediate 'create role '||par_rolename;
        execute immediate 'create user '||par_username;
        privileges_pack.grantroletouser_proc (par_username, par_rolename);
        execute immediate 'drop user '||par_username;
        --execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop user '||par_username;
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
    TEST_ID varchar2(30) := '0009.016.006';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokerolefromuser_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER';
    par_rolename varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        --execute immediate 'create role '||par_rolename;
        execute immediate 'create user '||par_username;
        privileges_pack.revokerolefromuser_proc (par_username, par_rolename);
        execute immediate 'drop user '||par_username;
        --execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop user '||par_username;
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
    TEST_ID varchar2(30) := '0009.016.007';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokerolefromuser_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER';
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        --execute immediate 'create role '||par_rolename;
        --execute immediate 'create user '||par_username;
        privileges_pack.revokerolefromuser_proc (par_username, par_rolename);
        --execute immediate 'drop user '||par_username;
        --execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.016.008';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokerolefromuser_proc';
    TEST_NAME varchar2 (120) := 'Invalid par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30) := 'UNITTESTUSER';
    par_rolename varchar2 (30):= 'UNITTESTROLE2';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        --execute immediate 'create role '||par_rolename;
        execute immediate 'create user '||par_username;
        privileges_pack.revokerolefromuser_proc (par_username, par_rolename);
        execute immediate 'drop user '||par_username;
        --execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop user '||par_username;

end;
/


-----------------------------------------------------------------------
-- privileges_pack.droprole_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.017.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.droprole_proc';
    TEST_NAME varchar2 (120) := 'Valid param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create role '||par_rolename;
        
        privileges_pack.droprole_proc (par_rolename);
        select count(*) into var_validation from dba_roles where role = par_rolename;
        if var_validation = 0 then
            TEST_RESULT := 'TRUE';
        else
            execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop role '||par_rolename;
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
    TEST_ID varchar2(30) := '0009.017.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.droprole_proc';
    TEST_NAME varchar2 (120) := 'Null par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.droprole_proc (par_rolename);
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
    TEST_ID varchar2(30) := '0009.017.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.droprole_proc';
    TEST_NAME varchar2 (120) := 'Whaitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE ';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20004';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.droprole_proc (par_rolename);
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
    TEST_ID varchar2(30) := '0009.017.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.droprole_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_rolename param test ';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2 (30):= 'UNITTESTROLE';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20007';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.droprole_proc (par_rolename);
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
-- privileges_pack.revokecreatesessionfromuser_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.018.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokecreatesessionfromuser_proc';
    TEST_NAME varchar2 (120) := 'Valid par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'UNITTESTUSER';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create user '|| par_username;
        execute immediate 'grant create session to '|| par_username;
        privileges_pack.revokecreatesessionfromuser_proc(par_username);
        select count(*) into var_validation from DBA_SYS_PRIVS where grantee like par_username and privilege like 'CREATE SESSION';
        if var_validation = 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop user '||upper(par_username);
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
                execute immediate 'drop user '||upper(par_username);
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0009.018.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokecreatesessionfromuser_proc';
    TEST_NAME varchar2 (120) := 'Null par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokecreatesessionfromuser_proc(par_username);
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
    TEST_ID varchar2(30) := '0009.018.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokecreatesessionfromuser_proc';
    TEST_NAME varchar2 (120) := 'Too long par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (32):= 'T012345678901234567890123456789';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokecreatesessionfromuser_proc(par_username);
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
    TEST_ID varchar2(30) := '0009.018.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokecreatesessionfromuser_proc';
    TEST_NAME varchar2 (120) := 'Too short par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'T';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokecreatesessionfromuser_proc(par_username);
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
    TEST_ID varchar2(30) := '0009.018.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.revokecreatesessionfromuser_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'UNITTESTUSER_';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20008';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokecreatesessionfromuser_proc(par_username);
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
-- privileges_pack.grantsessiontouser_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.019.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantsessiontouser_proc';
    TEST_NAME varchar2 (120) := 'Valid par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'UNITTESTUSER';
    var_validation integer := 0;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        execute immediate 'create user '|| par_username;
        execute immediate 'grant create session to '|| par_username;
        privileges_pack.grantsessiontouser_proc(par_username);
        select count(*) into var_validation from DBA_SYS_PRIVS where grantee like par_username and privilege like 'CREATE SESSION';
        if var_validation > 0 then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop user '||upper(par_username);
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
                execute immediate 'drop user '||upper(par_username);
end;
/

-----------------------------------------------------------------------

declare
    TEST_ID varchar2(30) := '0009.019.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantsessiontouser_proc';
    TEST_NAME varchar2 (120) := 'Null par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= null;
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20000';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantsessiontouser_proc(par_username);
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
    TEST_ID varchar2(30) := '0009.019.003';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantsessiontouser_proc';
    TEST_NAME varchar2 (120) := 'Too long par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (32):= 'T012345678901234567890123456789';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantsessiontouser_proc(par_username);
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
    TEST_ID varchar2(30) := '0009.019.004';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantsessiontouser_proc';
    TEST_NAME varchar2 (120) := 'Too short par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'T';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20001';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.revokecreatesessionfromuser_proc(par_username);
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
    TEST_ID varchar2(30) := '0009.019.005';
    TEST_METHOD varchar2 (60) := 'privileges_pack.grantsessiontouser_proc';
    TEST_NAME varchar2 (120) := 'Whitespace par_username param test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'UNITTESTUSER_';
    var_validation integer := 0;
    expected_exception varchar2(9) := 'ORA-20008';
    exceptionmessage varchar2 (1000);

    begin
        TEST_RESULT := 'FALSE';
        privileges_pack.grantsessiontouser_proc(par_username);
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
-- privileges_pack.selectallroles_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.020.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.selectallroles_func';
    TEST_NAME varchar2 (120) := 'Valid test';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2(30) := null;
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    
    expected_role_id DBA_ROLES.role_id%type;
    expected_role DBA_ROLES.role%type;

    result_role_id DBA_ROLES.role_id%type;
    result_role DBA_ROLES.role%type;


    begin
        TEST_RESULT := 'TRUE';
        execute immediate 'create role unittestrole01';
        execute immediate 'create role unittestrole02';
        
        open expected_sysrefcursor for select role_id, role from DBA_ROLES where oracle_maintained = 'N' order by role;
        result_sysrefcursor := privileges_pack.selectallroles_func;
        loop 
            FETCH expected_sysrefcursor INTO expected_role_id, expected_role;
            FETCH result_sysrefcursor INTO result_role_id, result_role;
            if expected_sysrefcursor%rowcount <> result_sysrefcursor%rowcount then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            if expected_role_id <> result_role_id then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND or result_sysrefcursor%Notfound;
        end loop;
        
        
        execute immediate 'drop role unittestrole01';
        execute immediate 'drop role unittestrole02';
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
        execute immediate 'drop role unittestrole01';
        execute immediate 'drop role unittestrole02';
end;
/

-----------------------------------------------------------------------
-- privileges_pack.selectroleofuser_func FUNCTION UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.021.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.selectroleofuser_func';
    TEST_NAME varchar2 (120) := 'Valid param test';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2(30) := 'PROPALLTESTROLE01';
    par_username varchar2(30) := 'PROPALLTESTUSER01';
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);
    
    expected_grantee DBA_ROLE_PRIVS.grantee%type;
    expected_granted_role DBA_ROLE_PRIVS.granted_role%type;
    result_grantee DBA_ROLE_PRIVS.grantee%type;
    result_granted_role DBA_ROLE_PRIVS.granted_role%type;

    begin
        TEST_RESULT := 'TRUE';
         execute immediate 'create role '||par_rolename;
         execute immediate 'create user '||par_username||' identified by jelszo container = current';
         execute immediate 'grant '||par_rolename||' to ' || par_username;
        open expected_sysrefcursor for SELECT grantee, granted_role FROM  DBA_ROLE_PRIVS where grantee = upper(par_username);
        result_sysrefcursor := privileges_pack.selectroleofuser_func (par_username);
        loop 
            FETCH expected_sysrefcursor INTO expected_grantee, expected_granted_role;
            FETCH result_sysrefcursor INTO result_grantee, result_granted_role;
            --dbms_output.put_line('expected_grantee: '||expected_grantee);
            --dbms_output.put_line('result_grantee: '||result_grantee);
            if expected_grantee <> result_grantee or result_grantee is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            --dbms_output.put_line('expected_granted_role: '||expected_granted_role);
            --dbms_output.put_line('result_granted_role: '||result_granted_role);
            if expected_granted_role <> result_granted_role or result_granted_role is null then
                TEST_RESULT := 'FALSE';
                exit;
            end if;
            exit when expected_sysrefcursor%NOTFOUND;
        end loop;
        
        
        execute immediate 'drop user ' ||par_username;
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop user ' ||par_username;
                execute immediate 'drop role '||par_rolename;
end;
/
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.021.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.selectroleofuser_func';
    TEST_NAME varchar2 (120) := 'Inalid param test';
    TEST_RESULT varchar2 (5);
    par_rolename varchar2(30) := 'PROPALLTESTROLE01';
    par_username varchar2(30) := 'PROPALLTESTUSER01invalid';
    expected_sysrefcursor sys_refcursor;
    result_sysrefcursor sys_refcursor;
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);
    

    begin
        TEST_RESULT := 'FALSE';
         execute immediate 'create role '||par_rolename;
         execute immediate 'create user PROPALLTESTUSER01 identified by jelszo container = current';
         execute immediate 'grant '||par_rolename||' to PROPALLTESTUSER01';
        result_sysrefcursor := privileges_pack.selectroleofuser_func (par_username);
        
        execute immediate 'drop user PROPALLTESTUSER01';
        execute immediate 'drop role '||par_rolename;
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
                execute immediate 'drop user PROPALLTESTUSER01';
                execute immediate 'drop role '||par_rolename;
end;
/

-----------------------------------------------------------------------
-- privileges_pack.setaccuntstatustolock_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.022.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.setaccuntstatustolock_proc';
    TEST_NAME varchar2 (120) := 'Valid param user test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'PROPALLTESTUSER01';
    result_locked varchar2(30);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        execute immediate 'create user PROPALLTESTUSER01 identified by jelszo container = current';
        TEST_RESULT := 'FALSE';
        privileges_pack.setaccuntstatustolock_proc(par_username);
        select account_status into result_locked from dba_users 
            where oracle_maintained = 'N' and username = upper(par_username);
        if result_locked = 'LOCKED' or result_locked is not null then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop user PROPALLTESTUSER01';
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
                execute immediate 'drop user PROPALLTESTUSER01';

end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.022.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.setaccuntstatustolock_proc';
    TEST_NAME varchar2 (120) := 'Invalid param user test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'PROPALLTESTUSER01';
    result_locked varchar2(30);
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);

    begin

        TEST_RESULT := 'FALSE';
        privileges_pack.setaccuntstatustolock_proc(par_username);

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
-- privileges_pack.setaccuntstatustounlock_proc PROCEDURE UNIT TESZT:
-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.023.001';
    TEST_METHOD varchar2 (60) := 'privileges_pack.setaccuntstatustounlock_proc';
    TEST_NAME varchar2 (120) := 'Valid param user test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'PROPALLTESTUSER01';
    result_locked varchar2(30);
    expected_exception varchar2(9) := null;
    exceptionmessage varchar2 (1000);

    begin
        execute immediate 'create user PROPALLTESTUSER01 identified by jelszo container = current';
        execute immediate 'alter user PROPALLTESTUSER01 account lock';
        TEST_RESULT := 'FALSE';
        privileges_pack.setaccuntstatustounlock_proc(par_username);
        select account_status into result_locked from dba_users 
            where oracle_maintained = 'N' and username = upper(par_username);
        if result_locked = 'OPEN' or result_locked is not null then
            TEST_RESULT := 'TRUE';
        end if;
        execute immediate 'drop user PROPALLTESTUSER01';
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
                execute immediate 'drop user PROPALLTESTUSER01';

end;
/

-----------------------------------------------------------------------
declare
    TEST_ID varchar2(30) := '0009.023.002';
    TEST_METHOD varchar2 (60) := 'privileges_pack.setaccuntstatustounlock_proc';
    TEST_NAME varchar2 (120) := 'Invalid param user test ';
    TEST_RESULT varchar2 (5);
    par_username varchar2 (30):= 'PROPALLTESTUSER01';
    result_locked varchar2(30);
    expected_exception varchar2(9) := 'ORA-20002';
    exceptionmessage varchar2 (1000);

    begin

        TEST_RESULT := 'FALSE';
        privileges_pack.setaccuntstatustounlock_proc(par_username);

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