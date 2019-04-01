------------------------------------- Create sequence for ADDRESSIMAGE ID ---------------------------------------
create sequence addressimage_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for APPIMAGE ID ---------------------------------------
create sequence appimage_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for COUNTRY ID ---------------------------------------
create sequence country_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for TOWN ID ---------------------------------------
create sequence town_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;


------------------------------------- Create sequence for POSTCODE ID ---------------------------------------
create sequence postcode_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for STREET ID ---------------------------------------
create sequence street_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for SNUMBER ID ---------------------------------------
create sequence snumber_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for FLATPART ID ---------------------------------------
create sequence flatpart_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for ADDRESS ID ---------------------------------------
create sequence address_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for SHAREHOLDERTYPE ID ---------------------------------------
create sequence shareholdertype_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for SHAREHOLDER ID ---------------------------------------
create sequence shareholder_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for FARM ID ---------------------------------------
create sequence farm_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for UNIT ID ---------------------------------------
create sequence unit_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for WORKSTATE ID ---------------------------------------
create sequence workstate_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for OPERATOR ID ---------------------------------------
create sequence operator_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for TURBINETYPE ID ---------------------------------------
create sequence turbinetype_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for TURBINE ID ---------------------------------------
create sequence turbine_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for STOCKSHARE ID ---------------------------------------
create sequence stockshare_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------- Create sequence for METERITEM ID ---------------------------------------
create sequence meteritem_seq
start with 1
increment by 1
minvalue 1
maxvalue 9223372036854775807
nocache
nocycle 
noorder;

------------------------------------------------------ Commit ------------------------------------------------
commit;

----------------------------------------------- Print the log-message ----------------------------------------

BEGIN
	DBMS_OUTPUT.PUT_LINE('*******************************************************************');
	DBMS_OUTPUT.PUT_LINE('*******************----------------------------********************');
	DBMS_OUTPUT.PUT_LINE('***********---- SEQUENCES ARE CREATED SUCCESSFULLY ----************');
	DBMS_OUTPUT.PUT_LINE('*******************----------------------------********************');
	DBMS_OUTPUT.PUT_LINE('*******************************************************************');
END;
/
