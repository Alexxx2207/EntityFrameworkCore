using System;
using System.Linq;
using MiniORM.App.Data.Entities;

namespace MiniORM.App
{
    class Program
    {
        static void Main(string[] args)
        {
            var connStr = "Server=.;Database=MiniORM;Integrated Security = true";

            var context = new SoftUniDbContext(connStr);

            context.Employees.Add(new Employee
            {
                FirstName = "Gosho",
                LastName = "Inserted",
                DepartmentId = context.Departments.First().Id,
                IsEmployed = true
            });

            var employee = context.Employees.Last();
            employee.FirstName = "Modified";

            context.SaveChanges();
        }
    }
}
