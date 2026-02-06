BULK INSERT stg_complaints 
FROM 'C:\Users\kamran\Desktop\CAPSTONE PROJECTS\PROJECT 3\Data_Resources\complaints-2025-12-04_05_50.csv'
WITH (
    FORMAT = 'CSV',           -- Tells SQL to handle quotes correctly
    FIELDQUOTE = '"',         -- Specifies that text wrappers are double quotes
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',    
    ROWTERMINATOR = '0x0a',  
    CODEPAGE = '65001',       -- UTF-8
    TABLOCK
);