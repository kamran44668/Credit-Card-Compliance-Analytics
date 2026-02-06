DROP TABLE IF EXISTS Fact_Complaints;

CREATE TABLE Fact_Complaints (
    -- 1. Helper ID 
    Row_ID INT IDENTITY(1,1) CONSTRAINT PK_Fact_Complaints PRIMARY KEY,

    -- 2. The IDs (Start as NULL, we will fill them in Step 3)
    Location_ID int,
    Company_ID int,
    Product_ID int,
    Issue_ID int,

    -- 3. The Data columns (Including the new ones)
    Complaint_ID varchar(50),
    Date_Received date,
    Date_Sent_To_Company date,
    Days_To_Process int,
    Is_Timely bit,
    Has_Narrative bit,
    
    -- The 4 Additional Text Columns
    Consumer_Type varchar(255),
    Submission_Channel varchar(255),
    Response_Detailed varchar(255),
    Response_Category varchar(255),

    -- The Flags
    Flag_Theft_Fraud bit,
    Flag_Credit_Reporting bit,
    Flag_Rewards_Promos bit,
    Flag_Disputes_Refunds bit,
    Flag_Debt_Collection bit,
    Flag_Financial_Impact bit,
    Flag_Poor_Service bit,

    -- 4. Temporary Join Columns (Used to find the IDs)
    Temp_State varchar(50), 
    Temp_ZIP varchar(20),
    Temp_Company varchar(255),
    Temp_Product varchar(255), 
    Temp_Sub_Product varchar(255),
    Temp_Issue varchar(255), 
    Temp_Sub_Issue varchar(255)
);