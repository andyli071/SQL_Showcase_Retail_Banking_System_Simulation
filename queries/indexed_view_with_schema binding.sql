--Task Description:
/*Create a clustered index (View) to store customer account details, including customer id, full name, account balance.*/

CREATE VIEW CustomerAccounts
WITH SCHEMABINDING
AS
SELECT c.Customer_ID,c.First_name, c.Last_name, a.Account_number, a.Account_type, a.Account_balance, COUNT_BIG(*) as cnt
FROM dbo.Customers c
JOIN dbo.Accounts a ON c.Customer_ID = a.Customer_ID
GROUP BY c.Customer_ID, c.First_name, c.Last_name, a.Account_number, a.Account_type, a.Account_balance;

CREATE UNIQUE CLUSTERED INDEX IX_CustomerAccounts
ON dbo.CustomerAccounts(Customer_ID, Account_balance);

SELECT*FROM dbo.CustomerAccounts;

--Execution statement:
SELECT*FROM dbo.CustomerAccounts;
