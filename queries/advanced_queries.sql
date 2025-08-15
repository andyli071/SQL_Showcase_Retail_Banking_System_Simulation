/* Calculate the total balance for each customer across all their accounts */
SELECT c.first_name, c.Last_name, SUM(a.Account_balance) AS "Total Account Balance"
FROM Customers AS c
JOIN Accounts AS a ON c.Customer_ID = a. Customer_ID
GROUP BY c.First_name, c.Last_name
ORDER BY [Total Account Balance];

/* Find the customer who have less than $2000 in accounts and have more than
$5000 loan*/
SELECT c.First_name, c.Last_name, a.account_balance, l.Principal_amount
FROM Customers AS c
JOIN Accounts AS a ON c.Customer_ID = a.Customer_ID
JOIN Loans AS l ON c.Customer_ID = l.Customer_ID
WHERE a.Account_balance < 2000 AND l.Principal_amount > 5000;

/* Find customers who don't have loans*/
SELECT CONCAT(c.First_name, ' ', c.Last_name) AS "Full Name"
FROM Customers AS c
LEFT JOIN Loans AS l ON c.Customer_ID = l.Customer_ID
WHERE l.Loan_number IS NULL;

/* Find customer who have loan account, and have a transaction greater than the
overall average transcation amount*/
SELECT c.first_name, c.last_name, t.Amount
FROM Customers AS c
JOIN Loans AS l ON c.Customer_ID = l.Customer_ID
JOIN Accounts AS a ON c.Customer_ID = a.Customer_ID
JOIN Transactions AS t on a.Account_number = t.Account_number
WHERE t.Amount >
  (SELECT AVG(Amount)
  FROM Transactions
  );

/* List the customer id that have both 'chequing' and 'savings' account*/
SELECT c.Customer_ID, c.First_name, c.Last_name
FROM Customers AS c
JOIN Accounts AS a ON c.Customer_ID = a.Customer_ID
WHERE a.Account_type IN ('chequing', 'saving')
GROUP BY c.Customer_ID, c.First_name, c.Last_name
HAVING COUNT(DISTINCT a.Account_type) = 2;
