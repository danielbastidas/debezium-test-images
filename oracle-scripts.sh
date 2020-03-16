shutdown immediate
startup mount
alter database archivelog;
alter database open;


alter database add supplemental log data (all) columns;
alter session set "_ORACLE_SCRIPT"=true;



create role logmnr_role;
grant create session to logmnr_role;
grant  execute_catalog_role,select any transaction ,select any dictionary to logmnr_role;
create user kminer identified by kminerpass;
grant  logmnr_role to kminer;
alter user kminer quota unlimited on users;

create role c##logmnr_role;
grant create session to c##logmnr_role;
grant  execute_catalog_role,select any transaction ,select any dictionary,logmining to c##logmnr_role;
create user c##kminer identified by kminerpass;
grant  c##logmnr_role to c##kminer;
alter user c##kminer quota unlimited on users set container_data = all container = current;


--before creating a user
--alter session set "_ORACLE_SCRIPT"=true;

--create the user
create user test identified by test;

grant connect to test;

GRANT CONNECT, RESOURCE, DBA TO test;

GRANT CREATE SESSION TO test;

--create tables
CREATE TABLE customers ( id number(10) NOT NULL, first_name varchar2(255) NOT NULL, last_name varchar2(255) NOT NULL, email varchar2(255) NOT NULL, CONSTRAINT customers_pk PRIMARY KEY (id) );
