namespace SoftJail.DataProcessor
{

    using Data;
    using Newtonsoft.Json;
    using SoftJail.Data.Models;
    using SoftJail.Data.Models.Enums;
    using SoftJail.DataProcessor.ImportDto;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Globalization;
    using System.IO;
    using System.Text;
    using System.Xml.Serialization;

    public class Deserializer
    {
        private const string ErrorMessage = "Invalid Data";

        private const string SuccessfulMessageDepartment = "Imported {0} with {1} cells";

        private const string SuccessfulMessagePrisoner = 
            "Imported {0} {1} years old";


        private const string SuccessfulMessageOfficer = "Imported {0} ({1} prisoners)";

        public static string ImportDepartmentsCells(SoftJailDbContext context, string jsonString)
        {
            StringBuilder sb = new StringBuilder();

            var departmentsWithCells = JsonConvert
                .DeserializeObject<IEnumerable<DepartmentsAndCellsDTO>>(jsonString);

            var validDepartments = new List<Department>();

            foreach (var departmentWithCells in departmentsWithCells)
            {
                if (!IsValid(departmentWithCells))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                var department = new Department()
                {
                    Name = departmentWithCells.Name
                };

                bool departmenthasInvalidCell = false;

                foreach (var cell in departmentWithCells.Cells)
                {
                    if (!IsValid(cell))
                    {
                        sb.AppendLine(ErrorMessage);
                        departmenthasInvalidCell = true;
                        break;
                    }
                    else
                        department.Cells.Add(new Cell
                        {
                            CellNumber = cell.CellNumber,
                            HasWindow = cell.HasWindow
                        });
                }

                if (department.Cells.Count == 0)
                    continue;

                if (departmenthasInvalidCell)
                    continue;

                validDepartments.Add(department);
                sb.AppendLine(string.Format(SuccessfulMessageDepartment, department.Name, department.Cells.Count));

            }

            context.AddRange(validDepartments);
            context.SaveChanges();


            return sb.ToString();
        }

        public static string ImportPrisonersMails(SoftJailDbContext context, string jsonString)
        {
            var sb = new StringBuilder();

            var prisonersAndMails = JsonConvert
                .DeserializeObject<IEnumerable<PrisonersAndMailsDTO>>(jsonString);

            var validPrisoners = new List<Prisoner>();


            foreach (var prisonerAndMails in prisonersAndMails)
            {
                var prisonerIncarcerationDate = DateTime.ParseExact(prisonerAndMails.IncarcerationDate,
                                                "dd/MM/yyyy",
                                                CultureInfo.InvariantCulture);

                DateTime? prisonerReleaseDate = null;
                
                if (prisonerAndMails.ReleaseDate != null)
                {
                    DateTime.ParseExact(prisonerAndMails.ReleaseDate,
                                                "dd/MM/yyyy",
                                                CultureInfo.InvariantCulture);
                }

                if (!IsValid(prisonerAndMails))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                if (prisonerAndMails.Bail < 0)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                //probably check cellId

                var prisoner = new Prisoner()
                {
                    FullName = prisonerAndMails.FullName,
                    Nickname = prisonerAndMails.Nickname,
                    Age = prisonerAndMails.Age,
                    IncarcerationDate = prisonerIncarcerationDate,
                    ReleaseDate = prisonerReleaseDate,
                    Bail = prisonerAndMails.Bail,
                    CellId = prisonerAndMails.CellId,
                };

                bool prisonerhasInvalidMails = false;

                foreach (var mail in prisonerAndMails.Mails)
                {
                    if (!IsValid(mail))
                    {
                        sb.AppendLine(ErrorMessage);
                        prisonerhasInvalidMails = true;
                        break;
                    }
                    else
                    {
                        prisoner.Mails.Add(new Mail()
                        {
                            Description = mail.Description,
                            Sender = mail.Sender,
                            Address = mail.Address,
                            Prisoner = prisoner
                        });
                    }
                }

                if (prisonerhasInvalidMails)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                validPrisoners.Add(prisoner);
                sb.AppendLine(string.Format(SuccessfulMessagePrisoner, prisoner.FullName, prisoner.Age));
            }

            context.AddRange(validPrisoners);
            context.SaveChanges();

            return sb.ToString();
        }

        public static string ImportOfficersPrisoners(SoftJailDbContext context, string xmlString)
        {
            var sb = new StringBuilder();

            var xmlSerializer = new XmlSerializer(typeof(List<OfficerPrisonersDTO>),
                                                    new XmlRootAttribute("Officers"));

            var officersPrisoners = (List<OfficerPrisonersDTO>)xmlSerializer
                                        .Deserialize(new StringReader(xmlString));


            var validOfficers = new List<Officer>();

            foreach (var officer in officersPrisoners)
            {
                if (!IsValid(officer))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                bool isValidPosition = Enum.TryParse(typeof(Position),
                                            officer.Position, out object validPostion);
                
                bool isValidWeapon = Enum.TryParse(typeof(Weapon),
                                            officer.Weapon, out object validWeapon);

                if (!isValidPosition || !isValidWeapon)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }
                if (officer.Salary < 0)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                // probably CHECK departmentId


                Officer officerToImport = new Officer()
                {
                    FullName = officer.FullName,
                    DepartmentId = officer.DepartmentId,
                    Position = (Position)validPostion,
                    Weapon = (Weapon)validWeapon,
                    Salary = officer.Salary
                };

                foreach (var prisoner in officer.Prisoners)
                {
                    var p = context.Prisoners.Find(prisoner.Id);

                    officerToImport.OfficerPrisoners.Add( new OfficerPrisoner
                    { 
                        Prisoner = p,
                        Officer = officerToImport
                    });
                }

                validOfficers.Add(officerToImport);
                sb.AppendLine(string.Format(SuccessfulMessageOfficer, officerToImport.FullName,
                                            officerToImport.OfficerPrisoners.Count));
            }

            context.AddRange(validOfficers);
            context.SaveChanges();

            return sb.ToString();
        }

        private static bool IsValid(object obj)
        {
            var validationContext = new System.ComponentModel.DataAnnotations.ValidationContext(obj);
            var validationResult = new List<ValidationResult>();

            bool isValid = Validator.TryValidateObject(obj, validationContext, validationResult, true);
            return isValid;
        }
    }
}