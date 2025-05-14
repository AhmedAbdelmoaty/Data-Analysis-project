CREATE VIEW CustomersView AS
SELECT 
    c.CustomerKey,
    c.FirstName,
    c.LastName,
    c.FirstName + ' ' + c.LastName AS FullName,
    c.Gender,
    g.City,
    g.EnglishCountryRegionName AS Country
FROM 
    DimCustomer c
JOIN 
    DimGeography g ON c.GeographyKey = g.GeographyKey
