using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Xml.Serialization;

namespace Theatre.DataProcessor.ImportDto
{
    [XmlType("Play")]
    public class ImportPlaysDTO
    {
        [XmlElement("Title")]
        [Required]
        [MinLength(4)]
        [MaxLength(50)]
        public string Title { get; set; }

        [XmlElement("Duration")]
        [Required]
        [RegularExpression(@"^\d{2}:\d{2}:\d{2}$")]
        public string Duration { get; set; }

        [XmlElement("Rating")]
        [Required]
        [Range(0.00f, 10.00f)]
        public float Rating { get; set; }

        [XmlElement("Genre")]
        [Required]
        [RegularExpression(@"^(Drama|Comedy|Romance|Musical)$")]
        public string Genre { get; set; }

        [XmlElement("Description")]
        [Required]
        [MaxLength(700)]
        public string Description { get; set; }

        [XmlElement("Screenwriter")]
        [Required]
        [MinLength(4)]
        [MaxLength(30)]
        public string Screenwriter { get; set; }
    }
}
