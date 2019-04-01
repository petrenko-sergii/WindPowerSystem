------------------------------------- Create trigger for ADDRESSIMAGE ---------------------------------------
create or replace trigger trg_addressimage
   before insert on addressimage for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select addressimage_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for APPIMAGE ---------------------------------------
create or replace trigger trg_appimage
   before insert on appimage for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select appimage_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for COUNTRY ---------------------------------------
create or replace trigger trg_country
   before insert on country for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select country_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for TOWN ---------------------------------------
create or replace trigger trg_town
   before insert on town for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select town_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for POSTCODE ---------------------------------------
create or replace trigger trg_postcode
   before insert on postcode for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select postcode_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for STREET ---------------------------------------
create or replace trigger trg_street
   before insert on street for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select street_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for SNUMBER ---------------------------------------
create or replace trigger trg_snumber
   before insert on snumber for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select snumber_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for FLATPART ---------------------------------------
create or replace trigger trg_flatpart
   before insert on flatpart for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select flatpart_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for ADDRESS ---------------------------------------
create or replace trigger trg_address
   before insert on address for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select address_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for SHAREHOLDERTYPE ---------------------------------------
create or replace trigger trg_shareholdertype
   before insert on shareholdertype for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select shareholdertype_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for SHAREHOLDER ---------------------------------------
create or replace trigger trg_shareholder
   before insert on shareholder for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select shareholder_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for FARM ---------------------------------------
create or replace trigger trg_farm
   before insert on farm for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select farm_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for UNIT ---------------------------------------
create or replace trigger trg_unit
   before insert on unit for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select unit_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for WORKSTATE ---------------------------------------
create or replace trigger trg_workstate
   before insert on workstate for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select workstate_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for OPERATOR ---------------------------------------
create or replace trigger trg_operator
   before insert on operator for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select operator_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for TURBINETYPE ---------------------------------------
create or replace trigger trg_turbinetype
   before insert on turbinetype for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select turbinetype_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for TURBINE ---------------------------------------
create or replace trigger trg_turbine
   before insert on turbine for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select turbine_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for STOCKSHARE ---------------------------------------
create or replace trigger trg_stockshare
   before insert on stockshare for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select stockshare_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

------------------------------------- Create trigger for METERITEM ---------------------------------------
create or replace trigger trg_meteritem
   before insert on meteritem for each row
declare
   v_id number;
begin
   if (:new.id is null or :new.id = 0) then
      select meteritem_seq.nextval into v_id from dual;
      :new.id := v_id;
   end if;
end;
/

---------------------------------------------------- Commit -----------------------------------------------
commit;

-------------------------------------------- Print the log-message ----------------------------------------

BEGIN
	DBMS_OUTPUT.PUT_LINE('*******************************************************************');
	DBMS_OUTPUT.PUT_LINE('*******************----------------------------********************');
	DBMS_OUTPUT.PUT_LINE('************---- TRIGGERS ARE CREATED SUCCESSFULLY ----************');
	DBMS_OUTPUT.PUT_LINE('*******************----------------------------********************');
	DBMS_OUTPUT.PUT_LINE('*******************************************************************');
END;
/


