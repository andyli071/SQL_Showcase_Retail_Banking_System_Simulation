INSERT INTO Customers(Customer_ID, First_name, Last_name, Street_number, City, Street_name, Province, Postal_code, Phone, Email)
VALUES
('1', 'Tommy', 'Herring', '1504', 'W Hastings St', 'Vancouver', 'BC', 'V6G 3J4', '778 123 6044', 'tommy123@gmail.com'),
('2', 'Jennifer', 'Lo', '1556', 'Robson St', 'Vancouver', 'BC', 'V6G 1C3', '604 444 3214','jennifer0101@gmail.com'),
('3', 'Robert', 'Smith', '1611', 'Keith Rd', 'North Vancouver', 'BC', 'V7P 1Y9', '604 504 4040', 'robert456@gmail.com');

INSERT INTO Accounts(Account_number, Customer_ID, Account_type, Account_balance)
VALUES
('1001', '1', 'chequing', '100'),
('1005', '1', 'saving', '5000'),
('1006', '3', 'chequing', '3000');

INSERT INTO Transactions(Transaction_ID, Account_number, Transcation_date, Transcation_type, Amount)
VALUES
('01', '1001', 'June 01, 2025', 'Withdrawal', '50'),
('02', '1005', 'May 11, 2025', 'Bill Payment', '100'),
('03', '1006', 'May 29, 2025', 'Deposit', '1500');

INSERT INTO Loans(Loan_number, Customer_ID, Loan_type, Principal_amount, Interest_rate, Amortization_period, Monthly_payment_amount)
VALUES
('L901-M', '1', 'Mortgage', '250000', '3.75', '300', '1500'),
('L902-CL', '2', 'Car Loan', '5000', '7', '60', '700'),
('L903-PL', '3', 'Personal Loan', '10000', '5.50', '12', '450');
