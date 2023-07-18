Create database week2;
use week2;
-- create two tables, PETSALE and PET
CREATE TABLE PETSALE (
    ID INTEGER NOT NULL,
    PET CHAR(20),
    SALEPRICE DECIMAL(6,2),
    PROFIT DECIMAL(6,2),
    SALEDATE DATE
    );
    
CREATE TABLE PET (
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    QUANTITY INTEGER
    );
    
-- insert some records into the two newly created tables 
-- show all the records of the two tables.    
INSERT INTO PETSALE VALUES
    (1,'Cat',450.09,100.47,'2018-05-29'),
    (2,'Dog',666.66,150.76,'2018-06-01'),
    (3,'Parrot',50.00,8.9,'2018-06-04'),
    (4,'Hamster',60.60,12,'2018-06-11'),
    (5,'Goldfish',48.48,3.5,'2018-06-14');
    
INSERT INTO PET VALUES
    (1,'Cat',3),
    (2,'Dog',4),
    (3,'Hamster',2);
    
SELECT * FROM PETSALE;
SELECT * FROM PET;
-- Add a new QUANTITY column to the PETSALE table. 
-- show the altered table. 
ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;
SELECT * FROM PETSALE;

-- update the newly added QUANTITY column of the PETSALE table with some values 
-- show all the records of the table. 
UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;
SELECT * FROM PETSALE;

-- Delete the PROFIT column from the PETSALE table 
-- show the altered table
ALTER TABLE PETSALE CHANGE PET  PET VARCHAR(20);
SELECT * FROM PETSALE;
-- Change the data type to VARCHAR(20) type of the column PET of the table PETSALE 
-- show the altered table
ALTER TABLE `PETSALE` CHANGE `PET` `ANIMAL` varchar(20);
SELECT * FROM PETSALE;


-- Rename the column PET to ANIMAL of the PETSALE table 
-- show the altered table.
TRUNCATE TABLE PET ;
SELECT * FROM PET;
-- Remove all rows from the PET table 
-- show the empty table.
DROP TABLE PET;
SELECT * FROM PET;