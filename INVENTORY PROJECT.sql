 --CREATING DATABASE
 CREATE DATABASE Inventory_Structure;
 --CREATING TABLE SUPPLIER
 CREATE TABLE Add_sup
 ( SID CHAR(5),
 SNAME VARCHAR(30) NOT NULL,
 SADD VARCHAR(40) NOT NULL,
 SCITY VARCHAR(30) CHECK(SCITY='DELHI'),
 SPHONE CHAR(10) UNIQUE,
 EMAIL VARCHAR(40));
 --ALTER TABLE 
 ALTER TABLE ADD_SUP ALTER COLUMN SID CHAR(5) NOT NULL ;
 ALTER TABLE add_sup ADD CONSTRAINT PSID PRIMARY KEY (SID);
 --CREATING TABLE PRODUCT
 CREATE TABLE ADD_PROD
 ( PID CHAR(5) PRIMARY KEY,
 PDESC VARCHAR(30) NOT NULL,
 PRICE INT CHECK(PRICE>0),
 CATEGORY VARCHAR(30) 
 CHECK(CATEGORY IN( 'Information TECHNOLOGY' ,'HOME APPLIANCES' ,'HEALTH CARE')),
 SID CHAR(5) NOT NULL REFERENCES Add_sup (SID));
 --CREATING TABLE STOCK
 CREATE TABLE Add_Stk
 (PID CHAR(5) NOT NULL REFERENCES ADD_PROD (PID),
 SQTY INT CHECK(SQTY>=0),
 ROL INT CHECK(ROL>0),
 MOQ INT CHECK(MOQ>=5));
 --CREATING TABLE CUSTOMER 
 CREATE TABLE ADD_CUST
 (CID CHAR(5) PRIMARY KEY ,
 CNAME VARCHAR(35),
 ADDRESS VARCHAR(40),
 CITY VARCHAR(30),
 PHONE CHAR(10),
 EMAIL VARCHAR(30),
 DOB DATE CHECK(DOB<'2000-01-01'));
 --CREATING TABLE ORDERS
 CREATE TABLE ADD_ORD
 (OID CHAR(5),
 ODATE DATE,
 PID CHAR(5) NOT NULL REFERENCES ADD_PROD (PID),
 CID CHAR(5) NOT NULL REFERENCES ADD_CUST (CID),
 OQTY INT CHECK (OQTY>=1));
 --inserting values into suppliers
 INSERT INTO Add_sup (SID, SNAME, SADD, SCITY, SPHONE, EMAIL) VALUES
