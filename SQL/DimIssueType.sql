CREATE TABLE DimIssueType (
    IssueTypeID INT IDENTITY(1,1) PRIMARY KEY,
    IssueType VARCHAR(100)
);

INSERT INTO DimIssueType (IssueType)
SELECT DISTINCT IssueType
FROM CustomerService.dbo.CustomerServiceRaw
WHERE IssueType IS NOT NULL;
