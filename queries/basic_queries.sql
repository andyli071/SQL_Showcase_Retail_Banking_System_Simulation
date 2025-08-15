/* 1. Retrieve all information for all customers*/
SELECT * FROM Customers;

/* 2. Retrieve customer FULL NAME, and their account numbers, types*/
SELECT CONCAT(c.First_name, ' ', c.Last_name) AS "Full Name",
a.Account_number, a.Account_type
FROM Accounts AS a
JOIN Customers AS c ON a.Customer_ID = c.Customer_ID;

/*3. Retrieve account number, transcation date, transcation amount, and type for
account 1001 */
SELECT Account_number, Transcation_date, Amount, Transcation_type
FROM Transactions
WHERE Account_number = '1001';

/*4. Retrieve full name, phone, email for customers who have a chequing account*/
SELECT DISTINCT CONCAT(c.First_name, ' ', c.Last_name) AS "Full Name",
c.phone, c.email
FROM Customers AS c
JOIN Accounts AS a ON c.Customer_ID = a.Customer_ID;

/*5. Retrieve all loan information with an principal balance more than 1000*/
SELECT * FROM Loans
WHERE Principal_amount > 1000;
