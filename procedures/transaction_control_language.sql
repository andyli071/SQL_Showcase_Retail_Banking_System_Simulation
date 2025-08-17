/*Demonstrate the use of TCL and simulate a monthly loan payment.
If loan accounts exists and account have enough balance, complete the payment transaction. If not print out error message.*/

DECLARE @AccountNumber INT = 1006;
DECLARE @LoanNumber VARCHAR(20) = 'L903-PL';
DECLARE @PaymentAmount DECIMAL(18,2);
DECLARE @AccountBalance DECIMAL(18,2);

BEGIN TRANSACTION;
BEGIN TRY
---- check if loan account exists ---
  IF NOT EXISTS (SELECT 1 FROM Loans WHERE Loan_number = @LoanNumber)
  BEGIN
    THROW 51000, 'Loan does not exist.',1;
  END
--- retrieve monthly payment from loan table--
  SELECT @PaymentAmount = Monthly_payment_amount
  FROM Loans
  WHERE Loan_number = @LoanNumber
---- retrieve account balance from account table---
  SELECT @Accountbalance = Account_balance
  FROM Accounts
  WHERE Account_number = @AccountNumber;
---compare payment amount with account balance —-
  IF @PaymentAmount > @Accountbalance
  BEGIN
    THROW 52000, 'Insufficient fund, payment can not complete.', 1;
  END
  UPDATE Accounts
  SET Account_balance = Account_balance - @PaymentAmount
  WHERE Account_number = @AccountNumber;

  UPDATE Loans
  SET Principal_amount = Principal_amount - @PaymentAmount
  WHERE Loan_number = @LoanNumber;

  COMMIT TRANSACTION;
    PRINT 'Monthly payment successful. $' + CAST(@PaymentAmount AS VARCHAR(20)) + ' was deducted from account ' + CAST(@AccountNumber AS VARCHAR(20)) + '.';
END TRY
BEGIN CATCH
  ROLLBACK TRANSACTION;
    PRINT 'ERROR: ' + ERROR_MESSAGE();
END CATCH

-- Execution statement:
SELECT * FROM Accounts;
SELECT * FROM Loans;
