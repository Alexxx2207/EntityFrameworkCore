using ServiceCodeFirstExercise.Data;
using ServiceCodeFirstExercise.Data.Models;
using System;
using System.IO;

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



        static void Main(string[] args)
        {
            
            db = new ServiceDbContext();

            db.Database.EnsureCreated();

            // INSERT HERE A SPECIFIC METHOD to EXECURE 
        }
    }
}
