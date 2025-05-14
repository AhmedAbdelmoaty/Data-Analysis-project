CREATE VIEW SalesView AS
SELECT 
    ProductKey,
    OrderDateKey,
    CustomerKey,
    SalesOrderNumber,
    SalesAmount,
	TotalProductCost
FROM 
    FactInternetSales 
WHERE 
    OrderDateKey BETWEEN 20220101 AND 20241231