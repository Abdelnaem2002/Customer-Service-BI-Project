CREATE TABLE DimStatus (
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    Status VARCHAR(50)
);

INSERT INTO DimStatus (Status)
SELECT DISTINCT Status
FROM CustomerService.dbo.CustomerServiceRaw
WHERE Status IS NOT NULL;
