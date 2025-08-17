/* Create a store procedure (AccountMonthlyFee) to update account table. If the account has less than $1000 in the chqeuing account, deduct $5 monthly fees. If it the 
account have more than $1000 in the chequing account, print ‘Account has meet the minimum balance requirement’. Otherwise, print ‘Account is not a chequing account,
no fee applied.’. */

CREATE PROCEDURE AccountMonthlyFee @AccountNumber INT
AS
BEGIN
DECLARE @AccountBalance DECIMAL (18,2); DECLARE @AccountType VARCHAR(10);

  SELECT @AccountBalance = Account_Balance, @AccountType = Account_type
  FROM Accounts
  WHERE Account_number = @AccountNumber;

  IF @AccountType = 'chequing' AND @AccountBalance < 1000
  BEGIN
    UPDATE Accounts
    SET Account_balance = Account_balance - 5
    WHERE Account_number = @AccountNumber;
    PRINT 'Monthly fee is deducted. To avoid, please maintain $1000 minimum balance.';
  END
  ELSE IF @AccountType = 'chequing' AND @AccountBalance >= 1000
  BEGIN
    PRINT 'Account meets $1000 minimum balance requirement, no fee applied.';
  END
  ELSE
  BEGIN
    PRINT 'This is not a chequing account, no fee applied.';
  END
END;

--Execution statement:-- 
EXEC AccountMonthlyFee @AccountNumber = '1001';
EXEC AccountMonthlyFee @AccountNumber = '1005';
EXEC AccountMonthlyFee @AccountNumber = '1006';
SELECT*FROM Accounts;
