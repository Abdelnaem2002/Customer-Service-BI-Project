CREATE TABLE DimAgent (
    AgentID INT IDENTITY(1,1) PRIMARY KEY,
    AgentName VARCHAR(255)
);

INSERT INTO DimAgent (AgentName)
SELECT DISTINCT AssignedAgent
FROM CustomerService.dbo.CustomerServiceRaw
WHERE AssignedAgent IS NOT NULL;
