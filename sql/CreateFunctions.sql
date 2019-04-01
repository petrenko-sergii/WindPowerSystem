create or replace FUNCTION create_first_name 
    RETURN VARCHAR2
    IS 
    i number;
    type array_fisrtname is table of varchar2(100);
    array_fn array_fisrtname := array_fisrtname('Adam', 'Agnes', 'Aksel', 'Albert', 'Alberte', 'Alexander', 
        'Alfred', 'Alma', 'Anna', 'Anton', 'Arthur', 'August', 'Benjamin', 'Carl', 'Caroline', 'Christian', 
        'Clara', 'Elias', 'Ella', 'Ellen', 'Emil', 'Emilie', 'Emily', 'Felix', 'Filippa', 'Frederik', 'Freja', 
        'Frida', 'Ida', 'Isabella', 'Johan', 'Josefine', 'Julie', 'Karla', 'Laura', 'Lea', 'Liam', 'Liv', 'Liva', 
        'Lucas', 'Lærke', 'Mads', 'Magnus', 'Maja', 'Malthe', 'Marie', 'Mathias', 'Mathilde', 'Mikkel', 'Mille', 
        'Noah', 'Nohr', 'Nora', 'Oliver', 'Olivia', 'Oscar', 'Rosa', 'Sara', 'Sebastian', 'Signe', 'Sofia', 
        'Sofie', 'Storm', 'Theodor', 'Valdemar', 'Victor', 'Victoria', 'Vigga', 'Villads', 'William');
    
    BEGIN 
        i := dbms_random.value(1,array_fn.count);
    RETURN array_fn(i); 
END create_first_name;
/

create or replace FUNCTION create_last_name 
    RETURN VARCHAR2
    IS 
    i number;
    type array_lastname is table of varchar2(100);
    array_ln array_lastname := array_lastname('Andersen', 'Andreasen', 'Andresen', 'Bach', 'Bak', 'Bang', 'Bech', 
        'Berg', 'Bertelsen', 'Brandt', 'Bruun', 'Christensen', 'Christiansen', 'Christoffersen', 'Clausen', 'Dahl', 
        'Dam', 'Danielsen', 'Decksen', 'Eriksen', 'Frandsen', 'Frederiksen', 'Friis', 'Gregersen', 'Hansen', 'Henriksen', 
        'Hermansen', 'Holm', 'Holst', 'Iversen', 'Jacobsen', 'Jakobsen', 'Jensen', 'Jeppesen', 'Jepsen', 'Jespersen', 
        'Jessen', 'Joergensen', 'Johansen', 'Johnsen', 'Kjeldsen', 'Klausen', 'Knudsen', 'Koch', 'Kristensen', 
        'Kristiansen', 'Kristoffersen', 'Krogh', 'Kruse', 'Larsen', 'Lassen', 'Lauridsen', 'Lauritsen', 'Laursen', 
        'Lind', 'Lund', 'Madsen', 'Mathiasen', 'Mathiesen', 'Mikkelsen', 'Moeller', 'Mogensen', 'Mortensen', 'Nielsen', 
        'Nilsson', 'Nissen', 'Noergaard', 'Nygaard', 'Olsen', 'Overgaard', 'Paulsen', 'Pedersen', 'Petersen', 'Poulsen',
        'Rasmussen', 'Ravn', 'Schmidt', 'Schultz', 'Simonsen', 'Skov', 'Soerensen', 'Steffensen', 'Svendsen', 'Thomsen', 
        'Thorsen', 'Thygesen', 'Toft', 'Vestergaard', 'Winther');
    
    BEGIN 
        i := dbms_random.value(1,array_ln.count);
    RETURN array_ln(i); 
END create_last_name;
/

create or replace FUNCTION create_email (first_name IN VARCHAR2, last_name IN VARCHAR2) 
    RETURN VARCHAR2
    IS 
    i number;
    j number;
    email varchar2(100);
    type array_email is table of varchar2(10);
    array_em array_email := array_email('yahoo','gmail','mail');
    
    type array_domain is table of varchar2(10);
    array_do array_domain := array_domain('dk', 'com');
    
    BEGIN 
        i := dbms_random.value(1,array_em.count);
        j := dbms_random.value(1,array_do.count);
        
        email := LOWER(first_name || last_name || '@' || array_em(i) || '.' || array_do(j));
    RETURN email; 
END create_email;
/

create or replace FUNCTION create_phone_number 
    RETURN VARCHAR2
    IS 
    phone_num varchar2(200) := '';
    num_code varchar2(100) := '+45';
    digit_qty number := 8;

    BEGIN 
        for i in 1..digit_qty loop
            phone_num := phone_num || TO_CHAR(TRUNC(dbms_random.value(0,9),0));
         end loop;
        phone_num := num_code || phone_num;
    RETURN phone_num; 
END create_phone_number;
/

--------------------------------------- Commit ---------------------------------------

commit;
/

------------------------------- Print the log-message ---------------------------------

BEGIN
	DBMS_OUTPUT.PUT_LINE('****************************************************************');
	DBMS_OUTPUT.PUT_LINE('*********------------------------------------------*************');
	DBMS_OUTPUT.PUT_LINE('*********---- FUNCTIONS ARE CREATED SUCCESSFULLY -----**********');
	DBMS_OUTPUT.PUT_LINE('*********------------------------------------------*************');
	DBMS_OUTPUT.PUT_LINE('****************************************************************');
END;
/

 