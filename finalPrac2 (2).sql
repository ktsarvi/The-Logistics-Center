set serveroutput on;

drop type Planner force;
drop type planner_table force;
drop table Planners force;

-- Creating Planner object
CREATE OR REPLACE TYPE Planner AS OBJECT 
(plannerName varchar2(150), 
 plannerID number, 
 plannerPhoneNum number,
 MEMBER PROCEDURE  calcWeight,
 MEMBER PROCEDURE calcStoretime,
 MEMBER PROCEDURE calcRoutes
);



-- Creating type 
create type planner_table as table of planner;

-- Creating table for Planner object 
Create table Planners of Planner(
plannerID PRIMARY KEY);


--Insert functions
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Nina Garcia', 1, 1234567890);
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Ethan Reed', 2, 2345678901);
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Gwen Davis', 3, 3456789012);
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Liam Jones', 4, 4567890123);
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Samantha Williams', 5, 5678901234);
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Oliver Thompson', 6, 6789012345);
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Emily Anderson', 7, 7890123456);
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Jacob Jackson', 8, 8901234567);
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Ava Taylor', 9, 9012345678);
INSERT INTO Planners (plannerName, plannerID, plannerPhoneNum) VALUES ('Isabella Brown', 10, 0123456789);






drop type Manufacturer force;
drop table Manufacturers force;

--Creating Manufacturer object 
CREATE OR REPLACE TYPE Manufacturer AS OBJECT 
(manufName varchar2(150), 
 manufID number, 
 manufWebSite varchar2(150),
 manufPhoneNumb number,
 MEMBER PROCEDURE update_website(new_website varchar2)
); 

--Creating table for Manufacturer object
Create table Manufacturers of Manufacturer(
manufID PRIMARY KEY);



INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('Acme Inc.', 1, 'www.acme.com', 1234567890);
INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('XYZ Corp.', 2, 'www.xyzcorp.com', 2345678901);
INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('ABC Enterprises', 3, 'www.abcenterprises.com', 3456789012);
INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('Def Tech', 4, 'www.deftech.com', 4567890123);
INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('GHI Industries', 5, 'www.ghiindustries.com', 5678901234);
INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('JKL Solutions', 6, 'www.jklsolutions.com', 6789012345);
INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('MNO Industries', 7, 'www.mnoindustries.com', 7890123456);
INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('PQR Inc.', 8, 'www.pqrinc.com', 8901234567);
INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('STU Enterprises', 9, 'www.stuenterprises.com', 9012345678);
INSERT INTO Manufacturers (manufName, manufID, manufWebSite, manufPhoneNumb) VALUES ('VWX Corp.', 10, 'www.vwxcorp.com', 0123456789);


drop type SmallBuisness force;
drop table SmallBuisnesses;

--Creating SmallBuisness object
CREATE OR REPLACE TYPE SmallBuisness AS OBJECT 
(
  buisName varchar2(150), 
  buisID number, 
  buisWebSite varchar2(150),
  buisPhoneNum number,
  MEMBER PROCEDURE sendDatabaseRequest(p_request IN VARCHAR2)
);



-- Creating table for the SmallBuisness object
Create table SmallBuisnesses of SmallBuisness(
buisID PRIMARY KEY);

-- Insert functions 

INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('Acme Inc.', 1, 'www.acme.com', 1234567890);
INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('XYZ Corp.', 2, 'www.xyzcorp.com', 2345678901);
INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('ABC Enterprises', 3, 'www.abcenterprises.com', 3456789012);
INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('Def Tech', 4, 'www.deftech.com', 4567890123);
INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('GHI Industries', 5, 'www.ghiindustries.com', 5678901234);
INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('JKL Solutions', 6, 'www.jklsolutions.com', 6789012345);
INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('MNO Industries', 7, 'www.mnoindustries.com', 7890123456);
INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('PQR Inc.', 8, 'www.pqrinc.com', 8901234567);
INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('STU Enterprises', 9, 'www.stuenterprises.com', 9012345678);
INSERT INTO SmallBuisnesses (buisName, buisID, buisWebSite, buisPhoneNum) VALUES ('VWX Corp.', 10, 'www.vwxcorp.com', 0123456789);


drop table ManufItem force;

-- Creating ManufItem table
CREATE  table  ManufItem  ( 
manufIttemName varchar2(150), 
 manufIttemID number, 
 volumee number,
 weight number,
 dataArrived date,
 executive planner_table)
 NESTED TABLE executive STORE AS 
 Nested_planner_table;




