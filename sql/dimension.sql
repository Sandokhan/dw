-- Create product dimension
CREATE TABLE dim_product (
     product_code VARCHAR(20) PRIMARY KEY,
     product_line VARCHAR(50),
     product_msrp DECIMAL(10,2)
);

-- Populate product dimension
INSERT INTO dim_product (product_code, product_line, product_msrp)
SELECT DISTINCT PRODUCTCODE, PRODUCTLINE, MSRP
FROM original_table;

-- Create customer dimension
CREATE TABLE dim_customer (
  customer_name VARCHAR(100) PRIMARY KEY,
  phone VARCHAR(20),
  address_line1 VARCHAR(100),
  address_line2 VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  postal_code VARCHAR(20),
  country VARCHAR(50),
  territory VARCHAR(50),
  contact_last_name VARCHAR(50),
  contact_first_name VARCHAR(50)
);

-- Populate customer dimension
INSERT INTO dim_customer (customer_name, phone, address_line1, address_line2, city, state,
                          postal_code, country, territory, contact_last_name, contact_first_name)
SELECT DISTINCT CUSTOMERNAME, PHONE, ADDRESSLINE1, RESSLINE2, CITY, STATE, POSTALCODE,
                COUNTRY, TERRITORY, CONTACTLASTNAME, CONTACTFIRSTNAME
FROM original_table;

-- Create location dimension
CREATE TABLE dim_location (
  city VARCHAR(50) PRIMARY KEY,
  state VARCHAR(50),
  country VARCHAR(50),
  territory VARCHAR(50)
);

-- Populate location dimension
INSERT INTO dim_location (city, state, country, territory)
SELECT DISTINCT CITY, STATE, POSTALCODE, COUNTRY, TERRITORY
FROM original_table;

-- Create time dimension
CREATE TABLE time_dim (
  date_id DATE PRIMARY KEY,
  day INTEGER,
  month INTEGER,
  quarter INTEGER,
  year INTEGER
);

-- Populate time dimension
INSERT INTO time_dim (date_id, day, month, quarter, year)
SELECT DISTINCT ORDERDATE, DAY(ORDERDATE), MONTH(ORDERDATE), QTR_ID, YEAR_ID
FROM original_table;