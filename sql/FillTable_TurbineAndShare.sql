------------------------------------- Fill table TURBINE ---------------------------------
declare
    turbine_model VARCHAR2(100);
	model VARCHAR2(100);
	date_format VARCHAR2(20) := 'dd.mm.yyyy';
	
    i_turbinetype_id number;
    i_operator_id number;
    i_address_id number;
    i_appimage_id number;
	i_farm_id number;
    i_farm_exist number;	
	i_prod_mw number;
	i_cost number;
    i_install_cost number;
	
    max_tur_type_id number;
    max_operator_id number;
    max_address_id number;
    max_appimage_id number;
    max_farm_id number;    
	
    i_installdt VARCHAR2(100);
    i_lastservdt_str VARCHAR2(100);
    i_lastyearservdt_str VARCHAR2(100);
    i_lastservdt date;
    i_lastyearservdt date;
	
    turbine_qty number := 1000;
	
begin
    for i in 1..turbine_qty loop    
   
		select count(id) into max_tur_type_id from turbinetype;
		select count(id) into max_operator_id from operator;
		select count(id) into max_address_id from address;
		select count(id) into max_appimage_id from appimage;
		select count(id) into max_farm_id from farm;
		
		
		i_turbinetype_id := TRUNC(dbms_random.value(1,max_tur_type_id),0);
		i_operator_id := TRUNC(dbms_random.value(1,max_operator_id),0);
		i_address_id := TRUNC(dbms_random.value(1,max_address_id),0);
		i_appimage_id := TRUNC(dbms_random.value(1,max_appimage_id),0);
		i_farm_exist := TRUNC(dbms_random.value(1,100),0);
		
		if i_farm_exist < 8  then 
			i_farm_id := TRUNC(dbms_random.value(1,max_farm_id),0); 
		else
			i_farm_id := null;
		end if;
	
		select model into turbine_model from turbinetype where id = i_turbinetype_id;
	
		model := turbine_model || '/' || TO_CHAR(TRUNC(dbms_random.value(2010,2017),0)) || '-dk/kol-' || TO_CHAR(TRUNC(dbms_random.value(1,1000),0));
		model := replace (model, ' ', '');
		
		i_installdt := TO_CHAR(TRUNC(dbms_random.value(1,28),0)) || '.'
						||  TO_CHAR(TRUNC(dbms_random.value(1,12),0)) || '.' 
						|| TO_CHAR(TRUNC(dbms_random.value(2008,2015),0));
						
		i_lastservdt_str := TO_CHAR(TRUNC(dbms_random.value(1,28),0)) || '.'
						||  TO_CHAR(TRUNC(dbms_random.value(1,12),0)) || '.' 
						|| TO_CHAR(TRUNC(dbms_random.value(2018,2019),0));
		i_lastservdt := to_date(i_lastservdt_str,date_format);              
						
						
		i_lastyearservdt_str := TO_CHAR(TRUNC(dbms_random.value(1,28),0)) || '.'
						||  TO_CHAR(TRUNC(dbms_random.value(1,12),0)) || '.' 
						|| TO_CHAR(TRUNC(dbms_random.value(2018,2019),0));
						
		i_lastyearservdt := to_date(i_lastyearservdt_str,date_format);
						
		i_cost := (TRUNC(dbms_random.value(600,800),0)) * 1000;    
		i_install_cost := (TRUNC(dbms_random.value(198,325),0)) * 1000;
		i_prod_mw := (TRUNC(dbms_random.value(8,200),0)) * 100;    
		
		insert into turbine (serialnum, installdt, prodmw, cost, installcost, 
			turbinetypeid, operatorid, farmid, addressid, imageid, 
			lastservdt,nextservdt, lastyearservdt, nextyearservdt)
			values (model, 
					to_date(i_installdt, date_format),
					i_prod_mw, i_cost, i_install_cost,
					i_turbinetype_id, i_operator_id, i_farm_id, i_address_id, i_appimage_id, 
					i_lastservdt,
					ADD_MONTHS(i_lastservdt,6),
					i_lastyearservdt,
					ADD_MONTHS(i_lastyearservdt,12));  
		end loop; 
	commit;  
 exception
      when others
        then dbms_output.put_line('Unknown error occured. Could not insert data in the table: TURBINE');
        rollback;
end;
/

------------------------------------- Fill table STOCKSHARE ---------------------------------
declare
    date_format VARCHAR2(20) := 'dd.mm.yyyy';
    i_purchasedt_str VARCHAR2(100);
    i_purchasedt date;
    
    i_turbine_id number;
    i_turbine_cost number;
    i_farm_id number;
    i_shareholder_id number;
    i_percent number;
    i_price number;
    
    max_turbine_id number;
    max_farm_id number; 
    max_shareholder_id number;
    
    i_farm_id_exist number;
    share_qty number := 1000;
		
begin
    for i in 1..share_qty loop 
        select count(id) into max_turbine_id from turbine;
        select count(id) into max_farm_id from farm;
        select count(id) into max_shareholder_id from shareholder;
        
        i_turbine_id := TRUNC(dbms_random.value(1,max_turbine_id),0);
        i_farm_id_exist := TRUNC(dbms_random.value(1,100),0);
        i_shareholder_id := TRUNC(dbms_random.value(1,max_shareholder_id),0);
        i_percent := TRUNC(dbms_random.value(1,30),0);
        
        select cost into i_turbine_cost from turbine where id = i_turbine_id;
        
        i_price := (i_turbine_cost * i_percent)/100; 
    
        if i_farm_id_exist < 15 then
            i_farm_id := TRUNC(dbms_random.value(1,max_farm_id),0);
        else
            i_farm_id := null;
        end if;
    
        i_purchasedt_str := TO_CHAR(TRUNC(dbms_random.value(1,28),0)) || '.'
						||  TO_CHAR(TRUNC(dbms_random.value(1,12),0)) || '.' 
						|| TO_CHAR(TRUNC(dbms_random.value(2013,2015),0));
        i_purchasedt := to_date(i_purchasedt_str,date_format); 
        
        if i_farm_id IS NOT NULL then
            insert into stockshare (turbineid, farmid, shareholderid, percent, price, purchasedt)
                values (null, i_farm_id, i_shareholder_id, i_percent, i_price*5, i_purchasedt);
        else
            insert into stockshare (turbineid, farmid, shareholderid, percent, price, purchasedt)
                values (i_turbine_id, null, i_shareholder_id, i_percent, i_price, i_purchasedt);
        end if;    
    end loop; 
    commit; 
exception
      when others
        then dbms_output.put_line('Unknown error occured. Could not insert data in the table: STOCKSHARE');
        rollback;
end;
/

