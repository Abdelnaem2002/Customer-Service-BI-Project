CREATE TABLE DimSatisfaction (
    SatisfactionID INT IDENTITY(1,1) PRIMARY KEY,
    SatisfactionLevel VARCHAR(50)
);

INSERT INTO DimSatisfaction (SatisfactionLevel)
SELECT DISTINCT CustomerSatisfaction
FROM CustomerService.dbo.CustomerServiceRaw
WHERE CustomerSatisfaction IS NOT NULL;
