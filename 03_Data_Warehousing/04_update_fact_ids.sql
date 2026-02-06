-- 1. Update Company IDs
UPDATE f
SET f.Company_ID = c.Company_ID
FROM Fact_Complaints f
JOIN Dim_Company c ON f.Temp_Company = c.Company;

-- 2. Update Location IDs
UPDATE f
SET f.Location_ID = l.Location_ID
FROM Fact_Complaints f
JOIN Dim_Location l ON f.Temp_State = l.State AND f.Temp_ZIP = l.ZIP_Region;

-- 3. Update Product IDs
UPDATE f
SET f.Product_ID = p.Product_ID
FROM Fact_Complaints f
JOIN Dim_Product p ON f.Temp_Product = p.Product AND f.Temp_Sub_Product = p.Sub_product;

-- 4. Update Issue IDs
UPDATE f
SET f.Issue_ID = i.Issue_ID
FROM Fact_Complaints f
JOIN Dim_Issue i ON f.Temp_Issue = i.Issue AND f.Temp_Sub_Issue = i.Sub_issue;