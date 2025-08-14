# Banking System SQL Project

This project simulates a simplified **retail banking system** using SQL. It includes schema design, complex queries, stored procedures, user-defined functions, error handling, and transaction control. The goal is to model real-world banking operations such as account management, loan processing, and transaction tracking using industry-relevant SQL skills.

---

## Key Features

- Relational schema with realistic banking entities (Customers, Accounts, Transactions, Loans)
- Advanced SQL queries: joins, CTEs, subqueries, aggregation, window functions
- Stored procedures with error handling (`TRY...CATCH`), parameter passing, and conditional logic
- Transactional control using `BEGIN`, `ROLLBACK`, and `COMMIT`
- Views, including **indexed views with `SCHEMABINDING`** (SQL Server only)
- Synthetic dataset (~30K transactions) available for testing and analysis

---

## Folder Guide

| Folder         | Description |
|----------------|-------------|
| `schema/`      | Create table statements and ERD |
| `queries/`     | Basic to advanced SQL queries for analytics and data extraction |
| `procedures/`  | Stored procedures, error-handling logic, transaction blocks |
| `dataset/`     | CSV files for importing into your own SQL instance |
| `screenshots/` | Optional query result previews |

---

## Sample Business Questions Answered

- Which customers have both chequing and savings accounts?
- What is each customer's total net worth?
- Who made transactions above the average amount?
- Which accounts are below the minimum balance and should incur monthly fees?
- How much principal remains on each loan after payment?

---

## Tech Stack

- SQL Server (T-SQL)
- Compatible with: PostgreSQL, SQLite (with minor syntax adjustments)
- Tools used: Azure Data Studio / SSMS / DBeaver (any SQL client works)

---

## Dataset (Synthetic)

- `500` customers  
- `975` accounts  
- `28,574` transactions (12 months)  
- `242` loans  
> You can import via CSV into any SQL database.

---

## Setup Instructions

1. Create the schema using `schema/create_tables.sql`
2. Import the CSV files from `dataset/` into your SQL environment
3. Run queries from `queries/` or execute procedures from `procedures/`

---



## 📄 License

MIT License

---

## 👤 Author

Andy Li  
[LinkedIn](#) | [GitHub](#)

