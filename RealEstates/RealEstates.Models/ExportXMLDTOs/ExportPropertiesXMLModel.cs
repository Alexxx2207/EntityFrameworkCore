using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace RealEstates.Models.ExportXMLDTOs
{
    [XmlType("Property")]
    public class ExportPropertiesXMLModel
    {
        [XmlElement]
        public double Size { get; set; }

        [XmlElement]
        public double YardSize { get; set; }

        [XmlElement]
        public int Floor { get; set; }

        [XmlElement]
        public int TotalFloors { get; set; }

        [XmlElement]
        public string District { get; set; }

        [XmlElement]
        public int Year { get; set; }

        [XmlElement]
        public string PropertyType { get; set; }

        [XmlElement]
        public string BuildingType { get; set; }
        
        [XmlElement]
        public decimal Price { get; set; }

        [XmlArrayItem(ElementName = "Tag")]
        [XmlArray]
        public List<string> Tags { get; set; }
    }
}
