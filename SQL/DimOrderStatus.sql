CREATE TABLE DimOrderStatus (
    OrderStatusID INT IDENTITY(1,1) PRIMARY KEY,
    OrderStatus VARCHAR(100)
);

INSERT INTO DimOrderStatus (OrderStatus)
SELECT DISTINCT OrderStatus
FROM CustomerService.dbo.CustomerServiceRaw
WHERE OrderStatus IS NOT NULL;
