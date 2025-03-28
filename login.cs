using System;
using System.Data.SQLite;

namespace CreditCare.Models
{
    public class LoginManager
    {
        private string _dbName;
        private SQLiteConnection _connection;

        public LoginManager(string dbName)
        {
            _dbName = dbName;
            _connection = null;
        }

        private void ConnectToDb()
        {
            _connection = new SQLiteConnection($"Data Source={_dbName};Version=3;");
            _connection.Open();
        }

        public bool Login(string username, string password)
        {
            try
            {
                ConnectToDb();

                string query = $"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'";
                using (var command = new SQLiteCommand(query, _connection))
                {
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return true; // Login successful
                        }
                        else
                        {
                            return false; // Login failed
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions (e.g., log the error)
                Console.WriteLine($"An error occurred: {ex.Message}");
                return false;
            }
            finally
            {
                _connection?.Close();
            }
        }
    }
}