CREATE VIEW CalendarView as
SELECT 
    DateKey,
    FullDateAlternateKey as Date,
    EnglishDayNameOfWeek as Day,
    EnglishMonthName as Month,
    MonthNumberOfYear as MonthNum,
    CalendarQuarter as QTR,
    CalendarYear as Year
FROM 
    DimDate
WHERE 
    CalendarYear BETWEEN 2022 AND 2024;

