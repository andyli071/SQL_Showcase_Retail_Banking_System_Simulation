# Retail Banking System Simulation

This project simulates a simple retail banking system using SQL. It includes table design, sample data, stored procedures, error handling, transactions, and reporting queries. The goal is to show real-world SQL skills for data analysis and backend logic.

---

## Key Features

- Relational schema with realistic banking entities (Customers, Accounts, Transactions, Loans)
- Advanced SQL queries: joins, CTEs, subqueries, aggregation, window functions
- Stored procedures with error handling (`TRY...CATCH`), parameter passing, and conditional logic
- Transactional control using `BEGIN`, `ROLLBACK`, and `COMMIT`
- Views, including **indexed views with `SCHEMABINDING`** (SQL Server only)

---

## Folder Guide

| Folder         | Description |
|----------------|-------------|
| `schema`      | Create table statements and ERD |
| `queries`     | Basic to advanced SQL queries for analytics and data extraction |
| `procedures`  | Stored procedures, error-handling logic, transaction blocks |
| `sample_business_questions`  | Sample questions, sql queries, screenshot output  |

---

## Sample Business Questions Answered

- What is each customer's total net worth?
- Who made transactions above the average amount?
- Which accounts are below the minimum balance and should incur monthly fees?
- How much principal remains on each loan after payment?

---

## Tools Used

- SQL Server (T-SQL)
- Compatible with: PostgreSQL, SQLite (with minor syntax adjustments)
- Database: SSMS
---

## 📄 License

MIT License

---

## 👤 Author

Andy Li  
[LinkedIn](https://www.linkedin.com/in/andylikawing/) | [GitHub](https://github.com/andyli071])

