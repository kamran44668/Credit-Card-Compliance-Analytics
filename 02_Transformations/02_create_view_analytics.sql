CREATE OR ALTER VIEW View_Final_Analytics AS
SELECT 
    *,

    -- Flag: Complaint narrative exists
    CASE 
        WHEN Consumer_complaint_narrative IS NOT NULL AND Consumer_complaint_narrative <> 'None' THEN 1 
        ELSE 0 
    END AS Has_Narrative,

    -- Flag: Theft or fraud-related keywords
    CASE 
        WHEN Consumer_complaint_narrative IS NOT NULL AND (
             LOWER(Consumer_complaint_narrative) LIKE '%identity theft%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%fraud%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%stolen%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%forged%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%forgery%'
          OR LOWER(Consumer_complaint_narrative) LIKE '%opened without%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%unauthorized%'
        ) THEN 1 ELSE 0 
    END AS Flag_Theft_Fraud,

    -- Flag: Credit reporting issues
    CASE 
        WHEN Consumer_complaint_narrative IS NOT NULL AND (
             LOWER(Consumer_complaint_narrative) LIKE '%credit report%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%credit score%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%fcra%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%credit bureau%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%incorrectly report%'
          OR LOWER(Consumer_complaint_narrative) LIKE '%inquiry%'
        ) THEN 1 ELSE 0 
    END AS Flag_Credit_Reporting,

    -- Flag: Rewards or promo issues
    CASE 
        WHEN Consumer_complaint_narrative IS NOT NULL AND (
             LOWER(Consumer_complaint_narrative) LIKE '%bonus%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%promotion%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%points%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%miles%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%cash back%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%offer%'
        ) THEN 1 ELSE 0 
    END AS Flag_Rewards_Promos,

    -- Flag: Disputes or refund issues
    CASE 
        WHEN Consumer_complaint_narrative IS NOT NULL AND (
             LOWER(Consumer_complaint_narrative) LIKE '%dispute%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%refund%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%merchant%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%chargeback%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%provisional credit%'
        ) THEN 1 ELSE 0 
    END AS Flag_Disputes_Refunds,

    -- Flag: Debt collection issues
    CASE 
        WHEN Consumer_complaint_narrative IS NOT NULL AND (
             LOWER(Consumer_complaint_narrative) LIKE '%collect%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%debt%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%validate%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%verification%'
        ) THEN 1 ELSE 0 
    END AS Flag_Debt_Collection,

    -- Flag: Financial impact (fees, interest, overdraft)
    CASE 
        WHEN Consumer_complaint_narrative IS NOT NULL AND (
             LOWER(Consumer_complaint_narrative) LIKE '%fee%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%interest%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%overdraft%'
        ) THEN 1 ELSE 0 
    END AS Flag_Financial_Impact,

    -- Flag: Bad customer service
    CASE 
        WHEN Consumer_complaint_narrative IS NOT NULL AND (
             LOWER(Consumer_complaint_narrative) LIKE '%rude%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%hung up%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%manager%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%back office%' 
          OR LOWER(Consumer_complaint_narrative) LIKE '%ignore%'
          OR LOWER(Consumer_complaint_narrative) LIKE '%lied%'
        ) THEN 1 ELSE 0 
    END AS Flag_Poor_Service

FROM dbo.View_Core_Cleaning;