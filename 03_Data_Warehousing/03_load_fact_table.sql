INSERT INTO Fact_Complaints (
    Complaint_ID, 
    Date_Received, Date_Sent_To_Company, Days_To_Process,
    Is_Timely, Has_Narrative,
    -- The 4 New Columns
    Consumer_Type, Submission_Channel, Response_Detailed, Response_Category,
    -- Flags
    Flag_Theft_Fraud, Flag_Credit_Reporting, Flag_Rewards_Promos, 
    Flag_Disputes_Refunds, Flag_Debt_Collection, Flag_Financial_Impact, Flag_Poor_Service,
    -- Temp Join Columns
    Temp_State, Temp_ZIP, Temp_Company, 
    Temp_Product, Temp_Sub_Product, 
    Temp_Issue, Temp_Sub_Issue
)
SELECT 
    Complaint_ID, 
    Date_Received, Date_Sent_To_Company, Days_To_Process,
    Is_Timely, Has_Narrative,
    -- The 4 New Columns
    Consumer_Type, Submission_Channel, Response_Detailed, Response_Category,
    -- Flags
    Flag_Theft_Fraud, Flag_Credit_Reporting, Flag_Rewards_Promos, 
    Flag_Disputes_Refunds, Flag_Debt_Collection, Flag_Financial_Impact, Flag_Poor_Service,
    -- Raw Text from View
    State, ZIP_Region, Company, 
    Product, Sub_product, 
    Issue, Sub_issue
FROM View_Final_Analytics;