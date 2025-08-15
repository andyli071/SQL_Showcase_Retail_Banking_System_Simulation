-- Task Description:
/*Create a virtual table (View) to store customer net worth, including customer id, full
name, total account balance, total loan Amount, and total net worth. 
Assumption:
Total account balance = total of accounts balance for the same customer.
Total loan amount = total of the loan principle amount for the same customer.
Total net worth = total account balance – total loan amount. */

CREATE VIEW CustomerNetWorth
AS
SELECT 
  c.Customer_ID,
  CONCAT(c.First_name, ' ', c.Last_name) AS ‘Full Name’,
  SUM(a.Account_balance) AS ‘Total Account Balance’,
  SUM(l.Principal_amount) AS ‘Total Loan Amount’,
  SUM(a.Account_balance) - SUM(ISNULL(l.Principal_amount, 0)) AS ‘Total Net Worth’
FROM Customers c
LEFT JOIN Accounts a ON c.Customer_ID = a.Customer_ID
LEFT JOIN Loans l ON c.Customer_ID = l.Customer_ID
GROUP BY c.Customer_ID, c.First_name, c.Last_name;

-- Execution statement:
SELECT*FROM CustomerNetWorth;
