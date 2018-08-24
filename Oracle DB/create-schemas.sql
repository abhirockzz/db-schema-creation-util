DECLARE
  START_SEQUENCE number;
  END_SEQUENCE number;
  USERNAME_PREFIX VARCHAR2(30);
  USER_PASSWORD VARCHAR2(30);

BEGIN
  START_SEQUENCE := 100;
  END_SEQUENCE := 101;
  USERNAME_PREFIX := 'workshop';
  USER_PASSWORD := 'PasswOrd_123#';
  
  FOR USERNAME IN START_SEQUENCE .. END_SEQUENCE
  LOOP
    EXECUTE IMMEDIATE 'CREATE USER ' || USERNAME_PREFIX || USERNAME || ' IDENTIFIED BY ' || USER_PASSWORD;
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO ' || USERNAME_PREFIX || USERNAME;
    EXECUTE IMMEDIATE 'create table ' || USERNAME_PREFIX || USERNAME || '.EMPLOYEES (    
                        EMP_EMAIL    varchar2(100),  
                        EMP_NAME    varchar2(100),  
                        EMP_DEPT    varchar2(50),
                        constraint pk_emp primary key (EMP_EMAIL)
                      )';
  END LOOP;
END;