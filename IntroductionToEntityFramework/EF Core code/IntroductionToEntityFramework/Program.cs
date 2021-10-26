using SoftUni.Data;
using SoftUni.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SoftUni
{
    public class StartUp
    {
        //Employees Full Information
        public static string GetEmployeesFullInformation(SoftUniContext context)
        {
            StringBuilder sb = new StringBuilder();

            var emp = context.Employees.OrderBy(e => e.EmployeeId).ToList();

            foreach (var e in emp)
            {
                sb.AppendLine($"{e.FirstName} {e.LastName} {e.MiddleName} {e.JobTitle} {e.Salary:f2}");
            }

            return sb.ToString();
        }

        //Employees with Salary Over 50 000
        public static string GetEmployeesWithSalaryOver50000(SoftUniContext context)
        {
            var sb = new StringBuilder();

            var emps = context.Employees.Where(e => e.Salary > 50000).OrderBy(e => e.FirstName).ToList();

            foreach (var e in emps)
            {
                sb.AppendLine($"{e.FirstName} - {e.Salary:f2}");
            }

            return sb.ToString();
        }

        //Employees from Research and Development
        public static string GetEmployeesFromResearchAndDevelopment(SoftUniContext db)
        {
            var sb = new StringBuilder();

            var emps = db.Employees.Where(e => e.Department.Name == "Research and Development")
                .OrderBy(e => e.Salary)
                .ThenByDescending(x => x.FirstName)
                .Select(e => new { e.FirstName, e.LastName, e.Department, e.Salary })
                .ToList();

            foreach (var e in emps)
            {
                sb.AppendLine($"{e.FirstName} {e.LastName} from {e.Department.Name} - ${e.Salary:f2}");
            }

            return sb.ToString();
        }

        //Adding a New Address and Updating Employee
        public static string AddNewAddressToEmployee(SoftUniContext db)
        {
            var sb = new StringBuilder();

            var newAddress = new Address()
            {
                TownId = 4,
                AddressText = "Vitoshka 15"
            };

            if(db.Addresses.OrderByDescending(a => a.AddressId).FirstOrDefault().AddressText.ToString() != "Vitoshka 15" && db.Addresses.OrderByDescending(a => a.AddressId).FirstOrDefault().TownId.ToString() != "4")
                db.Addresses.Add(newAddress);
            db.SaveChanges();

            var emp = db.Employees.FirstOrDefault(e => e.LastName == "Nakov");

            emp.AddressId = newAddress.AddressId;
            db.SaveChanges();


            var empAdd = db.Employees
                    .OrderByDescending(e => e.Address.AddressId)
                    .Take(10)
                    .Select(e => e.Address).ToList();

            foreach (var e in empAdd)
            {
                sb.AppendLine(e.AddressText);
            }



            return sb.ToString();
        }

        //Employees and Projects
        public static string GetEmployeesInPeriod(SoftUniContext db)
        {
            var sb = new StringBuilder();

            int counter = 0;

            var employees = db.EmployeesProjects
                        .Where(ep => ep.Project.StartDate.Year >= 2001 && ep.Project.StartDate.Year <= 2003)
                        .Select(ep => new { ep.Employee.EmployeeId, ep.Employee.FirstName, ep.Employee.LastName, ep.Employee.Manager })
                        .Distinct()
                        .Take(10)
                        .ToList();

            foreach (var e in employees)
            {
                var projects = db.EmployeesProjects
                    .Where(ep => ep.Employee.EmployeeId == e.EmployeeId)
                    .Select(ep => new { ep.Project.Name, ep.Project.StartDate, ep.Project.EndDate })
                    .ToList();

                if (projects.Count > 0)
                {
                    var emp = new { e.FirstName, e.LastName, e.Manager };
                    sb.AppendLine($"{emp.FirstName} {emp.LastName} - Manager: {emp.Manager.FirstName} {emp.Manager.LastName}");

                    foreach (var ep in projects)
                    {
                        if (ep.EndDate is null)
                            sb.AppendLine($"--{ep.Name} - {ep.StartDate:M/d/yyyy h:mm:ss tt} - not finished");
                        else
                            sb.AppendLine($"--{ep.Name} - {ep.StartDate:M/d/yyyy h:mm:ss tt} - {(DateTime)ep.EndDate:M/d/yyyy h:mm:ss tt}");

                    }
                }
            }


            return sb.ToString();
        }

        //Addresses by Town
        public static string GetAddressesByTown(SoftUniContext db)
        {
            var sb = new StringBuilder();

            var addressesWithTown = db.Addresses
                    .Select(a => new { a.AddressId, a.AddressText, a.Town.Name })
                    .ToList();

            var peopleByAddress = addressesWithTown
                                    .Select(a => new
                                    {
                                        a.AddressText,
                                        a.Name,
                                        peopleCount = db.Employees.Where(e => e.AddressId == a.AddressId).ToList().Count()
                                    })
                                    .OrderByDescending(a => a.peopleCount)
                                    .ThenBy(a => a.Name)
                                    .ThenByDescending(a => a.peopleCount)
                                    .Take(10)
                                    .ToList();


            foreach (var result in peopleByAddress)
            {
                sb.AppendLine($"{result.AddressText}, {result.Name} - {result.peopleCount} employees");
            }

            return sb.ToString();
        }

        //Employee 147
        public static string GetEmployee147(SoftUniContext db)
        {
            var sb = new StringBuilder();

            var emp = db.Employees.Single(e => e.EmployeeId == 147);

            sb.AppendLine($"{emp.FirstName} {emp.LastName} - {emp.JobTitle}");

            var projects = db.EmployeesProjects
                            .Where(ep => ep.EmployeeId == 147)
                            .Select(p => new { p.Project.Name })
                            .OrderBy(projects => projects.Name);

            foreach (var p in projects)
            {
                sb.AppendLine($"{p.Name}");
            }

            return sb.ToString();
        }

        //Departments with More Than 5 Employees
        public static string GetDepartmentsWithMoreThan5Employees(SoftUniContext db)
        {
            var sb = new StringBuilder();

            var derp = db.Departments
                        .Where(d => db.Employees.Where(ed => ed.DepartmentId == d.DepartmentId).Count() > 5)
                        .OrderBy(d => db.Employees.Where(ed => ed.DepartmentId == d.DepartmentId).Count())
                        .ThenBy(d => d.Name)
                        .Select(d => new { d.DepartmentId, d.Name, d.Manager }).ToList();

            foreach (var d in derp)
            {
                sb.AppendLine($"{d.Name} - {d.Manager.FirstName} {d.Manager.LastName}");

                foreach (var emp in db.Employees.Where(ed => ed.DepartmentId == d.DepartmentId).OrderBy(e => e.FirstName).ThenBy(e => e.LastName).ToList())
                {
                    sb.AppendLine($"{emp.FirstName} {emp.LastName} - {emp.JobTitle}");
                }
            }
            return sb.ToString();
        }

        //Find Latest 10 Projects
        public static string GetLatestProjects(SoftUniContext db)
        {
            var sb = new  StringBuilder();

            var projects = db.Projects
                            .OrderByDescending(p => p.StartDate)
                            .Take(10)
                            .OrderBy(p => p.Name)
                            .Select(p => new { p.Name, p.Description, p.StartDate})
                            .ToList();

            foreach (var p in projects)
            {
                sb.AppendLine($"{p.Name}");
                sb.AppendLine($"{p.Description}");
                sb.AppendLine($"{p.StartDate:M/d/yyyy h:mm:ss tt}");
            }

            return sb.ToString();
        }

        //Increase Salaries
        public static string IncreaseSalaries(SoftUniContext db)
        {
            var sb = new StringBuilder();

            var emps = db.Employees
                    .Where(e => new List<string>() { "Engineering", "Tool Design", "Marketing", "Information Services" }.Contains(e.Department.Name))
                    .OrderBy(e => e.FirstName)
                    .ThenBy(e => e.LastName)
                    .ToList();

            foreach (var e in emps)
            {
                e.Salary = e.Salary * 1.12M;

                sb.AppendLine($"{e.FirstName} {e.LastName} (${e.Salary:f2})");
            }

            return sb.ToString();
        }

        //Find Employees by First Name Starting With Sa
        public static string GetEmployeesByFirstNameStartingWithSa(SoftUniContext db)
        {
            var sb = new StringBuilder();

            var emps = db.Employees
                        .Where(e => e.FirstName.ToLower().StartsWith("sa"))
                        .OrderBy(e => e.FirstName)
                        .ThenBy(e => e.LastName)
                        .ToList();

            foreach (var e in emps)
            {
                sb.AppendLine($"{e.FirstName} {e.LastName} - {e.JobTitle} - (${e.Salary:f2})");
            }

            return sb.ToString(); 
        }

        //Delete Project by Id [for id 2]
        public static string DeleteProjectById(SoftUniContext db)
        {
            var sb = new StringBuilder();

            var empPro = db.EmployeesProjects
                            .Where(x => x.ProjectId == 2)
                            .ToList();
            var projects = db.Projects.Where(x => x.ProjectId == 2).ToList();

            foreach (var emp in empPro)
            {
                db.EmployeesProjects.Remove(emp);
            }

            foreach (var p in projects)
            {
                db.Projects.Remove(p);
            }

            db.SaveChanges();

            foreach (var p in db.Projects.Take(10).ToList())
            {
                sb.AppendLine(p.Name);
            }

            return sb.ToString();
        }

        // Remove Town
        public static string RemoveTown(SoftUniContext db)
        {
            var sb = new StringBuilder();

            var addresses = db.Addresses
                            .Where(a => a.Town.Name == "Seattle")
                            .ToList();
            var people = db.Employees
                            .Where(e => addresses.Contains(e.Address))
                            .ToList();

            foreach (var p in people)
            {
                p.AddressId = null;
            }

            foreach (var a in addresses)
            {
                db.Addresses.Remove(a);
            }

            if(db.Towns.FirstOrDefault(t => t.Name == "Seattle") != null)
                db.Towns.Remove(db.Towns.FirstOrDefault(t => t.Name == "Seattle"));

            db.SaveChanges();

            sb.AppendLine($"{addresses.Count()} addresses in Seattle were deleted");

            return sb.ToString();
        }

        static void Main(string[] args)
        {
        }
    }
}
