-- Create table
CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerEmail VARCHAR(255),
    CustomerAge INT,
    Country VARCHAR(100),
    City VARCHAR(100),
    Region VARCHAR(100)
);
--This ensures you're inserting only one row per unique CustomerID, avoiding the primary key violation:
WITH RankedCustomers AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY CustomerID) AS rn
    FROM CustomerService.dbo.CustomerServiceRaw
)
INSERT INTO DimCustomer (CustomerID, CustomerName, CustomerEmail, CustomerAge, Country, City, Region)
SELECT CustomerID, CustomerName, CustomerEmail, CustomerAge, Country, City, Region
FROM RankedCustomers
WHERE rn = 1;

