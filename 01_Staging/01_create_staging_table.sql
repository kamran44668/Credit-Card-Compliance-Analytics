CREATE TABLE stg_complaints (
    Complaint_ID VARCHAR(50),
    Date_received VARCHAR(50),
    Product VARCHAR(255),
    Sub_product VARCHAR(255),
    Issue VARCHAR(255),
    Sub_issue VARCHAR(255),
    Consumer_complaint_narrative VARCHAR(MAX), -- The messy column
    Company_public_response VARCHAR(MAX),
    Company VARCHAR(255),
    State VARCHAR(50),
    ZIP_code VARCHAR(50),
    Tags VARCHAR(255),
    Consumer_consent_provided VARCHAR(50),
    Submitted_via VARCHAR(100),
    Date_sent_to_company VARCHAR(50),
    Company_response_to_consumer VARCHAR(255),
    Timely_response VARCHAR(50),
    Consumer_disputed VARCHAR(50)
);