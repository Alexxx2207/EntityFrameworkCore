using ServiceCodeFirstExercise.Data;
using ServiceCodeFirstExercise.Data.Models;
using System;
using System.IO;
using System.Linq;

namespace ServiceCodeFirstExercise
{
    class Program
    {
        static ServiceDbContext db;

        static void Insert()
        {
            db.Employees.Add(new Employee()
            {
                FirstName = "Marlo",
                LastName = "O'Malley",
                Birthdate = new DateTime(1958, 9, 21),
                DepartmentId = 1
            });
            db.Employees.Add(new Employee()
            {
                FirstName = "Niki",
                LastName = "Stanaghan",
                Birthdate = new DateTime(1969, 11, 26),
                DepartmentId = 4
            });
            db.Employees.Add(new Employee()
            {
                FirstName = "Ayrton",
                LastName = "Senna",
                Birthdate = new DateTime(1960, 03, 21),
                DepartmentId = 9
            });
            db.Employees.Add(new Employee()
            {
                FirstName = "Ronnie",
                LastName = "Peterson",
                Birthdate = new DateTime(1944,02,14),
                DepartmentId = 9
            });
            db.Employees.Add(new Employee()
            {
                FirstName = "Giovanna",
                LastName = "Amati",
                Birthdate = new DateTime(1959, 07, 20),
                DepartmentId = 5
            });

            db.Reports.Add(new Report()
                {
                    CategoryId = 1,
                    StatusId = 1,
                    OpenDate = new DateTime(2017, 04,13),
                    CloseDate = null,
                    Description = "Stuck Road on Str.133",
                    UserId = 6,
                    EmployeeId = 2
                }    
            );

            db.Reports.Add(new Report()
            {
                CategoryId = 6,
                StatusId = 3,
                OpenDate = new DateTime(2015,09,05),
                CloseDate = new DateTime(2015,12,06),
                Description = "Charity trail running",
                UserId = 3,
                EmployeeId = 5
                }
            );
            db.Reports.Add(new Report()
            {
                CategoryId = 14,
                StatusId = 2,
                OpenDate = new DateTime(2015, 09, 07),
                CloseDate = null,
                Description = "Falling bricks on Str.58",
                UserId = 5,
                EmployeeId = 2
                }
            );

            db.Reports.Add(new Report()
            {
                CategoryId = 4,
                StatusId = 3,
                OpenDate = new DateTime(2017, 07, 03),
                CloseDate = new DateTime(2017, 07, 06),
                Description = "Cut off streetlight on Str.11",
                UserId = 1,
                EmployeeId = 1
                }
            );

            db.SaveChanges();
        }

        static void Update()
        {
            foreach (var report in db.Reports)
            {
                if (report.CloseDate is null)
                    report.CloseDate = DateTime.Now;
            }

            db.SaveChanges();
        }

        static void Delete()
        {
            foreach (var report in db.Reports)
            {
                if (report.StatusId == 4)
                    db.Reports.Remove(report);
            }

            db.SaveChanges();
        }

        static void UnassignedReports()
        {
            var reports = db.Reports
                        .Where(x => x.EmployeeId == null)
                        .Select(x => new
                                {
                                    Description = x.Description,
                                    OpenDate = x.OpenDate
                                })
                        .OrderBy(x => x.OpenDate)
                        .ToList();

            foreach (var item in reports)
            {
                Console.WriteLine($"{item.Description}  {item.OpenDate:dd-MM-yyyy}");
            }
        }

        static void ReportsAndCategories()
        {
            var result = db.Reports
                           .Select(r => new
                           {
                               Description = r.Description,
                               CategoryName = r.Category.Name
                           })
                           .OrderBy(x => x.Description)
                           .ThenBy(x => x.CategoryName)
                           .ToList();

            foreach (var item in result)
            {
                Console.WriteLine($"{item.Description} {item.CategoryName}");
            }
        }

        static void MostPlayedCategory()
        {
            var categories = db.Categories
                            .Select(c => new
                            {
                                CategoryName = c.Name,
                                ReportsNumber = c.Reports.Count
                            })
                            .OrderByDescending(x => x.ReportsNumber)
                            .ThenBy(x => x.CategoryName)
                            .Take(5)
                            .ToList();

            foreach (var category in categories)
            {
                Console.WriteLine($"{category.CategoryName} {category.ReportsNumber}");
            }
        }

        static void BirthdayReport()
        {
            var results = db.Reports
                            .Where(r => r.User.Birthdate.Value.Day == r.OpenDate.Day &&
                                        r.User.Birthdate.Value.Month == r.OpenDate.Month)
                            .Select(r => new
                            { 
                                Username = r.User.Username,
                                CategoryName = r.Category.Name
                            })
                            .OrderBy(x => x.Username)
                            .ThenBy(x => x.CategoryName)
                            .ToList();

            foreach (var result in results)
            {
                Console.WriteLine($"{result.Username}  {result.CategoryName}");
            }
        }

        static void UserPerEmployee()
        {
            var employees = db.Reports
                            .Where(x => x.Employee != null)
                            .Select(x => new
                            { 
                                FullName = x.Employee.FirstName + " " + x.Employee.LastName,
                                UsersCount = db.Reports.Count(r => r.EmployeeId == x.EmployeeId)
                            })
                            .Distinct()
                            .OrderByDescending(x => x.UsersCount)
                            .ThenBy(x => x.FullName)
                            .ToList();

            foreach (var emp in employees)
            {
                Console.WriteLine($"{emp.FullName} {emp.UsersCount}");
            }
        }

        static void FullInfo()
        {
            var reports = db.Reports
                .Select(r => new
                {
                    EmployeeFirstName = r.Employee.FirstName,
                    EmployeeLastName = r.Employee.LastName,
                    Department = r.Employee.Department.Name,
                    Category = r.Category.Name,
                    Description = r.Description,
                    OpenDate = r.OpenDate,
                    Status = r.Status.Label,
                    User = r.User.Name
                })
                .OrderByDescending(x => x.EmployeeFirstName)
                .ThenByDescending(x => x.EmployeeLastName)
                .ThenBy(x => x.Department)
                .ThenBy(x => x.Category)
                .ThenBy(x => x.Description)
                .ThenBy(x => x.OpenDate)
                .ThenBy(x => x.Status)
                .ThenBy(x => x.User)
                .ToList();

            foreach (var report in reports)
            {
                Console.WriteLine($"{report.EmployeeFirstName} {report.EmployeeLastName}," +
                    $" {report.Department}, {report.Category}, {report.Description}," +
                    $" {report.OpenDate:dd.MM.yyyy}, {report.Status}, {report.User}");
            }
        }

        static void Main(string[] args)
        {
            
            db = new ServiceDbContext();

            db.Database.EnsureCreated();

            // INSERT HERE A SPECIFIC METHOD to EXECURE 
            
        }
    }
}
