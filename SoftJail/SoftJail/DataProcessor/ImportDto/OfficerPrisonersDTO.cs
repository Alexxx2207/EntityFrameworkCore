using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Xml.Serialization;

namespace SoftJail.DataProcessor.ImportDto
{
    [XmlType("Officer")]
    public class OfficerPrisonersDTO
    {
        [XmlElement("Name")]
        [MinLength(3)]
        [MaxLength(30)]
        [Required]
        public string FullName { get; set; }

        [XmlElement("Money")]
        public decimal Salary { get; set; }

        [XmlElement("Position")]
        [Required]
        public string Position { get; set; }

        [XmlElement("Weapon")]
        [Required]
        public string Weapon { get; set; }

        [XmlElement("DepartmentId")]
        public int DepartmentId { get; set; }

        [XmlArray("Prisoners")]
        public PrisonerInOfficerPrisonersDTO[] Prisoners { get; set; }
    }
}
