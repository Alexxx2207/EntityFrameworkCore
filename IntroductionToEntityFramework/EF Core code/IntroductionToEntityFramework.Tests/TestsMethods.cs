using NUnit.Framework;
using System.Text;
using Microsoft.Data.SqlClient;
using SoftUni;

namespace IntroductionToEntityFramework.Tests
{
    public class Tests
    {

        private StringBuilder sb;
        private string connectionString;

        [SetUp]
        public void Setup()
        {
            sb = new StringBuilder();
            connectionString = ConnectionStringInfo.ConnectionString;
        }

        [Test]
        public void TestGetEmployeesFullInformation()
        {
            using (var conn = new SqlConnection(connectionString))
            {
                SqlCommand query = new SqlCommand(@"", conn);
            }
            Assert.Pass();
        }
    }
}