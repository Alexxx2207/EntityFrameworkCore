using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace CarDealer.DTOs
{
    [XmlType("partId")]
    public class PartOfACarDTO
    {
        [XmlAttribute("id")]
        public int Id { get; set; }
    }
}
