/*Task Description:
Create a store procedure (WithdrawMoney) to show handling features and raises custom error message.
If account don’t exist, print error message. If account exist and withdraw amount more than account balance, 
print error message. Otherwise continue with the withdraw process and print message ‘Withdrawal successful’. */


CREATE PROCEDURE WithdrawMoney
  @AccountNumber INT, @WithdrawAmount DECIMAL(18,2)
AS
BEGIN
  DECLARE @AccountBalance DECIMAL(18,2)
  BEGIN TRY
    IF NOT EXISTS (SELECT 1 FROM Accounts WHERE Account_number = @AccountNumber)
      BEGIN
-- check if account exist
        THROW 51001, 'Account not exist. Try again.', 1;
      END
--- retrieve balance ---
    SELECT @AccountBalance = Account_balance
    FROM Accounts
    WHERE Account_number = @AccountNumber
-- check if there is enough money
    IF @WithdrawAmount > @AccountBalance
      BEGIN
        THROW 51002, 'Insufficient funds. Try again.', 1;
      END
--- if yes, update account balance-----
    UPDATE Accounts
    SET Account_balance = Account_balance - @WithdrawAmount
    WHERE Account_number = @AccountNumber;
    PRINT ('Withdrawal successful. Please take $' + CAST(@WithdrawAmount AS VARCHAR(10)) + ' from the ATM.');
  END TRY
  BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
  END CATCH
END;

--Execution statement:
EXEC WithdrawMoney @AccountNumber = 1003, @WithdrawAmount = 5000;
EXEC WithdrawMoney @AccountNumber = 1005, @WithdrawAmount = 10000;
EXEC WithdrawMoney @AccountNumber = 1006, @WithdrawAmount = 1000;

