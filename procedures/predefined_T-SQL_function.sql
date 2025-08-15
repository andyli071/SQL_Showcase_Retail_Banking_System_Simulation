--Task Description:
/*Create a MSTV (Multi-statement Table-Valued) function that returns the balance status for each account for a specific account number. The status for balance less than $1000 is categorized as low. 
Balance that is in between $1001 and $3000 are categorized as Normal balance status. Balance withnmore than $3001 is categorized at Heathy balance status.*/

CREATE FUNCTION dbo.AccountBalanceStatus(@AccountNumber INT)
RETURNS @AccountStatus TABLE(AccountNumber INT, AccountBalance DECIMAL(18,2), BalanceStatus VARCHAR(20))
AS
BEGIN
  INSERT INTO @AccountStatus(AccountNumber, AccountBalance, BalanceStatus)
  SELECT a.Account_number, a.Account_balance,
  CASE
    WHEN a.Account_balance <= 1000 THEN 'Low'
    WHEN a.Account_balance <= 3000 THEN 'Normal'
    ELSE 'Healthy'
  END
  FROM Accounts a
  WHERE a.Account_number = @AccountNumber
  RETURN;
END;

-- Execution statement:
SELECT*FROM dbo.AccountBalanceStatus('1001');
SELECT*FROM dbo.AccountBalanceStatus('1005');
SELECT*FROM dbo.AccountBalanceStatus('1006')
