
CREATE TABLE Customers(
  Customer_ID INT PRIMARY KEY,
  First_name VARCHAR(50),
  Last_name VARCHAR(50),
  Street_number VARCHAR(20),
  Street_name VARCHAR(50),
  City VARCHAR(150),
  Province VARCHAR(50),
  Postal_code VARCHAR(7),
  Phone VARCHAR(20),
  Email VARCHAR (50));

CREATE TABLE Accounts(
  Account_number INT PRIMARY KEY,
  Customer_ID INT,
  Account_type VARCHAR(50),
  Account_balance DECIMAL (18, 2),
  FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID));

CREATE TABLE Transactions(
  Transaction_ID INT PRIMARY KEY,
  Account_number INT,
  Transcation_date DATETIME,
  Transcation_type VARCHAR(50),
  Amount DECIMAL (18, 2),
  FOREIGN KEY (Account_number) REFERENCES Accounts(Account_number));

CREATE TABLE Loans(
  Loan_number VARCHAR(20) PRIMARY KEY,
  Customer_ID INT,
  Loan_type VARCHAR(50),
  Principal_amount DECIMAL (18, 2),
  Interest_rate DECIMAL (4,2),
  Amortization_period INT,
  Monthly_payment_amount DECIMAL (18,2),
  FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID));