-- Insert functions
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 1', 1, 10, 5, TO_DATE('01-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Nina Garcia', 1, 1234567890)));
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 2', 2, 20, 10, TO_DATE('02-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Ethan Reed', 2, 2345678901)));
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 3', 3, 30, 15, TO_DATE('03-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Gwen Davis', 3, 3456789012)));
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 4', 4, 40, 20, TO_DATE('04-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Liam Jones', 4, 4567890123)));
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 5', 5, 50, 25, TO_DATE('05-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Samantha Williams', 5, 5678901234)));
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 6', 6, 60, 30, TO_DATE('06-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Oliver Thompson', 6, 6789012345)));
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 7', 7, 70, 35, TO_DATE('07-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Emily Anderson', 7, 7890123456)));
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 8', 8, 80, 40, TO_DATE('08-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Jacob Jackson', 8, 8901234567)));
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 9', 9, 90, 45, TO_DATE('09-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Ava Taylor', 9, 9012345678)));
INSERT INTO ManufItem (manufIttemName, manufIttemID, volumee, weight, dataArrived, executive)
VALUES ('Item 10', 10, 100, 50, TO_DATE('10-01-2022','DD-MM-YYYY'),
    planner_table(Planner('Isabella Brown', 10, 0123456789)));
    

drop table LogisticsApplication force;

-- Creating LogisticsApplication table 

CREATE table LogisticsApplication
(manufItemDesc varchar2(150), 
manufacturerr REF Manufacturer, 
domainName varchar2(10)
);

--Insert functions
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Widget A', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 1), 'Widget');
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Widget B', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 2), 'Widget');
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Gadget C', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 1), 'Gadget');
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Gadget D', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 3), 'Gadget');
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Part E', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 2), 'Part');
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Part F', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 1), 'Part');
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Component G', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 3), 'Component');
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Component H', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 2), 'Component');
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Device I', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 1), 'Device');
INSERT INTO LogisticsApplication (manufItemDesc, manufacturerr, domainName) VALUES ('Device J', (SELECT REF(m) FROM Manufacturers m WHERE m.manufID = 3), 'Device');


drop type Truck force;
drop table Trucks force;

-- Creating Truck objects
CREATE OR REPLACE TYPE Truck AS OBJECT 
(truckID number, 
maxWeight number, 
maxVolume number,
driver varchar(150),
MAP MEMBER FUNCTION density RETURN NUMBER,
MEMBER PROCEDURE ifWeightIsNotTooHigh
);


-- Creating table for the Truck object
Create table Trucks of Truck(
truckID PRIMARY KEY);

--Insert functions

INSERT INTO Trucks VALUES (Truck(1, 10000, 100, 'Ahmed Ali'));
INSERT INTO Trucks VALUES (Truck(2, 12000, 120, 'Sami Hassan'));
INSERT INTO Trucks VALUES (Truck(3, 11000, 110, 'Fatima Khan'));
INSERT INTO Trucks VALUES (Truck(4, 9000, 90, 'Mustafa Saleh'));
INSERT INTO Trucks VALUES (Truck(5, 8000, 80, 'Noor Al-Fayez'));
INSERT INTO Trucks VALUES (Truck(6, 7000, 70, 'Rashid Muhammad'));
INSERT INTO Trucks VALUES (Truck(7, 6000, 60, 'Lena Ibrahim'));
INSERT INTO Trucks VALUES (Truck(8, 5000, 50, 'Karim Abbas'));
INSERT INTO Trucks VALUES (Truck(9, 4000, 40, 'Leila Hassan'));
INSERT INTO Trucks VALUES (Truck(10, 3000, 30, 'Tariq Nazir'));



drop table Mechanic force;

--Creating table Mechanic
CREATE table Mechanic 
(mechanicName varchar(150), 
mechanicID number, 
Truckk  REF Truck
);


-- Insert functions 
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('John', 1, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 1));
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('Jane', 2, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 2));
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('Bob', 3, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 3));
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('Sue', 4, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 4));
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('Mike', 5, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 5));
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('Linda', 6, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 6));
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('Tom', 7, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 7));
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('Alice', 8, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 8));
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('Peter', 9, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 9));
INSERT INTO Mechanic (mechanicName, mechanicID, Truckk) VALUES 
('Alex', 10, (SELECT REF(T) FROM Trucks T WHERE T.truckID = 10));



-----------------------------------------------------------------------------------

--DEREF queries: 




--1)This query retrieves the website of the manufacturer for a given logistics application, based on the manufacturerr column:
--For example Widget A or Widget B``

SELECT DEREF(l.manufacturerr).manufWebSite
FROM LogisticsApplication l
WHERE l.manufItemDesc = :manufItemDesc;



--2)This query will return the names of the mechanics in the Mechanic table 
--and the names of the drivers 
--for the trucks that are associated with each mechanic, 

SELECT m.mechanicName, t.driver
FROM Mechanic m
JOIN Trucks t ON t.truckID = DEREF(m.Truckk).truckID;




--3)This query retrieves the description and manufacturer name for all rows in the LogisticsApplication table. 

SELECT l.manufItemDesc, DEREF(l.manufacturerr).manufName AS manufName
FROM LogisticsApplication l;




--4)Find all mechanics that assosiated with a car that carry a specific manufacturer's item, 
--sorted by maximum weight in descending order
-- For example 'item id = 2'