('S0001', 'Anil Kumar', '123 MG Road', 'DELHI', '9876543210', 'anil.kumar@email.com'),
('S0002', 'Pooja Sharma', '456 Rajouri Gdn', 'DELHI', '9876501234', 'pooja.sharma@email.com'),
('S0003', 'Ravi Verma', '789 Karol Bagh', 'DELHI', '9876512345', 'ravi.verma@email.com'),
('S0004', 'Neha Singh', '101 Rohini Sector 9', 'DELHI', '9876523456', 'neha.singh@email.com'),
('S0005', 'Amit Tiwari', '55 Lajpat Nagar', 'DELHI', '9876534567', 'amit.tiwari@email.com'),
('S0006', 'Sneha Gupta', '88 Hauz Khas', 'DELHI', '9876545678', 'sneha.gupta@email.com'),
('S0007', 'Rahul Mehta', '202 Saket', 'DELHI', '9876556789', 'rahul.mehta@email.com'),
('S0008', 'Priya Yadav', '303 Janakpuri', 'DELHI', '9876567890', 'priya.yadav@email.com'),
('S0009', 'Karan Joshi', '707 Connaught Place', 'DELHI', '9876578901', 'karan.joshi@email.com'),
('S0010', 'Deepa Arora', '909 Vasant Kunj', 'DELHI', '9876589012', 'deepa.arora@email.com');
--inserting values into product
INSERT INTO ADD_PROD (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0001', 'Wireless Mouse', 850, 'Information TECHNOLOGY', 'S0001'),
('P0002', 'LED Monitor 24"', 7200, 'Information TECHNOLOGY', 'S0002'),
('P0003', 'HP Keyboard', 950, 'Information TECHNOLOGY', 'S0003'),
('P0004', 'Air Conditioner', 34000, 'HOME APPLIANCES', 'S0004'),
('P0005', 'Microwave Oven', 7800, 'HOME APPLIANCES', 'S0005'),
('P0006', 'Smart LED TV', 29500, 'HOME APPLIANCES', 'S0006'),
('P0007', 'Blood Pressure Monitor', 1500, 'HEALTH CARE', 'S0007'),
('P0008', 'Digital Thermometer', 300, 'HEALTH CARE', 'S0008'),
('P0009', 'Fitness Tracker', 3999, 'HEALTH CARE', 'S0009'),
('P0010', 'Laptop Cooling Pad', 1200, 'Information TECHNOLOGY', 'S0010'),
('P0011', 'Ceiling Fan', 2200, 'HOME APPLIANCES', 'S0001'),
('P0012', 'Juicer Mixer', 3500, 'HOME APPLIANCES', 'S0002'),
('P0013', 'Glucometer', 1600, 'HEALTH CARE', 'S0003'),
('P0014', 'Steam Vaporizer', 450, 'HEALTH CARE', 'S0004'),
('P0015', 'Gaming Mousepad', 400, 'Information TECHNOLOGY', 'S0005'),
('P0016', 'Router (Dual Band)', 1800, 'Information TECHNOLOGY', 'S0006'),
('P0017', 'Water Purifier', 12000, 'HOME APPLIANCES', 'S0007'),
('P0018', 'Electric Kettle', 1300, 'HOME APPLIANCES', 'S0008'),
('P0019', 'Portable Massager', 2400, 'HEALTH CARE', 'S0009'),
('P0020', 'Webcam HD', 1100, 'Information TECHNOLOGY', 'S0010');
--inserting values into stock 
INSERT INTO Add_Stk (PID, SQTY, ROL, MOQ) VALUES
('P0001', 150, 30, 10),
('P0002', 70, 20, 5),
('P0003', 90, 25, 15),
('P0004', 40, 10, 5),
('P0005', 120, 35, 10),
('P0006', 55, 15, 7),
('P0007', 30, 12, 8),
('P0008', 80, 20, 10),
('P0009', 60, 18, 9),
('P0010', 100, 25, 12);
--inserting values into customer
INSERT INTO ADD_CUST (CID, CNAME, ADDRESS, CITY, PHONE, EMAIL, DOB) VALUES
('C0001', 'Rahul Mehta', '12 MG Road', 'DELHI', '9876543210', 'rahul.mehta@email.com', '1995-08-15'),
('C0002', 'Sneha Gupta', '45 Connaught Pl', 'DELHI', '9876501234', 'sneha.gupta@email.com', '1987-03-22'),
('C0003', 'Amit Sharma', '89 Janakpuri', 'DELHI', '9876512345', 'amit.sharma@email.com', '1992-11-05'),
('C0004', 'Pooja Singh', '22 Vasant Kunj', 'DELHI', '9876523456', 'pooja.singh@email.com', '1980-06-30'),
('C0005', 'Neha Verma', '55 Rohini', 'DELHI', '9876534567', 'neha.verma@email.com', '1990-09-10'),
('C0006', 'Karan Joshi', '101 Lajpat Nagar', 'DELHI', '9876545678', 'karan.joshi@email.com', '1978-01-25'),
('C0007', 'Deepa Arora', '202 Saket', 'DELHI', '9876556789', 'deepa.arora@email.com', '1993-12-18'),
('C0008', 'Ravi Kumar', '303 Karol Bagh', 'DELHI', '9876567890', 'ravi.kumar@email.com', '1985-04-12'),
('C0009', 'Priya Yadav', '707 Rohini', 'DELHI', '9876578901', 'priya.yadav@email.com', '1994-07-07'),
('C0010', 'Anil Tiwari', '909 Hauz Khas', 'DELHI', '9876589012', 'anil.tiwari@email.com', '1989-02-28');
--insert into orders
INSERT INTO ADD_ORD (OID, ODATE, PID, CID, OQTY) VALUES
('O0001', '2025-05-20', 'P0001', 'C0003', 5),
('O0002', '2025-05-21', 'P0005', 'C0007', 2),
('O0003', '2025-05-22', 'P0010', 'C0001', 1),
('O0004', '2025-05-23', 'P0009', 'C0009', 3),
('O0005', '2025-05-24', 'P0014', 'C0005', 4);
--viewing product category and suppliers USING JOIN
select * from ADD_PROD;
select * from Add_sup;
SELECT PID, PDESC, CATEGORY, SNAME, SCITY
FROM ADD_PROD
INNER JOIN Add_sup ON ADD_PROD.SID = Add_sup.SID;
--VIEWING DATA FROM ORDER , CUSTOMER , PRODUCT 
SELECT OID , ODATE , CNAME , ADDRESS , PHONE , PDESC , PRICE  , OQTY 
FROM ADD_ORD INNER JOIN ADD_CUST ON ADD_ORD.CID=ADD_CUST.CID
INNER JOIN ADD_PROD ON ADD_ORD.PID=ADD_PROD.PID;
--CREATING VIEW
CREATE VIEW BILL AS
SELECT OID , ODATE , CNAME , ADDRESS , PHONE , PDESC , PRICE , OQTY
FROM ADD_CUST INNER JOIN ADD_ORD ON ADD_CUST.CID=ADD_ORD.CID
INNER JOIN ADD_PROD ON ADD_PROD.PID=ADD_ORD.PID;
SELECT * FROM BILL;