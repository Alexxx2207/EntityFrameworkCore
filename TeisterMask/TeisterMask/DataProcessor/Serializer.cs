namespace TeisterMask.DataProcessor
{
    using System;
    using System.IO;
    using System.Linq;
    using System.Xml.Serialization;
    using Data;
    using Newtonsoft.Json;
    using TeisterMask.DataProcessor.ExportDto;
    using Formatting = Newtonsoft.Json.Formatting;

    public class Serializer
    {
        public static string ExportProjectWithTheirTasks(TeisterMaskContext context)
        {
            var writer = new StringWriter();

            var projects = context.Projects
                                .Where(p => p.Tasks.Any())
                                .ToArray()
                                .Select(p => new ProjectDTO
                                {
                                    TaskCount = p.Tasks.Count,
                                    HasEndDate = p.DueDate != null ? "Yes" : "No",
                                    ProjectName = p.Name,
                                    Tasks = p.Tasks.Select(t => new TaskDTO
                                    {
                                        Name = t.Name,
                                        Label = t.LabelType.ToString()
                                    })
                                    .OrderBy(t => t.Name)
                                    .ToArray()
                                })
                                .OrderByDescending(p => p.TaskCount)
                                .ThenBy(p => p.ProjectName)
                                .ToArray();

            var xmlSerializer = new XmlSerializer(typeof(ProjectDTO[]), new XmlRootAttribute("Projects"));

            var ns = new XmlSerializerNamespaces();
            ns.Add(string.Empty, string.Empty);

            xmlSerializer.Serialize(writer, projects, ns);

            return writer.ToString();
        }

        public static string ExportMostBusiestEmployees(TeisterMaskContext context, DateTime date)
        {
            var emps = context.Employees
                                .Where(e => e.EmployeesTasks.Any(et => et.Task.OpenDate >= date))
                                .OrderByDescending(e => e.EmployeesTasks
                                                            .Where(et => et.Task.OpenDate >= date)
                                                            .Count()
                                                  )
                                .ThenBy(e => e.Username)
                                .Take(10)
                                .ToArray()
                                .Select(e => new
                                {
                                    Username = e.Username,
                                    Tasks = e.EmployeesTasks
                                                .Where(et => et.Task.OpenDate >= date)
                                                .OrderByDescending(et => et.Task.DueDate)
                                                .ThenBy(et => et.Task.Name)
                                                .Select(et => new
                                                {
                                                    TaskName = et.Task.Name,
                                                    OpenDate = et.Task.OpenDate.ToString("MM/dd/yyyy"),
                                                    DueDate = et.Task.DueDate.ToString("MM/dd/yyyy"),
                                                    LabelType = et.Task.LabelType.ToString(),
                                                    ExecutionType = et.Task.ExecutionType.ToString()
                                                })
                                                
                                })
                                .ToArray();

            string json = JsonConvert.SerializeObject(emps, Formatting.Indented);

            return json;
        }
    }
}