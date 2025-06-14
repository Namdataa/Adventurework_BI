-- Further Transformation
WITH CTE_FactInternetSales
AS (SELECT
  ProductKey,
  OrderDateKey,
  DueDateKey,
  ShipDateKey,
  CustomerKey,
  PromotionKey,
  CurrencyKey,
  SalesTerritoryKey,
  SalesOrderNumber,
  SalesAmount,
  TotalProductCost,
  TaxAmt,
  Freight,
  SalesAmount - TotalProductCost - TaxAmt - Freight AS Profit,
  (SalesAmount - TotalProductCost - TaxAmt - Freight) / SalesAmount AS ProfitMargin,
  CONVERT(date, OrderDate) AS OrderDate,
  CONVERT(date, DueDate) AS DueDate,
  CONVERT(date, ShipDate) AS ShipDate,
  IIF(ShipDate > DueDate, 'Late', 'Normal') AS ShipStatus,
  DATEDIFF(D, OrderDate, ShipDate) + 3 TimeToArrive,
  DATEDIFF(D, OrderDate, ShipDate) TimeToShip
FROM [AdventureWorksDW].dbo.FactInternetSales)
-------------------------------------------------------------------------------------------------------------------------------------------------------
,
CTE_DimDate
AS (SELECT
  DateKey,
  FullDateAlternateKey,
  DayNumberOfWeek,
  EnglishDayNameOfWeek,
  DayNumberOfMonth,
  DayNumberOfYear,
  WeekNumberOfYear,
  MonthNumberOfYear,
  EnglishMonthName AS MonthName,
  CalendarQuarter,
  CalendarYear,
  CalendarSemester,
  FiscalYear FiscalQuarter,
  FiscalSemester
FROM [AdventureWorksDW].dbo.DimDate)
-------------------------------------------------------------------------------------------------------------------------------------------------------
,
CTE_DimProduct
AS (SELECT
  ProductKey,
  ProductAlternateKey,
  EnglishProductName AS ProductName,
  EnglishProductCategoryName AS CategoryName,
  EnglishProductSubcategoryName AS SubcategoryName,
  CASE
    WHEN EnglishProductName LIKE '%,%' AND
      EnglishProductCategoryName = 'Bikes' THEN LEFT(EnglishProductName, CHARINDEX(' ', EnglishProductName) - 1)
    WHEN EnglishProductName LIKE '%,%' AND
      EnglishProductSubcategoryName LIKE '%Frames%' THEN LEFT(EnglishProductName, CHARINDEX('-', EnglishProductName) - 1)
    WHEN EnglishProductName LIKE '%,%' THEN LEFT(EnglishProductName, CHARINDEX(',', EnglishProductName) - 1)
    WHEN EnglishProductName LIKE '%/%' THEN LEFT(EnglishProductName, CHARINDEX('/', EnglishProductName) - 1)
    ELSE NULL
  END AS ModelName,
  SafetyStockLevel,
  ReorderPoint,
  Color,
  SizeRange,
  Weight
FROM [AdventureWorksDW].dbo.DimProduct
JOIN [AdventureWorksDW].dbo.DimProductSubcategory
  ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
JOIN [AdventureWorksDW].dbo.DimProductCategory
  ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
WHERE ListPrice IS NOT NULL)
-------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT CategoryName, SubcategoryName, ModelName, OrderDate, ProductName, COUNT(*) FROM CTE_FactInternetSales
JOIN CTE_DimDate 
ON CTE_FactInternetSales.OrderDateKey = CTE_DimDate.DateKey
JOIN CTE_DimProduct 
ON CTE_FactInternetSales.ProductKey = CTE_DimProduct.ProductKey
GROUP BY ProductName, CategoryName, SubcategoryName, ModelName, OrderDate