CREATE OR ALTER VIEW View_Core_Cleaning AS
SELECT 
    -- 1. Primary Key & ID
    TRY_CAST(Complaint_ID AS INT) AS Complaint_ID,

    -- 2. Dates & Processing Time
    TRY_CAST(Date_received AS DATE) AS Date_Received,
    TRY_CAST(Date_sent_to_company AS DATE) AS Date_Sent_To_Company,
    DATEDIFF(day, TRY_CAST(Date_received AS DATE), TRY_CAST(Date_sent_to_company AS DATE)) AS Days_To_Process,

    -- 3. Geography (Handle NULL State)
    ISNULL(State, 'Unknown') AS State,
    CASE 
        WHEN ZIP_code LIKE '[0-9][0-9][0-9]%' THEN LEFT(ZIP_code, 3) 
        ELSE 'Unknown' 
    END AS ZIP_Region,

    -- 4. Demographics & Metadata
    ISNULL(NULLIF(Tags, 'None'), 'Standard Consumer') AS Consumer_Type,
    ISNULL(Submitted_via, 'Unknown') AS Submission_Channel,

    -- 5. Products & Issues
    ISNULL(Company, 'Unknown Company') AS Company,
    Product,
    ISNULL(NULLIF(Sub_product, 'None'), 'Not Specified') AS Sub_product,
    Issue,
    ISNULL(NULLIF(Sub_issue, 'None'), 'Not Specified') AS Sub_issue,

    -- 6. Outcomes
    CASE WHEN Timely_response = 'Yes' THEN 1 ELSE 0 END AS Is_Timely,
    ISNULL(Company_response_to_consumer, 'Unknown') AS Response_Detailed,
    
    CASE 
        WHEN Company_response_to_consumer LIKE '%monetary relief%' THEN 'Relief Granted'
        WHEN Company_response_to_consumer LIKE '%non-monetary relief%' THEN 'Relief Granted'
        WHEN Company_response_to_consumer LIKE '%closed%' THEN 'Closed - No Relief'
        ELSE 'In Progress/Other'
    END AS Response_Category,


    Consumer_complaint_narrative

FROM dbo.stg_complaints
WHERE Complaint_ID IS NOT NULL; 