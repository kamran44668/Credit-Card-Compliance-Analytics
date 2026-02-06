-- Remove Temp Join Columns
ALTER TABLE Fact_Complaints DROP COLUMN Temp_State;
ALTER TABLE Fact_Complaints DROP COLUMN Temp_ZIP;
ALTER TABLE Fact_Complaints DROP COLUMN Temp_Company;
ALTER TABLE Fact_Complaints DROP COLUMN Temp_Product;
ALTER TABLE Fact_Complaints DROP COLUMN Temp_Sub_Product;
ALTER TABLE Fact_Complaints DROP COLUMN Temp_Issue;
ALTER TABLE Fact_Complaints DROP COLUMN Temp_Sub_Issue;

-- 1. Drop the Constraint (Key) first
-- (I copied this specific ID from your error message)
ALTER TABLE Fact_Complaints DROP CONSTRAINT PK_Fact_Complaints;

-- 2. NOW you can drop the column
ALTER TABLE Fact_Complaints DROP COLUMN Row_ID;

-- 3. Finish the cleanup
ALTER TABLE Fact_Complaints REBUILD WITH (DATA_COMPRESSION = PAGE);
DBCC SHRINKDATABASE (complaints);

-- 4. Verify Final Result
SELECT TOP 10 * FROM Fact_Complaints;
