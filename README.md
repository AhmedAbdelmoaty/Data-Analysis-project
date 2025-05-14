# 📊 Sales Analysis Dashboard – Power BI

This project presents a professional **Sales Analysis Dashboard** built with **Power BI**, using data from the **AdventureWorksDW2022** database.

---

## 🔎 Project Overview

The dashboard provides insights into:
- Sales performance by product, customer, and country
- Monthly and quarterly trends
- Product categories analysis
- Customer demographics and locations

---

## 🗃 Data Source

The data used in this report is based on **Microsoft's sample database**:  
`AdventureWorksDW2022` (filtered from 2022 to 2024 only).

The following SQL views were created to simplify and organize the model:

### 🔧 Custom SQL Views:

```sql
-- 1. CalendarView
CREATE VIEW CalendarView AS
SELECT 
    DateKey,
    FullDateAlternateKey AS Date,
    EnglishDayNameOfWeek AS Day,
    EnglishMonthName AS Month,
    MonthNumberOfYear AS MonthNum,
    CalendarQuarter AS QTR,
    CalendarYear AS Year
FROM DimDate
WHERE CalendarYear BETWEEN 2022 AND 2024;

-- 2. CustomersView
CREATE VIEW CustomersView AS
SELECT 
    c.CustomerKey,
    c.FirstName,
    c.LastName,
    c.FirstName + ' ' + c.LastName AS FullName,
    c.Gender,
    g.City,
    g.EnglishCountryRegionName AS Country
FROM DimCustomer c
JOIN DimGeography g ON c.GeographyKey = g.GeographyKey;

-- 3. ProductsView
CREATE VIEW ProductsView AS
SELECT 
    p.ProductKey,
    p.ProductAlternateKey AS ItemCode,
    p.EnglishProductName AS ProductName,
    p.Color,
    ISNULL(p.ProductLine, 'NA') AS ProductLine,
    ISNULL(s.EnglishProductSubcategoryName, 'Unknown') AS SubCategoryName,
    ISNULL(cat.EnglishProductCategoryName, 'Unknown') AS CategoryName
FROM DimProduct p
LEFT JOIN DimProductSubcategory s ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
LEFT JOIN DimProductCategory cat ON s.ProductCategoryKey = cat.ProductCategoryKey;

-- 4. SalesView
CREATE VIEW SalesView AS
SELECT 
    ProductKey,
    OrderDateKey,
    CustomerKey,
    SalesOrderNumber,
    SalesAmount,
    TotalProductCost
FROM FactInternetSales
WHERE OrderDateKey BETWEEN 20220101 AND 20241231;
