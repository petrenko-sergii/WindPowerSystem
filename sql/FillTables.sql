------------------------------------- Fill table ADDRESSIMAGE ---------------------------------------
declare
    root_folder VARCHAR2(200) := 'Content\Images\Address\Town\'; 
	town_name VARCHAR2(100) := 'Kolding\';
	
begin
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_10.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_12.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_22.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_24.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_37.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_76.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_79.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_89.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_100.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_102.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_104.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_117.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_120.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Haderslevvej_124.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_1.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_2.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_3.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_4.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_5.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_6.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_7.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_13.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_15.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_17.jpg');
	insert into addressimage (path) values (root_folder || town_name || 'Kolding_Ndr_Ringvej_49.jpg');
	
    town_name := 'Odense\';
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_50.jpg');
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_53.jpg');
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_65.jpg');
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_67.jpg');
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_109.jpg');
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_111.jpg');
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_115.jpg');
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_119.jpg');
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_155.jpg');
    insert into addressimage (path) values (root_folder || town_name || 'Odense_Middelfartvej_165.jpg');
   
     commit;
    
 exception
      when VALUE_ERROR
        then dbms_output.put_line('Value error. Make sure your input is correct.');
      when others
        then dbms_output.put_line('Unknown error occured. Could not insert data in the table: ADDRESSIMAGE');
        rollback;
end;
/

------------------------------------- Fill table APPIMAGE ---------------------------------------
declare
    root_folder VARCHAR2(200) := 'Content\Images\TurbineTypes\'; 
	manufacturer_name VARCHAR2(100) := 'Vestas\';
	
