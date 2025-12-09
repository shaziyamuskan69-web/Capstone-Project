-- 1. Specify the database you are using
USE sfdb;

-- 2. (Optional, but safe) Drop the table if it already exists to ensure a clean start
DROP TABLE IF EXISTS loandata;

-- 3. Create the table structure to match the Loan Prediction Dataset
CREATE TABLE loandata (
    Loan_ID VARCHAR(15) PRIMARY KEY,
    Gender VARCHAR(10),
    Married VARCHAR(10),
    Dependents VARCHAR(10),
    Education VARCHAR(15),
    Self_Employed VARCHAR(10),
    ApplicantIncome INT,
    CoapplicantIncome DECIMAL(10, 2),
    LoanAmount INT,
    Loan_Amount_Term INT,
    Credit_History INT,
    Property_Area VARCHAR(15),
    Loan_Status VARCHAR(5) -- The target variable for analysis
);

SELECT 'Table Created Successfully.' AS Status;
-- Check the total number of rows loaded
SELECT
    COUNT(*) AS TotalRows
FROM
    loandata;
    SELECT
    Property_Area,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS ApprovedLoans,
    SUM(CASE WHEN Loan_Status = 'N' THEN 1 ELSE 0 END) AS RejectedLoans,
    COUNT(Loan_ID) AS TotalApplications
FROM
    loandata
GROUP BY
    Property_Area;
    SELECT
    Married,
    COUNT(Loan_ID) AS TotalApplicants,
    AVG(ApplicantIncome + CoapplicantIncome) AS AverageFamilyIncome,
    AVG(LoanAmount) AS AverageLoanRequested
FROM
    loandata
GROUP BY
    Married;
    