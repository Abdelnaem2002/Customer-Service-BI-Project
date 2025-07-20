CREATE TABLE FactCustomerInteraction (
    InteractionID INT PRIMARY KEY,
    CustomerID INT,
    AgentID INT,
    IssueTypeID INT,
    PriorityID INT,
    StatusID INT,
    ChannelID INT,
    OrderID INT,
    OrderAmount DECIMAL(10, 2),
    OrderStatusID INT,
    DateOpened DATE,
    DateClosed DATE,
    ResolutionTimeHours INT,
    SatisfactionID INT  -- Now references DimSatisfaction
);
ALTER TABLE FactCustomerInteraction
ADD SatisfactionID INT;

WITH RankedInteractions AS (
    SELECT r.*, 
           ROW_NUMBER() OVER (PARTITION BY r.InteractionID ORDER BY r.InteractionID) AS rn
    FROM CustomerService.dbo.CustomerServiceRaw r
    JOIN DimAgent a ON r.AssignedAgent = a.AgentName
    JOIN DimIssueType i ON r.IssueType = i.IssueType
    JOIN DimPriority p ON r.Priority = p.Priority
    JOIN DimStatus s ON r.Status = s.Status
    JOIN DimChannel c ON r.Channel = c.Channel
    JOIN DimOrderStatus o ON r.OrderStatus = o.OrderStatus
    JOIN DimSatisfaction sat ON r.CustomerSatisfaction = sat.SatisfactionLevel
)
INSERT INTO FactCustomerInteraction (
    InteractionID, CustomerID, AgentID, IssueTypeID, PriorityID, StatusID,
    ChannelID, OrderID, OrderAmount, OrderStatusID, DateOpened, DateClosed,
    ResolutionTimeHours, SatisfactionID
)
SELECT
    r.InteractionID,
    r.CustomerID,
    a.AgentID,
    i.IssueTypeID,
    p.PriorityID,
    s.StatusID,
    c.ChannelID,
    r.OrderID,
    r.OrderAmount,
    o.OrderStatusID,
    r.DateOpened,
    r.DateClosed,
    r.ResolutionTimeHours,
    sat.SatisfactionID
FROM RankedInteractions r
JOIN DimAgent a ON r.AssignedAgent = a.AgentName
JOIN DimIssueType i ON r.IssueType = i.IssueType
JOIN DimPriority p ON r.Priority = p.Priority
JOIN DimStatus s ON r.Status = s.Status
JOIN DimChannel c ON r.Channel = c.Channel
JOIN DimOrderStatus o ON r.OrderStatus = o.OrderStatus
JOIN DimSatisfaction sat ON r.CustomerSatisfaction = sat.SatisfactionLevel
WHERE r.rn = 1;

