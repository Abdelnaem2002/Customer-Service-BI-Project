CREATE TABLE DimPriority (
    PriorityID INT IDENTITY(1,1) PRIMARY KEY,
    Priority VARCHAR(50)
);

INSERT INTO DimPriority (Priority)
SELECT DISTINCT Priority
FROM CustomerService.dbo.CustomerServiceRaw
WHERE Priority IS NOT NULL;
