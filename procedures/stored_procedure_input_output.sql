/*Store procedure uses input and output parameters. Return the updated loan amount with two
input parameters: loan number and extra payment.*/

CREATE PROCEDURE PayDownPrincipleAmount
  @LoanNumber VARCHAR(20),
  @ExtraPayment DECIMAL(18,2),
  @RemainingLoanAmount DECIMAL(18,2) OUTPUT
AS
BEGIN
---- check if loan account exists---
  IF EXISTS (SELECT 1 FROM Loans WHERE Loan_number = @LoanNumber)
  BEGIN
    UPDATE Loans
    SET Principal_amount = Principal_amount - @ExtraPayment
    WHERE Loan_number = @LoanNumber;

    SELECT @RemainingLoanAmount = Principal_amount
    FROM Loans
    WHERE Loan_number = @LoanNumber;
  END
  ELSE
  BEGIN
    PRINT 'Can not find loan number ' + CAST(@LoanNumber AS VARCHAR(20)) + '.';
  END
END;

--Execution statement:
DECLARE @RemainingLoanAmount DECIMAL(18,2);

EXEC PayDownPrincipleAmount
@LoanNumber = 'L901-M',
@ExtraPayment = 5000,
@RemainingLoanAmount = @RemainingLoanAmount OUTPUT;

PRINT 'Remaining loan amount: $ ' + CAST(@RemainingLoanAmount AS VARCHAR(20)) + '.';
----- change Loan Number to L901-A, which is not exist in the table----

DECLARE @RemainingLoanAmount DECIMAL(18,2);

EXEC PayDownPrincipleAmount
@LoanNumber = 'L901-A',
@ExtraPayment = 5000,
@RemainingLoanAmount = @RemainingLoanAmount OUTPUT;
PRINT 'Remaining loan amount: $ ' + CAST(@RemainingLoanAmount AS VARCHAR(20)) + '.';
