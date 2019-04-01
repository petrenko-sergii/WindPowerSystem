------------------------------- Settings for output ---------------------------------
SET SERVEROUTPUT ON
SET LINESIZE 32767
SET HEADING ON
SET HEADSEP OFF
SET WRAP OFF


------------------------------------- Create table ADDRESSIMAGE ---------------------------------------
create table ADDRESSIMAGE                                                                                 
(                                                                                                          
   id         	NUMBER not null,  
   path         VARCHAR2(500 CHAR) not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table ADDRESSIMAGE is 'Address image pathes';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column ADDRESSIMAGE.id is 'Id';                                                                   
comment on column ADDRESSIMAGE.path is 'Path';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_addressimage on addressimage (id);                                             

alter table addressimage                                                                                
  add constraint pk_addressimage primary key (id) using index pk_addressimage;   
 
 
------------------------------------- Create table APPIMAGE ---------------------------------------
create table APPIMAGE                                                                                 
(                                                                                                          
   id         	NUMBER not null,  
   path         VARCHAR2(500 CHAR) not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table APPIMAGE is 'APP image pathes';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column APPIMAGE.id is 'Id';                                                                   
comment on column APPIMAGE.path is 'Path';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_appimage on appimage (id);                                             

alter table appimage                                                                                
  add constraint pk_appimage primary key (id) using index pk_appimage; 
  

------------------------------------- Create table COUNTRY ---------------------------------------
create table COUNTRY                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   name         VARCHAR2(200 CHAR) not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table COUNTRY is 'COUNTRY table' ;                                                       
                                                                                                     
-- Add comments to the columns                                                                             
comment on column COUNTRY.id is 'Id' ;                                                         
comment on column COUNTRY.name is 'Name' ;                                                                  
                                                                                                          
-- Create primary, unique key constraints                                                     
create unique index PK_COUNTRY ON COUNTRY (ID);

alter table country                                                                                
  add constraint PK_COUNTRY primary key (ID) using index PK_COUNTRY; 

------------------------------------- Create table TOWN ---------------------------------------
create table TOWN                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   name         VARCHAR2(200 CHAR) not null,
   countryid   	NUMBER not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table TOWN is 'TOWN table';                                                        
                                                                                                         
-- Add comments to the columns                                                                             
comment on column TOWN.id is 'Id';                                                                   
comment on column TOWN.name is 'Name';                                                                   
comment on column TOWN.countryid is 'Country id';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                       
create unique index pk_town on town (id);                                             
                                                                                                       
alter table town                                                                                
  add constraint pk_town primary key (id) using index pk_town;                            

alter table town
  add constraint fk_town_country foreign key (countryid) references country (id);
  
  
------------------------------------- Create table INDEX ---------------------------------------
create table POSTCODE                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   value        VARCHAR2(100 CHAR) not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table POSTCODE is 'Index table';                                                    
                                                                                                          
-- Add comments to the columns                                                                             
comment on column POSTCODE.id is 'Id';                                                                   
comment on column POSTCODE.value is 'Value';                                                                   
                                                                                                           
-- Create primary, unique key constraints                                                      
create unique index pk_postcode on postcode (id);                                             
                                                                                                       
alter table postcode                                                                                
  add constraint pk_postcode primary key (id) using index pk_postcode;
  
------------------------------------- Create table STREET ---------------------------------------
create table STREET                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   name         VARCHAR2(200 CHAR) not null,
   townid   	NUMBER not null,
   postcodeid   NUMBER not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table STREET is 'STREET table';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column STREET.id is 'Id';                                                                   
comment on column STREET.name is 'Name';                                                                   
comment on column STREET.townid is 'Town id';                                                                   
comment on column STREET.postcodeid is 'Index id';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_street on street (id); 
                                            
alter table street                                                                                
  add constraint pk_street primary key (id) using index pk_street;                            

alter table street
  add constraint fk_street_town foreign key (townid) references town (id);

alter table street
  add constraint fk_street_postcode foreign key (postcodeid) references postcode (id);

  
------------------------------------- Create table STREET NUMBER ---------------------------------------
create table SNUMBER                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   value        VARCHAR2(200 CHAR) not null,
   latitude     NUMBER(9,6),
   longitude    NUMBER(9,6),
   streetid   	NUMBER not null,
   imageid    	NUMBER
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table SNUMBER is 'Street number table';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column SNUMBER.id is 'Id';                                                                   
comment on column SNUMBER.value is 'Value';                                                                   
comment on column SNUMBER.latitude is 'Latitude';
comment on column SNUMBER.latitude is 'Longitude';                                                                    
comment on column SNUMBER.streetid is 'Street id';                                                                   
comment on column SNUMBER.imageid is 'Image id';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_snumber on snumber (id);                                             
                                                                                                       
alter table snumber                                                                                
  add constraint pk_snumber primary key (id) using index pk_snumber;                            

alter table snumber
  add constraint fk_snumber_street foreign key (streetid) references street (id);

alter table snumber
  add constraint fk_snumber_addressimage foreign key (imageid) references addressimage (id);
  
------------------------------------- Create table FLATPART ---------------------------------------
create table FLATPART                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   fnumber      NUMBER(10) not null, 
   name         VARCHAR2(200 CHAR),
   numberid   	NUMBER not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table FLATPART is 'FLATPART table';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column FLATPART.id is 'Id';  
comment on column FLATPART.fnumber is 'Flat number';                                                         
comment on column FLATPART.name is 'Part name';                                                                   
comment on column FLATPART.numberid is 'Street number id';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_flatpart on flatpart (id); 
                                            
alter table flatpart                                                                                
  add constraint pk_flatpart primary key (id) using index pk_flatpart;                            

alter table flatpart
  add constraint fk_flatpart_number foreign key (numberid) references snumber (id);
  
------------------------------------- Create table ADDRESS ---------------------------------------
create table ADDRESS                                                                                  
(                                                                                                          
   id         	NUMBER not null, 
   countryid   	NUMBER not null,   
   postcodeid   NUMBER not null,
   townid   	NUMBER not null,
   streetid   	NUMBER not null,
   numberid   	NUMBER not null,
   flatpartid   NUMBER 
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table ADDRESS is 'ADDRESS table';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column ADDRESS.id is 'Id';                                                                   
comment on column ADDRESS.countryid is 'Country id';                                                                   
comment on column ADDRESS.postcodeid is 'Index id';                                                                   
comment on column ADDRESS.townid is 'Town id';
comment on column ADDRESS.streetid is 'Street id';
comment on column ADDRESS.numberid is 'Number id'; 
comment on column ADDRESS.flatpartid is 'Flat/Part id';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_address on address (id); 
                                            
alter table address                                                                                
  add constraint pk_address primary key (id) using index pk_address;                            

alter table address
  add constraint fk_address_country foreign key (countryid) references country (id);
  
alter table address
  add constraint fk_address_postcode foreign key (postcodeid) references postcode (id);

alter table address
  add constraint fk_address_town foreign key (townid) references town (id);

alter table address
  add constraint fk_address_street foreign key (streetid) references street (id);

alter table address
  add constraint fk_address_number foreign key (numberid) references snumber (id);
  
alter table address
  add constraint fk_address_flatpart foreign key (flatpartid) references flatpart (id);

  
------------------------------------- Create table SHAREHOLDERTYPE ---------------------------------------
create table SHAREHOLDERTYPE                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   name         VARCHAR2(200 CHAR) not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table SHAREHOLDERTYPE is 'Share holder type: private or legal pesron';                                                    
                                                                                                     
-- Add comments to the columns                                                                             
comment on column SHAREHOLDERTYPE.id is 'Id';                                                                
comment on column SHAREHOLDERTYPE.name is 'Name';                                                                   
                                                                                                            
-- Create primary, unique key constraints                                                       
create unique index pk_shareholdertype on shareholdertype (id);                                             
                                                                                                     
alter table shareholdertype                                                                                
  add constraint pk_shareholdertype primary key (id) using index pk_shareholdertype; 
  
------------------------------------- Create table SHAREHOLDER ---------------------------------------

create table SHAREHOLDER                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   firstname    VARCHAR2(200 CHAR) not null,
   lastname     VARCHAR2(200 CHAR),
   email  		VARCHAR2(200 CHAR) not null,
   phone  		VARCHAR2(200 CHAR) not null,
   addressid   	NUMBER not null,
   typeid   	NUMBER not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table SHAREHOLDER is 'Share holder table';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column SHAREHOLDER.id is 'Id';                                                                  
comment on column SHAREHOLDER.firstname is 'First name';                                                                   
comment on column SHAREHOLDER.lastname is 'Last name';                                                                   
comment on column SHAREHOLDER.email is 'Email';                                                                   
comment on column SHAREHOLDER.phone is 'Phone number';                                                                   
comment on column SHAREHOLDER.addressid is 'Address id';                                                                   
comment on column SHAREHOLDER.typeid is 'Type id';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_shareholder on shareholder (id);                                             
                                                                                                       
alter table shareholder                                                                                
  add constraint pk_shareholder primary key (id) using index pk_shareholder;                            

alter table shareholder
  add constraint fk_shareholder_address foreign key (addressid) references address (id);

alter table shareholder
  add constraint fk_shareholder_type foreign key (typeid) references shareholdertype (id);
 
 
 ------------------------------------- Create table FARM ---------------------------------------

create table FARM                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   name         VARCHAR2(200 CHAR) not null,
   addressid   	NUMBER not null,
   imageid    	NUMBER
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table FARM is 'Wind turbine farm';                                                       
                                                                                                       
-- Add comments to the columns                                                                             
comment on column FARM.id is 'Id' ;                                                                  
comment on column FARM.name is 'Name';                                                                   
comment on column FARM.addressid is 'Address id';                                                                   
comment on column FARM.imageid is 'Image id';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_farm on farm (id);                                             

alter table farm                                                                                
  add constraint pk_farm primary key (id) using index pk_farm;                           

alter table farm
  add constraint fk_farm_address foreign key (addressid) references address (id);

alter table farm
  add constraint fk_farm_image foreign key (imageid) references appimage(id);
    
  
------------------------------------- Create table UNIT ---------------------------------------
create table UNIT                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   name         VARCHAR2(200 CHAR) not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table UNIT is 'UNIT table';                                                        
                                                                                                        
-- Add comments to the columns                                                                             
comment on column UNIT.id is 'Id';                                                                   
comment on column UNIT.name is 'Name';                                                                   
                                                                                                           
-- Create primary, unique key constraints                                                       
create unique index pk_unit on unit (id);                                             
                                                                                                      
alter table unit                                                                                
  add constraint pk_unit primary key (id) using index pk_unit;   

------------------------------------- Create table WORKSTATE ---------------------------------------
create table WORKSTATE                                                                                  
(                                                                                                          
   id         	NUMBER not null,   
   name         VARCHAR2(100 CHAR) not null      
); 
commit;
                                                                                                           
-- Add comment to the table                                                                                
comment on table WORKSTATE is 'Turbine working state table';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column WORKSTATE.id is 'Id';                                                                   
comment on column WORKSTATE.name is 'Turbine working status state';                                                                  
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_state on workstate (id);                                             
                                                                                                       
alter table workstate                                                                                
  add constraint pk_state primary key (id) using index pk_state;   

------------------------------------- Create table OPERATOR ---------------------------------------
create table OPERATOR                                                                                  
(                                                                                                          
   id         	NUMBER not null,  
   name         VARCHAR2(200 CHAR) not null,
   email  		VARCHAR2(200 CHAR),
   phone  		VARCHAR2(200 CHAR),
   website 		VARCHAR2(200 CHAR),
   addressid   	NUMBER not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table OPERATOR is 'Operator company table';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column OPERATOR.id is 'Id';                                                                   
comment on column OPERATOR.name is 'Name';                                                                   
comment on column OPERATOR.email is 'Email';                                                                   
comment on column OPERATOR.phone is 'Phone number'; 
comment on column OPERATOR.website is 'Web site';                                                                   
comment on column OPERATOR.addressid is 'Address id';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_operator on operator (id);                                             
                                                                                                       
alter table operator                                                                                
  add constraint pk_operator primary key (id) using index pk_operator;                            

alter table operator
  add constraint fk_operator_address foreign key (addressid) references address (id); 
  
------------------------------------- Create table TURBINETYPE --------------------------------------------
create table TURBINETYPE                                                                                   
(                                                                                                          
   id         		NUMBER not null,                                                                       
   manufacturername VARCHAR2(200 CHAR) not null,                                                                    
   model 			VARCHAR2(200 CHAR) not null,                                                                    
   capacity 		NUMBER(10) not null,                                                                            
   towerheight     	NUMBER(10)not null,                                                                            
   rotordiameter    NUMBER(10) not null,
   sweptarea   		NUMBER(10) not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table TURBINETYPE is 'Wind turbine types table';                                                        
                                                                                                       
-- Add comments to the columns                                                                             
comment on column TURBINETYPE.id is 'Id';                                                                   
comment on column TURBINETYPE.manufacturername is 'Manufacturer name';                                      
comment on column TURBINETYPE.model is 'Model';  
comment on column TURBINETYPE.capacity is 'Capacity, kW';                                                           
comment on column TURBINETYPE.towerheight is 'Tower height, m';                                                
comment on column TURBINETYPE.rotordiameter is 'Rotor diameter, m'; 
comment on column TURBINETYPE.sweptarea is 'Swept area, sq.m';                                            
                                                                                                           
-- Create primary, unique key constraints                                                      
create unique index pk_turbinetype on turbinetype (id);                                             
                                                                                                       
alter table turbinetype                                                                                
  add constraint pk_turbinetype primary key (id) using index pk_turbinetype; 

------------------------------------- Create table TURBINE ------------------------------------------------

create table TURBINE
(
   id         		NUMBER not null,
   serialnum        VARCHAR2(40 CHAR),
   installdt    	DATE not null,
   prodmw       	NUMBER not null,
   cost         	NUMBER(10) not null,
   installcost  	NUMBER(10) not null,
   turbinetypeid    NUMBER not null,
   operatorid       NUMBER not null,
   farmid    		NUMBER,
   addressid   		NUMBER not null,
   imageid    		NUMBER,
   lastservdt		DATE not null,
   nextservdt		DATE not null,
   lastyearservdt	DATE not null,
   nextyearservdt	DATE not null
);

-- Add comment to the table 
comment on table TURBINE is 'Wind turbine table';

-- Add comments to the columns 
comment on column TURBINE.id is 'Id';
comment on column TURBINE.serialnum is 'Serial number';
comment on column TURBINE.installdt is 'Install date';
comment on column TURBINE.prodmw is 'Produced energy (MW)';
comment on column TURBINE.cost is 'Cost';
comment on column TURBINE.installcost is 'Install cost';
comment on column TURBINE.turbinetypeid is 'Type id';
comment on column TURBINE.operatorid is 'Operator company id';
comment on column TURBINE.farmid is 'Farm id';
comment on column TURBINE.addressid is 'Address id';
comment on column TURBINE.imageid is 'Image id';
comment on column TURBINE.lastservdt is 'Last service date';
comment on column TURBINE.nextservdt is 'Next service date';
comment on column TURBINE.lastyearservdt is 'Last year service date';
comment on column TURBINE.nextyearservdt is 'Next year service date';
  
-- Create primary, unique and foreign key constraints 
create unique index pk_turbine on turbine (id);

alter table turbine 
  add constraint pk_turbine primary key (id) using index pk_turbine;

alter table turbine
  add constraint fk_turbine_turbinetype foreign key (turbinetypeid) references turbinetype (id);

alter table turbine
  add constraint fk_turbine_operator foreign key (operatorid) references operator (id);

alter table turbine
  add constraint fk_turbine_farm foreign key (farmid) references farm (id);

alter table turbine
  add constraint fk_turbine_address foreign key (addressid) references address (id);

alter table turbine
  add constraint fk_turbine_image foreign key (imageid) references appimage (id);
  
  
------------------------------------- Create table STOCKSHARE ---------------------------------------

create table STOCKSHARE                                                                                  
(                                                                                                          
   id         		NUMBER not null, 
   turbineid   		NUMBER,
   farmid   		NUMBER,
   shareholderid    NUMBER not null,
   percent      	NUMBER(10) not null,
   price        	NUMBER not null,
   purchasedt 		DATE not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table STOCKSHARE is 'Share table (stores data about turbine/farm shareholders)';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column STOCKSHARE.id is 'Id';                                                                   
comment on column STOCKSHARE.turbineid is 'Turbine id';                                                                   
comment on column STOCKSHARE.farmid is 'Turbine farm id';                                                                   
comment on column STOCKSHARE.shareholderid is 'Share holder id';                                                                   
comment on column STOCKSHARE.percent is 'Share percent(%)';                                                                   
comment on column STOCKSHARE.price is 'Price (euro)';                                                                   
comment on column STOCKSHARE.purchasedt is 'Purchase date';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_stockshare on stockshare (id);                                             
                                                                                                       
alter table stockshare                                                                                
  add constraint pk_stockshare primary key (id) using index pk_stockshare;                            

alter table stockshare
  add constraint fk_stockshare_turbine foreign key (turbineid) references turbine (id);

alter table stockshare
  add constraint fk_stockshare_farm foreign key (farmid) references farm (id);

alter table stockshare
  add constraint fk_stockshare_holder foreign key (shareholderid) references shareholder (id);
  
  
------------------------------------- Create table METERITEM ---------------------------------------
create table METERITEM                                                                                  
(                                                                                                          
   id         	NUMBER not null, 
   turbineid   	NUMBER not null,
   measuredt	DATE not null,
   mvalue     NUMBER not null,
   hourqty      NUMBER not null,
   averWind     NUMBER not null,
   averDensity  NUMBER not null
);                                                                                                          
                                                                                                           
-- Add comment to the table                                                                                
comment on table METERITEM is 'METERITEM table (stores data about produced energy by a turbine)';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column METERITEM.id is 'Id';                                                                   
comment on column METERITEM.turbineid is 'Turbine id';                                                                   
comment on column METERITEM.measuredt is 'Measure date and time';                                                                   
comment on column METERITEM.mvalue is 'Current produced energy (kW)';                                                                   
comment on column METERITEM.hourqty is 'Turbine working hour quantity per day';                                                                   
comment on column METERITEM.averWind is 'Average wind power per day';                                                                   
comment on column METERITEM.averDensity is 'Average air density per day';                                                                   
                                                                                                           
-- Create primary, unique and foreign key constraints                                                      
create unique index pk_meteritem on meteritem (id);                                             
                                                                                                       
alter table meteritem                                                                                
  add constraint pk_meteritem primary key (id) using index pk_meteritem ;                           

alter table meteritem
  add constraint fk_meteritem_turbine foreign key (turbineid) references turbine (id);
  
  
------------------------------------- Create table APPUSER ---------------------------------------
create table APPUSER                                                                                  
(                                                                                                          
   id         	            raw(32) default sys_guid() not null, 
   email                    VARCHAR2(200 CHAR) not null,
   passwordhash             VARCHAR2(200 CHAR) not null,
   securitystamp	        VARCHAR2(200 CHAR) not null,
   phone  		            VARCHAR2(200 CHAR) not null,
   registerdt		        DATE not null,
   lastlogindt		        DATE not null,
   firstname		        VARCHAR2(200 CHAR) not null,
   lastname			        VARCHAR2(200 CHAR) not null,
   wrongpasswordeffort      NUMBER(1) not null,
   blocked                  NUMBER(1) not null,
   passwordmustbechanged    NUMBER(1) not null,
   lifetimeforpassword      NUMBER(1) default 6 not null
);                                                                                                   
                                                                                                           
-- Add comment to the table                                                                                
comment on table APPUSER is 'User table for logging in';                                                        
                                                                                                          
-- Add comments to the columns                                                                             
comment on column APPUSER.id is 'Id';     
comment on column APPUSER.email is 'Email';                                                              
comment on column APPUSER.passwordhash is 'Password and SecurityStamp hash sum';                                                              
comment on column APPUSER.securitystamp is 'SecurityStamp';                                                              
comment on column APPUSER.phone is 'Pnone';                                                              
comment on column APPUSER.registerdt is 'Register date';                                                              
comment on column APPUSER.lastlogindt is 'Last logged in date';                                                              
comment on column APPUSER.firstname is 'First name';                                                              
comment on column APPUSER.lastname is 'Last name'; 
comment on column APPUSER.wrongpasswordeffort is 'Wrong password effort (quantity)';                                                             
comment on column APPUSER.blocked is 'User is bloked';                                                             
comment on column APPUSER.passwordmustbechanged is 'Password must be changed';                                                             
comment on column APPUSER.lifetimeforpassword is 'Lifetime for password (6 monthes by default)'; 

-- Create primary, unique and foreign key constraints                                                      
create unique index pk_appuser on appuser (id);                                             
                                                                                                       
alter table appuser                                                                                
  add constraint pk_appuser primary key (id) using index pk_appuser ;                                                              
                                                                  
                                                                                                           
--------------------------------------- Commit ---------------------------------------

commit;

------------------------------- Print the log-message ---------------------------------

BEGIN
	DBMS_OUTPUT.PUT_LINE('****************************************************************');
	DBMS_OUTPUT.PUT_LINE('*********------------------------------------------*************');
	DBMS_OUTPUT.PUT_LINE('*********---- TABLES ARE CREATED SUCCESSFULLY -----*************');
	DBMS_OUTPUT.PUT_LINE('*********------------------------------------------*************');
	DBMS_OUTPUT.PUT_LINE('****************************************************************');
END;
/

