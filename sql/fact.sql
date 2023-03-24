-- Create orders fact table
CREATE TABLE orders_fact (
    order_number INT PRIMARY KEY,
    quantity_ordered INT,
    price_each DECIMAL(10,2),
    order_line_number INT,
    status VARCHAR(20),
    customer_name VARCHAR(100),
    date_id DATE,
    deal_size VARCHAR(20)
);

-- Populate orders fact table
INSERT INTO orders_fact (order_number, quantity_ordered, price_each, order_line_number, status, customer_name,
                         date_id, deal_size)
SELECT ORDERNUMBER, QUANTITYORDERED, PRICEEACH, ORDERLINENUMBER, STATUS, CUSTOMERNAME, ORDERDATE, DEALSIZE
FROM original_table;

-- Create sales fact table
CREATE TABLE sales_fact (
    order_number INT PRIMARY KEY,
    sales DECIMAL(10,2)
);

-- Populate sales fact table
INSERT INTO sales_fact (order_number, sales)
SELECT ORDERNUMBER, SALES
FROM original_table;