SELECT m.mechanicName
FROM Mechanic m
WHERE DEREF(m.Truckk).truckID IN (SELECT t.truckID
                                  FROM Trucks t
                                  WHERE t.maxWeight >= (SELECT mi.weight FROM ManufItem mi WHERE mi.manufIttemID = :itemID)
                                  AND t.maxVolume >= (SELECT mi.volumee FROM ManufItem mi WHERE mi.manufIttemID = :itemID));

--5) This query retrieves the driver of the Truck that the mechanic with the name 
--'John' is assigned to.

SELECT t.driver
FROM Mechanic m
JOIN Trucks t ON t.truckID = DEREF(m.Truckk).truckID
WHERE m.mechanicName = 'John';


--------------------------------------------------------------------------------
-- Value() queires


--1)This query uses the VALUE function to return the names of the planners in the Planners table and their phone numbers:

SELECT VALUE(p).plannerName AS plannerName, VALUE(p).plannerPhoneNum AS plannerPhoneNum
FROM Planners p;



--2)Find all trucks that can carry a specific manufacturer's item, sorted by maximum weight in descending order:
-- For example 'item id = 2'
SELECT value(t),t.truckID, t.maxWeight
FROM Trucks t
WHERE t.maxWeight >= (SELECT mi.weight FROM ManufItem mi WHERE mi.manufIttemID = :itemID)
AND t.maxVolume >= (SELECT mi.volumee FROM ManufItem mi WHERE mi.manufIttemID = :itemID)
ORDER BY t.maxWeight DESC;



--3)This query uses the VALUE function to return the names of the drivers 
--in the Trucks table and the maximum weight and volume their trucks can handle, 
--filtered by a specific maximum weight range

SELECT VALUE(t).driver AS driver, t.maxWeight AS maxWeight, t.maxVolume AS maxVolume
FROM Trucks t
WHERE t.maxWeight BETWEEN 5000 AND 10000;





--------------------------------------------------------------------------------
-- Table() queries

--1)Find the names and phone numbers of all planners for a specific item
-- For example 'item id = 2'

SELECT e.plannerName
FROM ManufItem mi, TABLE(mi.executive) e
WHERE mi.manufIttemID = :itemID;



--2)Find names and phone numbers of all planners who worked with items 
--with volume greater than specific value
-- For example 'volumee = 30'
SELECT p.plannerName, p.plannerPhoneNum
FROM ManufItem mi, TABLE(mi.executive) p
WHERE mi.volumee > :volumee
ORDER BY p.plannerName ASC;


--3)-- Find the number of planners who have worked on each manufacturer's item,
--sorted by the number of planners in descending order:

SELECT mi.manufIttemID, COUNT(p.plannerID) AS num_planners
FROM ManufItem mi, TABLE(mi.executive) p
GROUP BY mi.manufIttemID
ORDER BY num_planners DESC;



--4) Find the average weight of manufacturer's items that have been worked on by all planners
SELECT AVG(mi.weight) AS avg_weight
FROM ManufItem mi, TABLE(mi.executive) p;




-----------------------------------------------------------------------------
--1) These methods are a) to check if the weight of the truck is too high or not 
--b)calculates the density of the truck 


CREATE OR REPLACE TYPE BODY Truck AS 
  MAP MEMBER FUNCTION density RETURN NUMBER IS
  BEGIN
     RETURN maxWeight / maxVolume;
  END density;
  MEMBER PROCEDURE ifWeightIsNotTooHigh
  IS
  BEGIN
    -- Check if the weight of the truck is not too high
    IF (self.maxWeight > 20000) THEN
      -- Raise an exception if the weight is too high
      RAISE_APPLICATION_ERROR(-20000, 'Weight of truck is too high');
    else  DBMS_OUTPUT.PUT_LINE('Weight is okay');
    end if;
  END;  
END;


DECLARE
  po Truck;
 
BEGIN
  po :=NEW Truck(1,10,5,'ben');
 
DBMS_OUTPUT.PUT_LINE('density:' || po.density()); -- prints density:2
  END;


DECLARE
  t Truck;
BEGIN
  t := Truck(123, 10000, 100, 'John Smith');
  t.ifWeightIsNotTooHigh;
END;


-- 3) This method is for updating the website of the Manufacturer

CREATE OR REPLACE TYPE BODY Manufacturer AS
  MEMBER PROCEDURE update_website(new_website varchar2)
  AS
  BEGIN
    UPDATE Manufacturers
    SET manufWebSite = new_website
    WHERE manufID = self.manufID;
  END;
END;

-- First, let's select the current website for a manufacturer
SELECT m.manufWebSite
FROM Manufacturers m
WHERE m.manufID = 1;

-- Now let's use the update_website procedure to update the website
DECLARE
  manuf Manufacturer;
BEGIN
  SELECT VALUE(m) INTO manuf
  FROM Manufacturers m
  WHERE m.manufID = 1;
  manuf.update_website('www.accc.com');
END;

-- Now let's select the website again to verify that it was updated
SELECT m.manufWebSite
FROM Manufacturers m
WHERE m.manufID = 1;





