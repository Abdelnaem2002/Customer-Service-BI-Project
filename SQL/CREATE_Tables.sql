CREATE TABLE CustomerServiceRaw (
    InteractionID INT,
    CustomerID INT,
    CustomerName NVARCHAR(100),
    CustomerEmail NVARCHAR(100),
    CustomerAge INT,
    Country NVARCHAR(100),
    City NVARCHAR(100),
    Region NVARCHAR(100),
    DateOpened DATE,
    DateClosed DATE,
    IssueType NVARCHAR(100),
    Priority NVARCHAR(50),
    Status NVARCHAR(50),
    AssignedAgent NVARCHAR(100),
    ResolutionTimeHours DECIMAL(5,2),
    CustomerSatisfaction NVARCHAR(50),
    Channel NVARCHAR(50),
    OrderID INT,
    OrderAmount DECIMAL(10,2),
    OrderStatus NVARCHAR(50)
);
ALTER TABLE CustomerServiceRaw
ALTER COLUMN Country NVARCHAR(255);
