CREATE VIEW ProductsView AS
SELECT 
    p.ProductKey,
    p.ProductAlternateKey as ItemCode,
    p.EnglishProductName as ProductName,
    p.Color,
    ISNULL(p.ProductLine, 'NA') as ProductLine,
    ISNULL(s.EnglishProductSubcategoryName, 'Unknown') as SubCategoryName,
    ISNULL(cat.EnglishProductCategoryName, 'Unknown') as CategoryName
FROM 
    DimProduct p
LEFT JOIN 
    DimProductSubcategory s ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
LEFT JOIN 
    DimProductCategory cat ON s.ProductCategoryKey = cat.ProductCategoryKey;