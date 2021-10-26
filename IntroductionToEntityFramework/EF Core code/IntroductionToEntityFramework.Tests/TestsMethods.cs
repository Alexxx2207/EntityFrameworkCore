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
        public void TestGetEmployeesInPeriod()
        {
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand query = new SqlCommand(@"SELECT TOP(40) e.FirstName [eF], e.LastName [eL], m.FirstName [mF], m.LastName [mL], p.Name, p.StartDate, p.EndDate FROM Employees e JOIN Employees m on m.EmployeeID = e.ManagerID JOIN EmployeesProjects ep ON ep.EmployeeID = e.EmployeeID JOIN Projects p ON ep.ProjectID = p.ProjectID WHERE (SELECT COUNT(*) FROM Projects pp JOIN EmployeesProjects epp ON epp.ProjectID = pp.ProjectID WHERE YEAR(pp.StartDate) BETWEEN 2001 AND 2003 AND e.EmployeeID = epp.EmployeeID) > 0 ORDER BY e.EmployeeID", conn);
                SqlDataReader reader = query.ExecuteReader();

                string currentName = "";

                while (reader.Read())
                {
                    if (currentName != reader["eF"].ToString() + reader["eL"].ToString())
                    {
                        expected.AppendLine($"{reader["eF"]} {reader["eL"]} - Manager: {reader["mF"]} {reader["mL"]}");
                        currentName = reader["eF"].ToString() + reader["eL"].ToString();
                    }
                    if(reader["EndDate"].ToString() == "")
                        expected.AppendLine($"--{reader["Name"]} - {reader["StartDate"]} - not finished");

                    else
                        expected.AppendLine($"--{reader["Name"]} - {reader["StartDate"]} - {reader["EndDate"]}");
                }
                reader.Close();
                conn.Close();
                conn.Dispose();
            }

            string actual = StartUp.GetEmployeesInPeriod(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }

        [Test]
        public void TestGetAddressesByTown()
        {
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand query = new SqlCommand(@"SELECT TOP(10) a.AddressText, t.Name, COUNT(e.EmployeeId) as [Count] FROM Addresses a JOIN Towns t ON t.TownID = a.TownID JOIN Employees e ON e.AddressID = a.AddressID GROUP BY a.AddressText, t.Name ORDER BY COUNT(e.EmployeeId) DESC, t.Name, a.AddressText", conn);
                SqlDataReader reader = query.ExecuteReader();

                while (reader.Read())
                {
                    expected.AppendLine($"{reader["AddressText"]}, {reader["Name"]} - {reader["Count"]} employees");
                }
                reader.Close();
                conn.Close();
                conn.Dispose();
            }

            string actual = StartUp.GetAddressesByTown(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }

        [Test]
        public void TestGetEmployee147()
        {
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand query = new SqlCommand(@"SELECT TOP(40) e.FirstName [eF], e.LastName [eL], e.JobTitle , p.Name FROM Employees e JOIN Employees m on m.EmployeeID = e.ManagerID JOIN EmployeesProjects ep ON ep.EmployeeID = e.EmployeeID JOIN Projects p ON ep.ProjectID = p.ProjectID WHERE e.EmployeeID = 147 ORDER BY P.Name", conn);
                SqlDataReader reader = query.ExecuteReader();
                reader.Read();
                expected.AppendLine($"{reader["eF"]} {reader["eL"]} - {reader["JobTitle"]}");
                expected.AppendLine($"{reader["Name"]}");
                while (reader.Read())
                {
                    expected.AppendLine($"{reader["Name"]}");
                }
                reader.Close();
                conn.Close();
                conn.Dispose();
            }

            string actual = StartUp.GetEmployee147(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }

        [Test]
        public void TestGetDepartmentsWithMoreThan5Employees()
        {
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand query = new SqlCommand(@"SELECT *, e.FirstName, e.LastName, e.JobTitle, m.FirstName [mf], m.LastName [ml] FROM (SELECT d.DepartmentId dd, d.Name, d.ManagerID, COUNT(e.EmployeeID) [Count] FROM Departments d JOIN Employees e ON d.DepartmentID = e.DepartmentID GROUP BY d.DepartmentId, d.Name, d.ManagerID) AS t JOIN Employees e ON t.dd = e.DepartmentID JOIN Employees m ON m.EmployeeID = t.ManagerID WHERE [Count] > 5 ORDER BY [Count], t.Name, E.FirstName, E.LastName", conn);
                SqlDataReader reader = query.ExecuteReader();

                int depId = -1;
                string curentName = "";

                while (reader.Read())
                {
                    if (depId != int.Parse(reader["dd"].ToString()))
                    {
                        expected.AppendLine($"{reader["Name"]} - {reader["mf"]} {reader["ml"]}");
                        depId = int.Parse(reader["dd"].ToString());
                    }
                    if (curentName != reader["FirstName"].ToString() + reader["LastName"].ToString())
                    {
                        expected.AppendLine($"{reader["FirstName"]} {reader["LastName"]} - {reader["JobTitle"]}");
                        curentName = reader["FirstName"].ToString() + reader["LastName"].ToString();
                    }
                }
                reader.Close();
                conn.Close();
                conn.Dispose();
            }

            string actual = StartUp.GetDepartmentsWithMoreThan5Employees(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }

        [Test]
        public void TestGetLatestProjects()
        {
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand query = new SqlCommand(@"SELECT * FROM (SELECT TOP(10) * FROM Projects ORDER BY StartDate DESC) AS t ORDER BY t.[Name]", conn);
                SqlDataReader reader = query.ExecuteReader();

                while (reader.Read())
                {
                    expected.AppendLine($"{reader["Name"]}");
                    expected.AppendLine($"{reader["Description"]}");
                    expected.AppendLine($"{reader["StartDate"]:M/d/yyyy h:mm:ss tt}");
                }

                reader.Close();
                conn.Close();
                conn.Dispose();
            }

            string actual = StartUp.GetLatestProjects(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }

        [Test]
        public void TestIncreaseSalaries()
        {
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                new SqlCommand(@"UPDATE Employees
	                                SET Salary *= 1.12
	                            WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services'))", conn).ExecuteNonQuery();

                SqlCommand getEmps = new SqlCommand(@"SELECT FirstName, LastName, Salary FROM Employees WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')) ORDER BY FirstName, LastName", conn);
                SqlDataReader reader = getEmps.ExecuteReader();

                while (reader.Read())
                {
                    expected.AppendLine($"{reader["FirstName"]} {reader["LastName"]} (${reader["Salary"]:f2})");
                }
                reader.Close();

                new SqlCommand(@"UPDATE Employees
	                                SET Salary /= 1.12
	                            WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services'))", conn).ExecuteNonQuery();


                conn.Close();
                conn.Dispose();
            }


           
            string actual = StartUp.IncreaseSalaries(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }

        [Test]
        public void TestGetEmployeesByFirstNameStartingWithSa()
        {
            var expected = new StringBuilder();

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand query = new SqlCommand(@"SELECT FirstName, LastName, JobTitle, Salary FROM Employees WHERE LEFT(FirstName, 2) = 'Sa' ORDER BY FirstName, LastName", conn);
                SqlDataReader reader = query.ExecuteReader();

                while (reader.Read())
                {
                    expected.AppendLine($"{reader["FirstName"]} {reader["LastName"]} - {reader["JobTitle"]} - (${reader["Salary"]:f2})");
                }

                reader.Close();
                conn.Close();
                conn.Dispose();
            }

            string actual = StartUp.GetEmployeesByFirstNameStartingWithSa(new SoftUni.Data.SoftUniContext());
            Assert.AreEqual(expected.ToString(), actual);
        }
    }
}