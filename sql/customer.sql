/*
This T-SQL script defines the schema and stored procedures for a small financial institution's database. 
Details:
- The database stores customer information, account information, transaction information, and credit card information.
- Use 'GO' to separate each action.
- Each table must record the create date and update date.
- Use 'PRINT' to display messages.
- Use 'BEGIN TRANSACTION', 'COMMIT TRANSACTION', and 'ROLLBACK TRANSACTION' for transaction handling.
- Use 'BEGIN TRY' and 'BEGIN CATCH' for error handling.
Security:
- The credit card number must be encrypted using SQL Server's built-in encryption functions.

Steps:

1) Check if the database 'CreditCareDB' exists, if it does exist, drop it and create a new one with appropriate options (e.g., collation, recovery model).

2) Set the default database to 'CreditCareDB'.

3) Create a master encryption key.
- Prompt for a master key encryption password using a secure method.

4) Create a certificate.
- Prompt for a subject which will be used to identify the certificate using a secure method.

5) Create a symmetric encryption key.
- Use AES_256 algorithm to encrypt the credit card number.

6) Create the Customer table which stores customer information:
- CustomerID: Primary key, auto-incremented.
- FirstName: Customer's first name, cannot be null.
- LastName: Customer's last name, cannot be null.
- Email: Customer's email, must be unique and cannot be null.
- PhoneNumber: Customer's phone number, cannot be null.
- CreateDate: Date and time the record was created, default to current date and time.
- UpdateDate: Date and time the record was last updated, default to current date and time.

7) Create the Account table which stores account information:
- AccountID: Primary key, auto-incremented.
- CustomerID: Foreign key referencing CustomerID in the Customer table, cannot be null.
- AccountNumber: Unique account number, cannot be null.
- AccountType: Type of account (e.g., Checking, Savings), cannot be null.
- Balance: Current balance in the account, cannot be null.
- CreateDate: Date and time the record was created, default to current date and time.
- UpdateDate: Date and time the record was last updated, default to current date and time.
- Foreign Key Constraint: Ensures referential integrity with the Customer table.

8) Create the Transfer table which stores transaction information:
- TransactionID: Primary key, auto-incremented.
- AccountID: Foreign key referencing AccountID in the Account table, cannot be null.
- TransactionType: Type of transaction (Deposit or Withdrawal), cannot be null.
- Amount: Amount of the transaction, cannot be null.
- TransactionDate: Date and time of the transaction, cannot be null.
- CreateDate: Date and time the record was created, default to current date and time.
- UpdateDate: Date and time the record was last updated, default to current date and time.
- Foreign Key Constraint: Ensures referential integrity with the Account table.

9) Create the CreditCard table which stores credit card information:
- CreditCardID: Primary key, auto-incremented.
- CustomerID: Foreign key referencing CustomerID in the Customer table, cannot be null.
- CardNumber: Unique encrypted credit card number, cannot be null.
- CardType: Type of credit card (Visa or MasterCard), cannot be null.
- ExpiryDate: Expiry date of the credit card, cannot be null.
- CreateDate: Date and time the record was created, default to current date and time.
- UpdateDate: Date and time the record was last updated, default to current date and time.
- Foreign Key Constraint: Ensures referential integrity with the Customer table.

10) Create the InsertCustomerAndAccount stored procedure which inserts a new customer, account, and initial transaction:
- Parameters: Accepts customer details, account details, and initial transaction details.
- Transaction Handling: Uses BEGIN TRANSACTION, COMMIT TRANSACTION, and ROLLBACK TRANSACTION to ensure atomicity.
- Error Handling: Uses BEGIN TRY and BEGIN CATCH blocks to handle errors and ensure the transaction is rolled back in case of an error.
- Parameter Validation: Validate all input parameters to ensure data integrity.
- Indexing: Create indexes on frequently queried columns to improve performance.
*/

