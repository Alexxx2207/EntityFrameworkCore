namespace TeisterMask.DataProcessor
{
    using System;
    using System.Collections.Generic;

    using System.ComponentModel.DataAnnotations;
    using System.Globalization;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Xml.Serialization;
    using Data;
    using Newtonsoft.Json;
    using TeisterMask.Data.Models;
    using TeisterMask.Data.Models.Enums;
    using TeisterMask.DataProcessor.ImportDto;
    using ValidationContext = System.ComponentModel.DataAnnotations.ValidationContext;

    public class Deserializer
    {
        private const string ErrorMessage = "Invalid data!";

        private const string SuccessfullyImportedProject
            = "Successfully imported project - {0} with {1} tasks.";

        private const string SuccessfullyImportedEmployee
            = "Successfully imported employee - {0} with {1} tasks.";

        public static string ImportProjects(TeisterMaskContext context, string xmlString)
        {
            var sb = new StringBuilder();

            var xmlSerializer = new XmlSerializer(typeof(ProjectDTO[]), new XmlRootAttribute("Projects"));

            var projects = (ProjectDTO[])xmlSerializer.Deserialize(new StringReader(xmlString));

            var projectsToAdd = new List<Project>();

            foreach (var project in projects)
            {
                if (!IsValid(project))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                var projectOpenDate = DateTime.ParseExact(project.OpenDate,
                                        "dd/MM/yyyy",
                                        CultureInfo.InvariantCulture);

                DateTime? projectDueDate = null;
                if (!string.IsNullOrWhiteSpace(project.DueDate))
                {
                    projectDueDate = DateTime.ParseExact(project.DueDate,
                                        "dd/MM/yyyy",
                                        CultureInfo.InvariantCulture);
                }

                var projectToImport = new Project
                {
                    Name = project.Name,
                    DueDate = projectDueDate,
                    OpenDate = projectOpenDate,
                };

                foreach (var task in project.Tasks)
                {
                    if (!IsValid(task))
                    {
                        sb.AppendLine(ErrorMessage);
                        continue;
                    }

                    var taskOpenDate = DateTime.ParseExact(task.OpenDate,
                                        "dd/MM/yyyy",
                                        CultureInfo.InvariantCulture);

                    DateTime taskDueDate = DateTime.ParseExact(task.DueDate,
                                            "dd/MM/yyyy",
                                            CultureInfo.InvariantCulture);

                    var taskToImport = new Task
                    {
                        Name = task.Name,
                        OpenDate = taskOpenDate,
                        DueDate = taskDueDate,
                        ExecutionType = (ExecutionType)task.ExecutionType,
                        LabelType = (LabelType)task.LabelType
                    };

                    if(projectToImport.OpenDate > taskToImport.OpenDate)
                    {
                        sb.AppendLine(ErrorMessage);
                        continue;
                    }

                    if (taskToImport.DueDate > projectToImport.DueDate)
                    {
                        sb.AppendLine(ErrorMessage);
                        continue;
                    }

                    projectToImport.Tasks.Add(taskToImport);
                }

                projectsToAdd.Add(projectToImport);
                sb.AppendLine(string.Format(SuccessfullyImportedProject,
                                projectToImport.Name,
                                projectToImport.Tasks.Count));
            }

            context.AddRange(projectsToAdd);
            context.SaveChanges();

            return sb.ToString();
        }

        public static string ImportEmployees(TeisterMaskContext context, string jsonString)
        {
            var sb = new StringBuilder();

            var employees = JsonConvert.DeserializeObject<EmployeeDTO[]>(jsonString);

            var empsToImport = new List<Employee>();

            foreach (var emp in employees)
            {
                if (!IsValid(emp))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                var employeeToImport = new Employee
                { 
                    Username = emp.Username,
                    Email = emp.Email,
                    Phone = emp.Phone
                };

                foreach (var task in emp.Tasks.Distinct())
                {
                    var taskToImport = context.Tasks.Find(task); 

                    if(taskToImport == null)
                    {
                        sb.AppendLine(ErrorMessage);
                        continue;
                    }

                    employeeToImport.EmployeesTasks.Add(new EmployeeTask
                    { 
                        Task = taskToImport,
                        Employee = employeeToImport
                    });
                }

                empsToImport.Add(employeeToImport);
                sb.AppendLine(string.Format(SuccessfullyImportedEmployee,
                    employeeToImport.Username,
                    employeeToImport.EmployeesTasks.Count
                    ));
            }

            context.AddRange(empsToImport);
            context.SaveChanges();

            return sb.ToString();
        }

        private static bool IsValid(object dto)
        {
            var validationContext = new ValidationContext(dto);
            var validationResult = new List<ValidationResult>();

            return Validator.TryValidateObject(dto, validationContext, validationResult, true);
        }
    }
}