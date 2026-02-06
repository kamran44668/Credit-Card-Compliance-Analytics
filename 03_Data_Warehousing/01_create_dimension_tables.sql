-- 1. Dimension: Location
-- Captures unique State and Zip combinations
DROP TABLE IF EXISTS Dim_Location; 
SELECT DISTINCT 
    ROW_NUMBER() OVER(ORDER BY State, ZIP_Region) AS Location_ID,
    State,
    ZIP_Region
INTO Dim_Location
FROM View_Final_Analytics;

-- 2. Dimension: Company
-- Captures unique Company names
DROP TABLE IF EXISTS Dim_Company;
SELECT DISTINCT 
    ROW_NUMBER() OVER(ORDER BY Company) AS Company_ID,
    Company
INTO Dim_Company
FROM View_Final_Analytics;

-- 3. Dimension: Product
-- Captures unique Product and Sub-product hierarchies
DROP TABLE IF EXISTS Dim_Product;
SELECT DISTINCT 
    ROW_NUMBER() OVER(ORDER BY Product, Sub_product) AS Product_ID,
    Product,
    Sub_product
INTO Dim_Product
FROM View_Final_Analytics;

-- 4. Dimension: Issue
-- Captures unique Issue and Sub-issue hierarchies
DROP TABLE IF EXISTS Dim_Issue;
SELECT DISTINCT 
    ROW_NUMBER() OVER(ORDER BY Issue, Sub_issue) AS Issue_ID,
    Issue,
    Sub_issue
INTO Dim_Issue
FROM View_Final_Analytics;