/* 1. What is each customer's total net worth?*/
SELECT 
  c.Customer_ID,
  c.First_name,
  c.Last_name,
  COALESCE(SUM(a.Account_balance), 0) AS Total_Account_Balance,
  COALESCE(SUM(l.Principal_amount), 0) AS Total_Loan_Debt,
  COALESCE(SUM(a.Account_balance), 0)- COALESCE(SUM(l.Principal_amount), 0) AS Net_Worth
FROM Customers c
LEFT JOIN Accounts a ON c.Customer_ID = a.Customer_ID
LEFT JOIN Loans l ON c.Customer_ID = l.Customer_ID
GROUP BY c.Customer_ID, c.First_name, c.Last_name;

/* 2. Who made transactions above the average amount?*/
SELECT
  c.First_name,
  c.Last_name,
  a.Customer_ID,
  t.Amount,
  CAST(ROUND((SELECT AVG(Amount) FROM Transactions), 2) AS DECIMAL(10,2)) AS Avg_Transaction_Amount
FROM Transactions t
JOIN Accounts a ON t.account_number = a.account_number
JOIN Customers c ON a.customer_ID = c.customer_ID
WHERE t.Amount > (
    SELECT AVG(Amount)
    FROM Transactions
);

/* 3. Which accounts are below the minimum balance ($150) and should incur monthly fees?*/
SELECT * FROM Accounts
WHERE Account_balance < 150;

/* 4. How much principal remains on each loan after 12 payment?*/
SELECT 
  Loan_number,
  Loan_type,
  Principal_amount,
  CASE 
    WHEN Principal_amount - (Monthly_payment_amount * 12) < 0 THEN 'Pay Off'
    ELSE CAST(Principal_amount - (Monthly_payment_amount * 12) AS VARCHAR)
  END AS Estimated_Remaining_Principal
FROM Loans;
