-- Create Schema
CREATE SCHEMA datawarehouse;

-- Create date dimension
CREATE TABLE datawarehouse.dim_date (
    DATEID VARCHAR(8) PRIMARY KEY,
    [YEAR] INTEGER NOT NULL,
    SEMESTER INTEGER NOT NULL,
    QUARTER INTEGER NOT NULL,
    MONTHNAME VARCHAR(20) NOT NULL,
    [MONTH] INTEGER NOT NULL,
    MONTHNUMBERBYYEAR VARCHAR(7) NOT NULL,
    WEEKNUMBER INTEGER NOT NULL,
    DAYNAME VARCHAR(20) NOT NULL,
    [DAY] INTEGER NOT NULL,
    IS_WEEKDAY BIT NOT NULL,
    FULLDATE DATE NOT NULL
);

-- Create product dimension
CREATE TABLE datawarehouse.dim_product (
   PRODUCTID INTEGER PRIMARY KEY,
   PRODUCTCODE VARCHAR(50) NOT NULL,
   PRODUCTLINE VARCHAR(50) NOT NULL,
   MSRP INTEGER NOT NULL
);

-- Creating customer dimension
CREATE TABLE datawarehouse.dim_customer (
    CUSTOMERID INTEGER PRIMARY KEY,
    CUSTOMERNAME VARCHAR(50) NOT NULL,
    PHONE VARCHAR(20) NOT NULL,
    CONTACTFIRSTNAME VARCHAR(50) NOT NULL,
    CONTACTLASTNAME VARCHAR(50) NOT NULL,
    ADDRESSLINE1 VARCHAR(100) NOT NULL,
    ADDRESSLINE2 VARCHAR(100),
    CITY VARCHAR(50) NOT NULL,
    [STATE] VARCHAR(50),
    POSTALCODE VARCHAR(20),
    COUNTRY VARCHAR(50),
    TERRITORY VARCHAR(50)
);