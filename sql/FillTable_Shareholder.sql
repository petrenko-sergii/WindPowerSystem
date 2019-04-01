------------------------------------- Fill table SHAREHOLDER ---------------------------------

declare 
    i_address number;
    j_address number;
    i_first_name varchar2(100);
    i_last_name varchar2(100);
begin
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Marios Pizza', 'mariopp@com.dk', create_phone_number(), 10, 1);     
       
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Sonja Rosing Massage', 'sonjarosing@rose.dk', create_phone_number(), 12, 1);   
    
    i_address := 22;
    j_address := 25;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop;  
   
   insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Idea Scum Studio', 'ideascum@com.dk', create_phone_number(), 26, 1); 
        
    i_address := 28;
    j_address := 31;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop; 
   
    i_address := 44;
    j_address := 49;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop; 
   
   insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Star Nails', 'starnails@com.dk', create_phone_number(), 50, 1);
        
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('J BY J HairCutter', 'jbyj@mail.com', create_phone_number(), 51, 1);
        
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Sanistaal S Company', 'office@sscom.dk', create_phone_number(), 90, 1);
        
    i_address := 93;
    j_address := 94;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop;
   
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Premier', 'kolding@premier.dk', create_phone_number(), 104, 1);
        
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Aldi', 'kolding@aldi.dk', create_phone_number(), 115, 1);
        
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Shell', 'kolding@shell.dk', create_phone_number(), 117, 1);
        
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Fakta', 'kolding@fakta.dk', create_phone_number(), 119, 1);
        
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Longso Biler', 'longso@biler.dk', create_phone_number(), 132, 1);
        
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Q8', 'q8kolding@petrol.dk', create_phone_number(), 135, 1);
        
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Netto', 'kolding@netto.dk', create_phone_number(), 139, 1);
        
    i_address := 205;
    i_first_name := create_first_name();
    i_last_name := create_last_name();
    
    insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
    
     insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Lejerbo A/S', 'lejerbo@mail.dk', create_phone_number(), 206, 1);
        
    i_address := 207;
    i_first_name := create_first_name();
    i_last_name := create_last_name();
    
    insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
            
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Christensen Company', 'christensen_kolding@mail.dk', create_phone_number(), 208, 2);
        
    i_address := 209;
    i_first_name := create_first_name();
    i_last_name := create_last_name();
    
    insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
            
    i_address := 210;
    j_address := 214;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop;  
   
    i_address := 216;
    i_first_name := create_first_name();
    i_last_name := create_last_name();
    
    insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2);
            
    i_address := 222;
    j_address := 225;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop;
   
    i_address := 227;
    j_address := 230;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop;
   
   i_address := 232;
    j_address := 235;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop;
   
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Jens Jacobsen AutoVaerksted', 'jensjacobsenr@yahoo.dk', create_phone_number(), 267, 1);
        
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Audi Centre', 'odense@audi.dk', create_phone_number(), 705, 1);
            
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Statoil', 'odensemdfvej@statoil.dk', create_phone_number(), 708, 1);
        
    i_address := 720;
    j_address := 727;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop;  
   
    i_address := 729;
    j_address := 736;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop;
   
    i_address := 778;
    i_first_name := create_first_name();
    i_last_name := create_last_name();
    
    insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2);
    
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Unik Haarmode', 'unikhaarmoder@yahoo.dk', create_phone_number(), 780, 1);        
      
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Dame Herre', 'dameherre@yahoo.dk', create_phone_number(), 784, 1);        
      
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Fotex', 'odense@fotex.dk', create_phone_number(), 788, 1);        
      
    insert into shareholder (firstname, email, phone, addressid, typeid) 
        values ('Lund`b', 'lundsodense@mail.dk', create_phone_number(), 824, 1);        
      
    i_address := 834;
    j_address := 851;
    for i in i_address..j_address loop
        i_first_name := create_first_name();
        i_last_name := create_last_name();
        insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
            values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), i_address, 2); 
        i_address := i_address + 1;
   end loop;        
end;
/  
  
declare
    i_first_name varchar2(100);
    i_last_name varchar2(100);
    a_exist number;
    
    type NumVarrayU is varray(5000) of NUMERIC;
    used_address_ids NumVarrayU;  
  
    type NumVarrayA is varray(5000) of NUMERIC;
    all_address_ids NumVarrayA;
begin
    select ADDRESSID BULK COLLECT into used_address_ids from shareholder;
    select id BULK COLLECT into all_address_ids from address;

    FOR i IN 1..all_address_ids.COUNT LOOP
        a_exist := 0;
        FOR j IN 1..used_address_ids.COUNT LOOP
            if all_address_ids(i) = used_address_ids(j) and a_exist <> 1 then
                a_exist := 1;
            end if;
        END LOOP;
        if a_exist = 0 then
            i_first_name := create_first_name();
            i_last_name := create_last_name();
            
            insert into shareholder (firstname, lastname, email, phone, addressid, typeid) 
                values (i_first_name, i_last_name, create_email(i_first_name,i_last_name), create_phone_number(), all_address_ids(i), 2);
        end if;
    END LOOP;
end;
/

-------------------------------------------- Commit ------------------------------------------------
commit;
