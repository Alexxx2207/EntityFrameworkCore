using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace CarDealer.DTOs
{
    [XmlType("suplier")]
    public class LocalSupplierDTO
    {
        [XmlAttribute("id")]
        public int Id { get; set; }
        [XmlAttribute("name")]
        public string Name { get; set; }
        [XmlAttribute("parts-count")]
        public int PartCount { get; set; }
    }
}
