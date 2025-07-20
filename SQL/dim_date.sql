CREATE TABLE DimDate (
    DateKey DATE PRIMARY KEY,
    FullDate VARCHAR(50),
    Day INT,
    Month INT,
    MonthName VARCHAR(20),
    Quarter INT,
    Year INT,
    Week INT,
    DayOfWeekName VARCHAR(20),
    IsWeekend BIT
);
DECLARE @StartDate DATE = (SELECT MIN(DateOpened) FROM CustomerServiceRaw);
DECLARE @EndDate DATE = (SELECT MAX(DateClosed) FROM CustomerServiceRaw);

WITH DateSeries AS (
    SELECT @StartDate AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateSeries
    WHERE DateValue < @EndDate
)
INSERT INTO DimDate (
    DateKey, FullDate, Day, Month, MonthName, Quarter, Year, Week, DayOfWeekName, IsWeekend
)
SELECT 
    DateValue,
    FORMAT(DateValue, 'yyyy-MM-dd'),
    DAY(DateValue),
    MONTH(DateValue),
    DATENAME(MONTH, DateValue),
    DATEPART(QUARTER, DateValue),
    YEAR(DateValue),
    DATEPART(WEEK, DateValue),
    DATENAME(WEEKDAY, DateValue),
    CASE WHEN DATENAME(WEEKDAY, DateValue) IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END
FROM DateSeries
OPTION (MAXRECURSION 0);


ALTER TABLE FactCustomerInteraction
ADD DateOpenedKey DATE, 
    DateClosedKey DATE;


UPDATE FactCustomerInteraction
SET 
    DateOpenedKey = DateOpened,
    DateClosedKey = DateClosed;

ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_DateOpened
FOREIGN KEY (DateOpenedKey) REFERENCES DimDate(DateKey);

ALTER TABLE FactCustomerInteraction
ADD CONSTRAINT FK_DateClosed
FOREIGN KEY (DateClosedKey) REFERENCES DimDate(DateKey);