begin
	insert into appimage (path) values (root_folder || manufacturer_name || 'V39_600.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'V47_660.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'V52_850.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'V80_2000.jpg');
	
	manufacturer_name := 'Siemens\';
	insert into appimage (path) values (root_folder || manufacturer_name || 'SG_21_114.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'SG_26_126.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'SWT_DD-120.jpg');
	
	manufacturer_name := 'Nordex\';
	
	insert into appimage (path) values (root_folder || manufacturer_name || 'N43.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'N50.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'N52.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'N80.jpg');
	
	manufacturer_name := 'Enercon\';
	insert into appimage (path) values (root_folder || manufacturer_name || 'E-32.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'E-44.jpg');
	insert into appimage (path) values (root_folder || manufacturer_name || 'E-66.jpg');
   
     commit;
    
 exception
      when others
        then dbms_output.put_line('Unknown error occured. Could not insert data in the table: APPIMAGE');
        rollback;
end;
/

------------------------------------- Fill table FLAGIMAGE ---------------------------------------

declare
    root_folder VARCHAR2(200) := 'Content\Images\CountryFlags\'; 
	
begin
    insert into flagimage (path) values (root_folder || 'AustriaFlag.jpg');
    insert into flagimage (path) values (root_folder || 'BelgiumFlag.jpg');
    insert into flagimage (path) values (root_folder || 'DenmarkFlag.jpg');
    insert into flagimage (path) values (root_folder || 'FinlandFlag.jpg');
    insert into flagimage (path) values (root_folder || 'GermanyFlag.jpg');
    insert into flagimage (path) values (root_folder || 'FranceFlag.jpg');
    insert into flagimage (path) values (root_folder || 'NetherlandsFlag.jpg');
    insert into flagimage (path) values (root_folder || 'NorwayFlag.jpg');
    insert into flagimage (path) values (root_folder || 'PolandFlag.jpg');
    insert into flagimage (path) values (root_folder || 'SwedenFlag.jpg');
    insert into flagimage (path) values (root_folder || 'UnitedKingdomFlag.jpg');
      
    commit;
    
 exception
     when others
       then dbms_output.put_line('Unknown error occured. Could not insert data in the table: FLAGIMAGE');
       rollback;
end;
/

------------------------------------- Fill table COUNTRY ---------------------------------------
insert into country (name, flagimageid) values ('Austria', 1);
insert into country (name, flagimageid) values ('Belgium', 2);
insert into country (name, flagimageid) values ('Denmark', 3);
insert into country (name, flagimageid) values ('Finland', 4);
insert into country (name, flagimageid) values ('Germany', 5);
insert into country (name, flagimageid) values ('France', 6);
insert into country (name, flagimageid) values ('Netherlands', 7);
insert into country (name, flagimageid) values ('Norway', 8);
insert into country (name, flagimageid) values ('Poland', 9);
insert into country (name, flagimageid) values ('Sweden', 10);
insert into country (name, flagimageid) values ('United Kingdom', 11);


------------------------------------- Fill table TOWN ---------------------------------------
-------For Denmark
insert into town (name, countryid) values ('Aarhus',3);
insert into town (name, countryid) values ('Copenhagen',3);
insert into town (name, countryid) values ('Esbjerg',3);
insert into town (name, countryid) values ('Kolding',3);
insert into town (name, countryid) values ('Odense',3);
insert into town (name, countryid) values ('Randers',3);
insert into town (name, countryid) values ('Thisted',3);
insert into town (name, countryid) values ('Vejle',3);
insert into town (name, countryid) values ('Viborg',3);

-------For Germany
insert into town (name, countryid) values ('Berlin',5);
insert into town (name, countryid) values ('Bremen',5);
insert into town (name, countryid) values ('Cologne',5);
insert into town (name, countryid) values ('Dortmund',5);
insert into town (name, countryid) values ('Dresden',5);
insert into town (name, countryid) values ('DÃ¼sseldorf',5);
insert into town (name, countryid) values ('Hamburg',5);
insert into town (name, countryid) values ('Hanover',5);
insert into town (name, countryid) values ('Frankfurt am Main',5);
insert into town (name, countryid) values ('Leipzig',5);
insert into town (name, countryid) values ('Munich',5);
insert into town (name, countryid) values ('Nuremberg',5);
insert into town (name, countryid) values ('Stuttgart',5);

------------------------------------- Fill table POSTCODE ---------------------------------------

insert into postcode (value) values ('1107');
insert into postcode (value) values ('1864');
insert into postcode (value) values ('2100');
insert into postcode (value) values ('2200');
insert into postcode (value) values ('2300');
insert into postcode (value) values ('2400');
insert into postcode (value) values ('2500');
insert into postcode (value) values ('5000');
insert into postcode (value) values ('5200');
insert into postcode (value) values ('5250');
insert into postcode (value) values ('5270');
insert into postcode (value) values ('6000');
insert into postcode (value) values ('7100');
insert into postcode (value) values ('7700');
insert into postcode (value) values ('8000');
insert into postcode (value) values ('8200');
insert into postcode (value) values ('8210');
insert into postcode (value) values ('8230');
insert into postcode (value) values ('8260');
insert into postcode (value) values ('8800');
insert into postcode (value) values ('8840');
insert into postcode (value) values ('8900');
insert into postcode (value) values ('8920');
insert into postcode (value) values ('8930');
insert into postcode (value) values ('8960');

------------------------------------- Fill table STREET ---------------------------------------
-------For Denmark (town: Kolding)
insert into street (name, townid, postcodeid) values ('Haderslevvej',4,12);
insert into street (name, townid, postcodeid) values ('Ndr Ringvej',4,12);
insert into street (name, townid, postcodeid) values ('Katrinegade',4,12);
insert into street (name, townid, postcodeid) values ('Sdr Ringvej',4,12);
insert into street (name, townid, postcodeid) values ('Istedvej',4,12);
insert into street (name, townid, postcodeid) values ('Hertug Abels',4,12);
insert into street (name, townid, postcodeid) values ('Agtrupvej',4,12);
insert into street (name, townid, postcodeid) values ('Jernbanegade',4,12);
insert into street (name, townid, postcodeid) values ('Brostraede',4,12);
insert into street (name, townid, postcodeid) values ('Sydbanegade',4,12);
insert into street (name, townid, postcodeid) values ('Bredgade',4,12);
insert into street (name, townid, postcodeid) values ('Kastaniealle',4,12);
insert into street (name, townid, postcodeid) values ('Galgebjergvej',4,12);
insert into street (name, townid, postcodeid) values ('Drosselvej',4,12);

-------For Denmark (town: Odense)
insert into street (name, townid, postcodeid) values ('Rugaardsvej',5,8);
insert into street (name, townid, postcodeid) values ('Thomas Overskous Vej',5,8);
insert into street (name, townid, postcodeid) values ('Middelfartvej',5,9);
insert into street (name, townid, postcodeid) values ('Roesskovsvej',5,9);
insert into street (name, townid, postcodeid) values ('Frederiksgade',5,8);
insert into street (name, townid, postcodeid) values ('Nyborgvej',5,8);
insert into street (name, townid, postcodeid) values ('Kochsgade',5,8);
insert into street (name, townid, postcodeid) values ('Windelsvej',5,8);
insert into street (name, townid, postcodeid) values ('Gammel Hoejmevej',5,10);
insert into street (name, townid, postcodeid) values ('Assensvej',5,10);
insert into street (name, townid, postcodeid) values ('Sanderumvej',5,10);
insert into street (name, townid, postcodeid) values ('Bladstrupvej',5,11);

------------------------------------- Fill table SNUMBER (street numbers) ---------------------------

--Kolding_Haderslevvej
DECLARE
    num_value NUMBER :=1;
    street_max_num_value NUMBER :=189;
    street_num NUMBER :=1;
BEGIN
    WHILE (num_value <= street_max_num_value) 
    LOOP
        insert into snumber (value, streetid) values (num_value, street_num);
        num_value:=num_value+1;
    END LOOP;
END;
/

--Kolding_Haderslevvej_coordinates_updates
BEGIN
update snumber
    set latitude = 55.485777, 
    longitude = 9.471932, 
    imageid = 1
    where value = 10 and streetid = 1;
    
update snumber
    set latitude = 55.485713, 
    longitude = 9.471923, 
    imageid = 2
    where value = 12 and streetid = 1;
    
update snumber
    set latitude = 55.484725, 
    longitude = 9.471412, 
    imageid = 3
    where value = 22 and streetid = 1;
        
update snumber
    set latitude = 55.484675, 
    longitude = 9.471332, 
    imageid = 4
    where value = 24 and streetid = 1;
        
update snumber
    set latitude = 55.484211, 
    longitude = 9.471337, 
    imageid = 5
    where value = 37 and streetid = 1;
        
update snumber
    set latitude = 55.479972, 
    longitude = 9.468305, 
    imageid = 6
    where value = 76 and streetid = 1;
        
update snumber
    set latitude = 55.481136, 
    longitude = 9.468525, 
    imageid = 7
    where value = 79 and streetid = 1;
        
update snumber
    set latitude = 55.480519, 
    longitude = 9.468601, 
    imageid = 8
    where value = 89 and streetid = 1;
        
update snumber
    set latitude = 55.478168, 
    longitude = 9.468441, 
    imageid = 9
    where value = 100 and streetid = 1;
        
update snumber
    set latitude = 55.477575, 
    longitude = 9.468652, 
    imageid = 10
    where value = 102 and streetid = 1;
        
update snumber
    set latitude = 55.477245, 
    longitude = 9.468653, 
    imageid = 11
    where value = 104 and streetid = 1;
        
update snumber
    set latitude = 55.477420, 
    longitude = 9.469489, 
    imageid = 12
    where value = 117 and streetid = 1;
        
update snumber
    set latitude = 55.475627, 
    longitude = 9.469319, 
    imageid = 13
    where value = 120 and streetid = 1;
        
update snumber
    set latitude = 55.474996, 
    longitude = 9.469474, 
    imageid = 14
    where value = 124 and streetid = 1;  
END;
/

--Kolding_Ndr_Ringvej 
DECLARE
    num_value NUMBER :=1;
    street_max_num_value NUMBER :=87;
    street_num NUMBER :=2;
BEGIN
    WHILE (num_value <= street_max_num_value) 
    LOOP
        insert into snumber (value, streetid) values (num_value, street_num);
        num_value:=num_value+1;
    END LOOP;
END;
/

--Kolding_Ndr_Ringvej_coordinates_updates
BEGIN
update snumber
    set latitude = 55.495220, 
    longitude = 9.461014, 
    imageid = 15
    where value = 1 and streetid = 2;
    
update snumber
    set latitude = 55.494884, 
    longitude = 9.461817, 
    imageid = 16
    where value = 2 and streetid = 2;
    
update snumber
    set latitude = 55.495245, 
    longitude = 9.462087, 
    imageid = 17
    where value = 3 and streetid = 2;
    
update snumber
    set latitude = 55.494965, 
    longitude = 9.462420, 
    imageid = 18
    where value = 4 and streetid = 2;
        
update snumber
    set latitude = 55.495296, 
    longitude = 9.462501, 
    imageid = 19
    where value = 5 and streetid = 2;
        
update snumber
    set latitude = 55.495129, 
    longitude = 9.463123, 
    imageid = 20
    where value = 6 and streetid = 2;
        
update snumber
    set latitude = 55.495335, 
    longitude = 9.463061, 
    imageid = 21
    where value = 7 and streetid = 2;
        
update snumber
    set latitude = 55.496105, 
    longitude = 9.467064, 
    imageid = 22
    where value = 13 and streetid = 2;
        
update snumber
    set latitude = 55.496123, 
    longitude = 9.467520, 
    imageid = 23
    where value = 15 and streetid = 2;
        
update snumber
    set latitude = 55.496175, 
    longitude = 9.467886, 
    imageid = 24
    where value = 17 and streetid = 2;
        
update snumber
    set latitude = 55.495820, 
    longitude = 9.473731, 
    imageid = 25
    where value = 49 and streetid = 2;    
END;
/

--Kolding_Katrinegade 
DECLARE
    num_value NUMBER :=1;
    street_max_num_value NUMBER :=37;
    street_num NUMBER :=3;
BEGIN
    WHILE (num_value <= street_max_num_value) 
    LOOP
        insert into snumber (value, streetid) values (num_value, street_num);
        num_value:=num_value+1;
    END LOOP;
END;
/

--Kolding_Sydbanegade 
DECLARE
    num_value NUMBER :=1;
    street_max_num_value NUMBER :=30;
    street_num NUMBER :=10;
BEGIN
    WHILE (num_value <= street_max_num_value) 
    LOOP
        insert into snumber (value, streetid) values (num_value, street_num);
        num_value:=num_value+1;
    END LOOP;
END;
/

--Kolding_Bredgade
DECLARE
    num_value NUMBER :=1;
    street_max_num_value NUMBER :=32;
    street_num NUMBER :=11;
BEGIN
    WHILE (num_value <= street_max_num_value) 
    LOOP
        insert into snumber (value, streetid) values (num_value, street_num);
        num_value:=num_value+1;
    END LOOP;
END;
/

--Odense_Rugaardsvej
DECLARE
    num_value NUMBER :=1;
    street_max_num_value NUMBER :=251;
    street_num NUMBER :=15;
BEGIN
    WHILE (num_value <= street_max_num_value) 
    LOOP
        insert into snumber (value, streetid) values (num_value, street_num);
        num_value:=num_value+1;
    END LOOP;
END;
/
    
--Odense_Middelfartvej 
DECLARE
    num_value NUMBER :=1;
    street_max_num_value NUMBER :=226;
    street_num NUMBER :=17;
BEGIN
    WHILE (num_value <= street_max_num_value) 
    LOOP
        insert into snumber (value, streetid) values (num_value, street_num);
        num_value:=num_value+1;
    END LOOP;
END;
/

--Odense_Middelfartvej_coordinates_updates
BEGIN
update snumber
    set latitude = 55.393770, 
    longitude = 10.356628, 
    imageid = 26
    where value = 50 and streetid = 17;
    
update snumber
    set latitude = 55.394363, 
    longitude = 10.357005, 
    imageid = 27
    where value = 53 and streetid = 17;
    
update snumber
    set latitude = 55.394240, 
    longitude = 10.354235, 
    imageid = 28
    where value = 65 and streetid = 17;
    
update snumber
    set latitude = 55.394213, 
    longitude = 10.353615, 
    imageid = 29
    where value = 67 and streetid = 17;
    
update snumber
    set latitude = 55.394043, 
    longitude = 10.350662, 
    imageid = 30
    where value = 109 and streetid = 17;
    
update snumber
    set latitude = 55.394062, 
    longitude = 10.350804, 
    imageid = 31
    where value = 111 and streetid = 17;
    
update snumber
    set latitude = 55.394067, 
    longitude = 10.350269, 
    imageid = 32
    where value = 115 and streetid = 17;
    
update snumber
    set latitude = 55.393992, 
    longitude = 10.349649, 
    imageid = 33
    where value = 119 and streetid = 17;
    
update snumber
    set latitude = 55.393737, 
    longitude = 10.342744, 
    imageid = 34
    where value = 155 and streetid = 17;
    
update snumber
    set latitude = 55.393697, 
    longitude = 10.341334, 
    imageid = 35
    where value = 165 and streetid = 17;
    END;
/

--Odense_Roesskovsvej
DECLARE
    num_value NUMBER :=1;
    street_max_num_value NUMBER :=150;
    street_num NUMBER :=18;
BEGIN
    WHILE (num_value <= street_max_num_value) 
    LOOP
        insert into snumber (value, streetid) values (num_value, street_num);
        num_value:=num_value+1;
    END LOOP;
END;
/
    
------------------------------------- Fill table FLATPART ---------------------------------------

--Kolding_Haderslevvej
DECLARE
    flat_part_num NUMBER :=1;
    flat_part_max_num NUMBER :=5;
    building_num NUMBER :=22;
    street_id NUMBER :=1;
    building_id NUMBER;
BEGIN
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
    
    update flatpart set name = 'Idea Scum Studio' 
        where fnumber = 5 and numberid = building_id;
END;
/

DECLARE
    flat_part_num NUMBER :=1;
    flat_part_max_num NUMBER :=4;
    building_num NUMBER :=24;
    street_id NUMBER :=1;
    building_id NUMBER;
BEGIN
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
END;
/

DECLARE
    flat_part_num NUMBER :=1;
    flat_part_max_num NUMBER :=8;
    building_num NUMBER :=37;
    street_id NUMBER :=1;
    building_id NUMBER;
BEGIN
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
    
    update flatpart set name = 'Star Nails' 
        where fnumber = 7 and numberid = building_id;
        
    update flatpart set name = 'J BY J HairCutter' 
        where fnumber = 8 and numberid = building_id;
END;
/

DECLARE
    flat_part_num NUMBER :=1;
    flat_part_max_num NUMBER :=2;
    building_num NUMBER :=79;
    street_id NUMBER :=1;
    building_id NUMBER;
BEGIN
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
END;
/

DECLARE
    flat_part_num NUMBER :=1;
    flat_part_max_num NUMBER :=6;
    building_num NUMBER :=6;
    street_id NUMBER :=2;
    building_id NUMBER;
BEGIN
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
END;
/

DECLARE
    flat_part_num NUMBER :=1;
    flat_part_max_num NUMBER :=4;
    building_num NUMBER :=13;
    street_id NUMBER :=2;
    building_id NUMBER;
BEGIN
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
    
    flat_part_num :=1;
    building_num :=15;
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
    
    
    flat_part_num :=1;
    building_num :=17;
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
    
    --Odense_Middelfartvej
    flat_part_num :=1;
    flat_part_max_num :=8;
    building_num :=65;
    street_id :=17;
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
    
    flat_part_num :=1;
    building_num :=67;
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;
    
    flat_part_num :=1;
    flat_part_max_num :=18;
    building_num :=165;
    select id into building_id from snumber where value = building_num and streetid = street_id;
    
    WHILE (flat_part_num <= flat_part_max_num) 
    LOOP
        insert into flatpart (fnumber, name, numberid) values (flat_part_num, null, building_id);
        flat_part_num:=flat_part_num+1;
    END LOOP;    
END;
/

------------------------------------- Fill table ADDRESS ---------------------------------

--Kolding_Haderslevvej
DECLARE
    country_id NUMBER :=3;
    postcode_id NUMBER;
    town_id NUMBER;
    street_id NUMBER :=1;
    number_id NUMBER :=1;
    max_number_id NUMBER :=21;
    flat_part_id NUMBER :=1;
    max_flat_part_id NUMBER;
    flat_part_qty NUMBER;
    loop_start_num NUMBER;

BEGIN
   select postcodeid into postcode_id from street where id = street_id;
   select townid into town_id from street where id = street_id;
    
    WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
    
    number_id := 22;
    max_flat_part_id :=5;
    WHILE (flat_part_id <= max_flat_part_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        flat_part_id:=flat_part_id+1;
    END LOOP;
    
    number_id := 23;
    insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
            
    number_id := 24;
    loop_start_num:=1;
    flat_part_qty :=4;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP;
	
	
	number_id := 25;
	max_number_id :=36;
	WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
	
	number_id := 37;
    loop_start_num:=1;
    flat_part_qty :=8;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP;
	
	number_id := 38;
	max_number_id :=78;
	WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
	
	number_id := 79;
    loop_start_num:=1;
    flat_part_qty :=2;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP;
	
	number_id := 80;
	max_number_id :=189;
	WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
END;
/

--Kolding_Ndr_Ringvej
DECLARE
    country_id NUMBER :=3;
    postcode_id NUMBER;
    town_id NUMBER;
    street_id NUMBER :=2;
    number_id NUMBER :=190;
    max_number_id NUMBER :=194;
    flat_part_id NUMBER :=20;
    max_flat_part_id NUMBER;
    flat_part_qty NUMBER;
    loop_start_num NUMBER;

BEGIN
   select postcodeid into postcode_id from street where id = street_id;
   select townid into town_id from street where id = street_id;
    
    WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
    
    number_id := 195;
    loop_start_num:=1;
    flat_part_qty :=6;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP;
    
    number_id := 196;
	max_number_id :=201;
	WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
    
    number_id := 202;
    loop_start_num:=1;
    flat_part_qty :=4;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP;
    
    number_id := 203;
    insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        
    number_id := 204;
    loop_start_num:=1;
    flat_part_qty :=4;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP; 
    
    number_id := 205;
    insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
            
    number_id := 206;
    loop_start_num:=1;
    flat_part_qty :=4;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP;
    
    number_id := 207;
	max_number_id :=276;
	WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP; 
END;
/

--Kolding_Katrinegade_Sydbanegade_Bredgade
DECLARE
    country_id NUMBER :=3;
    postcode_id NUMBER;
    town_id NUMBER;
    street_id NUMBER :=3;
    number_id NUMBER :=277;
    max_number_id NUMBER :=313;
    
BEGIN
   select postcodeid into postcode_id from street where id = street_id;
   select townid into town_id from street where id = street_id;
    
    -- Katrinegade
    WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
    
    -- Sydbanegade
    street_id :=10;
    number_id :=314;
    max_number_id :=343;
    
    WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
    
    -- Bredgade
    street_id :=11;
    number_id :=344;
    max_number_id :=375;
    
    WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
END;
/

-- Odense_Rugaardsvej_Middelfartvej

DECLARE
    country_id NUMBER :=3;
    postcode_id NUMBER;
    town_id NUMBER;
    street_id NUMBER :=15;
    number_id NUMBER :=376;
    max_number_id NUMBER :=626;
    flat_part_id NUMBER :=38;
    max_flat_part_id NUMBER;
    flat_part_qty NUMBER;
    loop_start_num NUMBER;
    
BEGIN
   select postcodeid into postcode_id from street where id = street_id;
   select townid into town_id from street where id = street_id;
    
    -- Rugaardsvej
    WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP; 
    
     -- Middelfartvej
    street_id :=17;
    number_id :=627;
    max_number_id :=690;
    
    select postcodeid into postcode_id from street where id = street_id;
    
    WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
    
    number_id := 691;
    loop_start_num:=1;
    flat_part_qty :=8;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP;
    
    number_id := 692;
    insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
    
    number_id := 693;
    loop_start_num:=1;
    flat_part_qty :=8;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP;
    
    number_id := 694;
	max_number_id :=790;
	WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP; 
    
     number_id := 791;
    loop_start_num:=1;
    flat_part_qty :=18;
    WHILE (loop_start_num <= flat_part_qty) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,flat_part_id);
        loop_start_num:=loop_start_num+1;
        flat_part_id := flat_part_id+1;
    END LOOP;
    
    number_id := 792;
	max_number_id :=1002;
	WHILE (number_id <= max_number_id) 
    LOOP
        insert into address (countryid, postcodeid, townid, streetid, numberid, flatpartid) 
            values (country_id, postcode_id, town_id, street_id, number_id,null);
        number_id:=number_id+1;
    END LOOP;
END;
/

------------------------------------- Fill table SHAREHOLDERTYPE ---------------------------------

insert into shareholdertype (name) values ('Legal person');
insert into shareholdertype (name) values ('Private person');

------------------------------------- Fill table FARM ---------------------------------

insert into farm (name, addressid, imageid) values ('Anholt', 1, 1);
insert into farm (name, addressid, imageid) values ('Samsø', 67, 2);
insert into farm (name, addressid, imageid) values ('Frederikshavn', 100, 3);
insert into farm (name, addressid, imageid) values ('Middelgrunden', 101, 4);
insert into farm (name, addressid, imageid) values ('Vindeby', 102, 5);
insert into farm (name, addressid, imageid) values ('Dithmarschen', 215, 6);
insert into farm (name, addressid, imageid) values ('Wesselburen', 311, 7);
insert into farm (name, addressid, imageid) values ('Jammerland Bugt', 354, 8);
insert into farm (name, addressid, imageid) values ('Bedburg', 368, 9);
insert into farm (name, addressid, imageid) values ('Bergheim', 404, 10);
insert into farm (name, addressid, imageid) values ('Jülicher Börde', 547, 11);

------------------------------------- Fill table UNIT ---------------------------------

insert into unit (name) values ('kWh');
insert into unit (name) values ('kW');
insert into unit (name) values ('m');
insert into unit (name) values ('sq.m');
insert into unit (name) values ('km/h');
insert into unit (name) values ('m/s');
insert into unit (name) values ('°C');
insert into unit (name) values ('kg/cub.m');
insert into unit (name) values ('hour');

------------------------------------- Fill table WORKSTATE ---------------------------------

insert into workstate (name) values ('Run');
insert into workstate (name) values ('Stopped. Service');
insert into workstate (name) values ('Stopped. Cut-out');
insert into workstate (name) values ('Failed');
insert into workstate (name) values ('Ready. No wind');

------------------------------------- Fill table OPERATOR ---------------------------------

insert into operator (name, email, phone, website, addressid) 
    values ('Vattenfall A/S', 'kolding@vattenfall.com', '+4588275000','corporate.vattenfall.dk', 104);
    
insert into operator (name, email, phone, website, addressid) 
    values ('Orsted', 'info@orsted.com', '+4599551111','orsted.com', 265);
        
insert into operator (name, email, phone, website, addressid) 
    values ('Enercon', 'hamburg@enercon.com', '+4938413042210','enercon.de', 829);    
    
insert into operator (name, email, phone, website, addressid) 
    values ('WPD AG', 'info@wpd.de', '+494211686610','wpd.de', 869);
	
------------------------------------- Fill table MANUFACTURER ---------------------------------

insert into manufacturer (name, email, phone, website, addressid) 
    values ('Vestas', 'vestas@vestas.com', '+4597300000','vestas.com', 288);
    
insert into manufacturer (name, email, phone, website, addressid) 
    values ('Siemens Gamesa', 'info@gamesacorp.com', '+4904028890','siemensgamesa.com', 521 );
    
insert into manufacturer (name, email, phone, website, addressid) 
    values ('Nordex', 'info@nordex-online.com', '+4940300301000','nordex-online.com', 630);
    
insert into manufacturer (name, email, phone, website, addressid) 
    values ('Enercon', 'hamburg@enercon.com', '+4938413042210','enercon.de', 829);
    
------------------------------------- Fill table TURBINETYPE ---------------------------------

---- Vestas
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (1, 'V39/600', 600, 40.5, 39, 1195);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (1, 'V39/600', 600, 53, 39, 1195);

insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (1, 'V47/660', 660, 40, 47, 1735);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (1, 'V47/660', 660, 55, 47, 1735);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (1, 'V52/850', 850, 49, 52, 2124);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (1, 'V80/2000', 2000, 78, 80, 5027);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (1, 'V80/2000', 2000, 100, 80, 5027);
    
------Siemens Gamesa
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (2, 'SG 2.1-114', 2100, 106, 114, 10207);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (2, 'SG 2.1-114', 2100, 125, 114, 10207);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (2, 'SG 2.1-114', 2100, 153, 114, 10207);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (2, 'SG 2.6-126', 2625, 102, 126, 12469);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (2, 'SG 2.6-126', 2625, 137, 126, 12469);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (2, 'SG 2.6-126', 2625, 153, 126, 12469);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (2, 'SWT-DD-120', 3900, 85, 120, 11300);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (2, 'SWT-DD-120', 3900, 125, 120, 11300);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (2, 'SWT-DD-120', 3900, 155, 120, 11300);
    
-----Nordex     
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N43', 600, 49, 43, 1453);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N43', 600, 78, 43, 1453);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N50', 800, 46, 50, 1964);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N50', 800, 50, 50, 1964);

insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N50', 800, 70, 50, 1964);   
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N52', 800, 60, 52, 2125);    
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N52', 800, 70, 52, 2125);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N80', 2500, 80, 80, 5026);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N80', 2500, 100, 80, 5026);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (3, 'N80', 2500, 105, 80, 5026);
    
----- Enercon
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (4, 'E-32', 300, 34, 32, 804);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (4, 'E-44', 900, 45, 44, 1521);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (4, 'E-44', 900, 55, 44, 1521);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (4, 'E-66', 1500, 67, 66, 3421.2);
    
insert into turbinetype (manufacturerid, model, capacity, towerheight, rotordiameter, sweptarea) 
    values (4, 'E-66', 1500, 100, 66, 3421.2);


------------------------------------- Fill table APPUSER (not ready) --------------------------------- 

insert into appuser (email, passwordhash, securitystamp, phone, 
                    registerdt, lastlogindt, firstname, lastname,
                    wrongpasswordeffort, blocked, passwordmustbechanged, lifetimeforpassword)
    values ('test_email@com.dk', 'passHash', 'salt', '+4500000000', 
        to_date('01.01.2018', 'dd.mm.yyyy'), to_date('02.02.2018', 'dd.mm.yyyy'), 'firstName', 'lastName', 
        0,0,0,6);
        
-------------------------------------------- Commit ------------------------------------------------
commit;
