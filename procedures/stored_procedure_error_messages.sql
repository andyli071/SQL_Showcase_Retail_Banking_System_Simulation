-- Task Description: --
/*Create stored procedure that store errorlog during updating interest rate in the loan table. */
  
-- create table errorlog--
CREATE TABLE ErrorLog(
  ErrorLogID INT IDENTITY(1,1) PRIMARY KEY,
  ErrorNumber INT,
  ErrorMessage NVARCHAR(4000),
  ErrorProcedure NVARCHAR(128),
  ErrorLine INT,
  ErrorDateTime DATETIME DEFAULT GETDATE()
);

---- create procedure---
CREATE PROCEDURE UpdateInterestRate 
  @LoanNumber VARCHAR(20), @NewInterestRate DECIMAL(4,2)
AS
BEGIN
  BEGIN TRY
    IF NOT EXISTS (SELECT 1 FROM Loans WHERE Loan_number = @LoanNumber)
    BEGIN
      THROW 50001, 'Loan not found.',1;
    END
    UPDATE Loans
    SET Interest_rate = @NewInterestRate
    WHERE Loan_number = @LoanNumber;
  END TRY
  BEGIN CATCH
    INSERT INTO ErrorLog(ErrorNumber, ErrorMessage, ErrorProcedure, ErrorLine)
    VALUES(Error_Number(), Error_Message(), Error_Procedure(), Error_Line());
  END CATCH
END;

-- Execution statement:-- 
EXEC UpdateInterestRate @LoanNumber = 'L901-N', @NewInterestRate = 4.00;
EXEC UpdateInterestRate @LoanNumber = 'L901-cc', @NewInterestRate = 4.00;
