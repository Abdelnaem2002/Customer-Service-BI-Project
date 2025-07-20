CREATE TABLE DimChannel (
    ChannelID INT IDENTITY(1,1) PRIMARY KEY,
    Channel VARCHAR(50)
);

INSERT INTO DimChannel (Channel)
SELECT DISTINCT Channel
FROM CustomerService.dbo.CustomerServiceRaw
WHERE Channel IS NOT NULL;
