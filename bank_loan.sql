/*Total Loan Applications*/

SELECT COUNT(id) AS Total_Applications
FROM financial_loan;

/*Total Funded Amount*/

SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan;

/*Total Amount Received*/

SELECT SUM(total_payment) AS Total_Amount_Collected
FROM financial_loan;

/*Average Interest Rate*/

SELECT ROUND(AVG(int_rate) * 100, 2) AS Avg_Int_Rate
FROM financial_loan;

/*Average DTI*/

SELECT ROUND(AVG(dti) * 100, 2) AS Avg_DTI
FROM financial_loan;

/*MTD (December 2021)*/

SELECT COUNT(id) AS MTD_Total_Applications
FROM financial_loan
WHERE MONTH(issue_date) = 12
AND YEAR(issue_date) = 2021;

/*PMTD (Previous Month)*/

SELECT COUNT(id) AS PMTD_Total_Applications
FROM financial_loan
WHERE MONTH(issue_date) = 11
AND YEAR(issue_date) = 2021;



/*Good Loan Percentage*/

SELECT 
    ROUND(
        SUM(CASE 
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 1 
            ELSE 0 
        END) * 100 / COUNT(*),
    2) AS Good_Loan_Percentage
FROM financial_loan;


/*Bad Loan Percentage*/

SELECT 
    ROUND(
        SUM(CASE 
            WHEN loan_status = 'Charged Off' THEN 1 
            ELSE 0 
        END) * 100 / COUNT(*),
    2) AS Bad_Loan_Percentage
FROM financial_loan;


/*Loan Status Summary*/

SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    ROUND(AVG(int_rate) * 100, 2) AS Interest_Rate,
    ROUND(AVG(dti) * 100, 2) AS DTI
FROM financial_loan
GROUP BY loan_status;

/*MONTHLY TREND*/

SELECT 
    MONTH(issue_date) AS Month_Number,
    MONTHNAME(issue_date) AS Month_Name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

/*STATE*/

SELECT 
    address_state AS State,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state;

/*TERM*/

SELECT 
    term,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term;

/*EMPLOYEE LENGTH*/

SELECT 
    emp_length,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length;


/*PURPOSE*/

SELECT 
    purpose,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose;

/*HOME OWNERSHIP*/

SELECT 
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;


/*Grade A Filter*/

SELECT 
    purpose,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;