namespace CreditCare.Models
{
    /// <summary>
    /// Represents a bank account with basic operations.
    /// </summary>
    public class BankAccount
    {
        /// <summary>
        /// Gets the account number.
        /// </summary>
        public string AccountNumber { get; }

        /// <summary>
        /// Gets the balance of the account.
        /// </summary>
        public decimal Balance { get; private set; }

        /// <summary>
        /// Gets the owner of the account.
        /// </summary>
        public string Owner { get; }

        /// <summary>
        /// Initializes a new instance of the <see cref="BankAccount"/> class.
        /// </summary>
        /// <param name="accountNumber">The account number.</param>
        /// <param name="owner">The owner of the account.</param>
        /// <param name="initialBalance">The initial balance of the account.</param>
        public BankAccount(string accountNumber, string owner, decimal initialBalance)
        {
            AccountNumber = accountNumber;
            Owner = owner;
            Balance = initialBalance;
        }

        /// <summary>
        /// Deposits the specified amount into the account.
        /// </summary>
        /// <param name="amount">The amount to deposit.</param>
        public void Deposit(decimal amount)
        {
            if (amount <= 0)
            {
                throw new ArgumentException("Deposit amount must be positive", nameof(amount));
            }

            Balance += amount;
        }

        /// <summary>
        /// Withdraws the specified amount from the account.
        /// </summary>
        /// <param name="amount">The amount to withdraw.</param>
        public void Withdraw(decimal amount)
        {
            if (amount <= 0)
            {
                throw new ArgumentException("Withdrawal amount must be positive", nameof(amount));
            }

            if (amount > Balance)
            {
                throw new InvalidOperationException("Insufficient funds");
            }

            Balance -= amount;
        }
    }
}
