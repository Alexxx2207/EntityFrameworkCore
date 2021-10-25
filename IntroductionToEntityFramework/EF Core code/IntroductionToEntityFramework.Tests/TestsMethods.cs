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
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand query = new SqlCommand(@"SELECT FirstName, LastName, MiddleName, JobTitle, Salary FROM Employees ORDER BY EmployeeID", conn);
                SqlDataReader reader = query.ExecuteReader();

                while (reader.Read())
                {
                    if(reader["MiddleName"] != null)
                        expected.AppendLine($"{reader["FirstName"]} {reader["LastName"]} {reader["MiddleName"]} {reader["JobTitle"]} {reader["Salary"]:f2}");
                    else
                        expected.AppendLine($"{reader["FirstName"]} {reader["LastName"]} {reader["JobTitle"]} {reader["Salary"]:f2}");
                }
                reader.Close();
                conn.Close();
                conn.Dispose();
            }

            string actual = StartUp.GetEmployeesFullInformation(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }

        [Test]
        public void TestGetEmployeesWithSalaryOver50000()
        {
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand query = new SqlCommand(@"SELECT FirstName, Salary FROM Employees WHERE Salary > 50000 ORDER BY FirstName", conn);
                SqlDataReader reader = query.ExecuteReader();

                while (reader.Read())
                {
                    expected.AppendLine($"{reader["FirstName"]} - {reader["Salary"]:f2}");
                }
                reader.Close();
                conn.Close();
                conn.Dispose();
            }

            string actual = StartUp.GetEmployeesWithSalaryOver50000(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }

        [Test]
        public void TestGetEmployeesFromResearchAndDevelopment()
        {
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand query = new SqlCommand(@"SELECT FirstName, LastName, D.[Name] ,Salary FROM Employees E JOIN Departments D ON e.DepartmentID = D.DepartmentID WHERE D.Name = 'Research and Development' ORDER BY Salary, FirstName DESC", conn);
                SqlDataReader reader = query.ExecuteReader();

                while (reader.Read())
                {
                    expected.AppendLine($"{reader["FirstName"]} {reader["LastName"]} from {reader["Name"]} - ${reader["Salary"]:f2}");
                }
                reader.Close();
                conn.Close();
                conn.Dispose();
            }

            string actual = StartUp.GetEmployeesFromResearchAndDevelopment(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }

        [Test]
        public void TestAddNewAddressToEmployee()
        {
            var expected = new StringBuilder();
            string actual = "";
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                actual = StartUp.AddNewAddressToEmployee(new SoftUni.Data.SoftUniContext());

                SqlCommand addressInfo = new SqlCommand(@"SELECT TOP(1) AddressId, AddressText, TownId FROM Addresses ORDER BY AddressID DESC", conn);
                SqlDataReader addressInfoReader = addressInfo.ExecuteReader();

                addressInfoReader.Read();
                var addressId = addressInfoReader["AddressId"];
                Assert.AreEqual(addressInfoReader["AddressText"].ToString() + " " + addressInfoReader["TownId"].ToString(), "Vitoshka 15 4");               
                addressInfoReader.Close();

                SqlCommand nakovAddress = new SqlCommand(@"SELECT AddressId FROM Employees WHERE LastName = 'Nakov'", conn);
                SqlDataReader nakovAddressReader = addressInfo.ExecuteReader();

                nakovAddressReader.Read();

                Assert.AreEqual(nakovAddressReader["AddressId"], addressId);
                nakovAddressReader.Close();

                SqlCommand endResult = new SqlCommand(@"SELECT TOP(10) a.AddressText FROM Employees e JOIN Addresses a ON e.AddressID = a.AddressID ORDER BY a.AddressID DESC", conn);
                SqlDataReader endResultReader = endResult.ExecuteReader();

                while (endResultReader.Read())
                {
                    expected.AppendLine(endResultReader["AddressText"].ToString());
                }
                endResultReader.Close();
                
                conn.Close();
                conn.Dispose();
            }

            Assert.AreEqual(expected.ToString(), actual);
        }

        /// 7 ex 
    }
}