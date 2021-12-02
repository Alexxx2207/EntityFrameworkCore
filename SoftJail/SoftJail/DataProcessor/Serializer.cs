namespace SoftJail.DataProcessor
{

    using Data;
    using Microsoft.EntityFrameworkCore;
    using Newtonsoft.Json;
    using SoftJail.DataProcessor.ExportDto;
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Xml.Serialization;

    public class Serializer
    {
        public static string ExportPrisonersByCells(SoftJailDbContext context, int[] ids)
        {
            StringWriter writer = new StringWriter();

            List<int> listOfIds = ids.ToList();

            var prisoners = context.Prisoners
                                .Where(p => listOfIds.Contains(p.Id))
                                .Include(p => p.PrisonerOfficers)
                                .ThenInclude(p => p.Officer)
                                .ToList()
                                .Select(p => new
                                {
                                    Id = p.Id,
                                    Name = p.FullName,
                                    CellNumber = p.Cell.CellNumber,
                                    Officers = p.PrisonerOfficers.Select(o => new
                                    {
                                        OfficerName = o.Officer.FullName,
                                        Department = o.Officer.Department.Name
                                    })
                                    .OrderBy(o => o.OfficerName),
                                    TotalOfficerSalary = decimal.Parse(p.PrisonerOfficers
                                                        .Sum(po => po.Officer.Salary)
                                                        .ToString("F2"))
                                })
                                .OrderBy(p => p.Name)
                                .ThenBy(p => p.Id);

            string json = JsonConvert.SerializeObject(prisoners, Formatting.Indented);


            return json;
        }

        public static string ExportPrisonersInbox(SoftJailDbContext context, string prisonersNames)
        {
            List<string> names = prisonersNames.Split(",", StringSplitOptions.RemoveEmptyEntries)
                                    .ToList();

            var prisoners = context.Prisoners
                            .Where(p => names.Contains(p.FullName))
                            .Select(p => new PrisonerDTO
                            {
                                Id = p.Id,
                                Name = p.FullName,
                                IncarcerationDate = p.IncarcerationDate.ToString("yyyy-MM-dd"),
                                EncryptedMessages = p.Mails.Select(m => new EncryptedMessageDTO
                                {
                                    Description = string.Concat(m.Description.Reverse())
                                })
                                                    .ToArray()
                            })
                            .ToArray()
                            .OrderBy(p => p.Name)
                            .ThenBy(p => p.Id)
                            .ToArray();

            XmlSerializerNamespaces ns = new XmlSerializerNamespaces();

            ns.Add(string.Empty, string.Empty);

            var xmlSerializer = new XmlSerializer(typeof(PrisonerDTO[]),
                        new XmlRootAttribute("Prisoners"));

            StringWriter textWriter = new StringWriter();

            xmlSerializer.Serialize(textWriter, prisoners, ns);

            return textWriter.ToString().TrimEnd();
        }
    }
}