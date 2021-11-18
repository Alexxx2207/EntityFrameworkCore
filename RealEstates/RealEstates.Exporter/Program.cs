using RealEstates.Data;
using RealEstates.Models;
using RealEstates.Models.ExportXMLDTOs;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace RealEstates.Exporter
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = System.Text.Encoding.UTF8;

            var db = new RealEstateDbContext();

            var properties = db.Properties
                .Select(p => new ExportPropertiesXMLModel
                {
                    District = p.District.Name,
                    BuildingType = p.BuildingType.Name,
                    Floor = p.Floor ?? 0,
                    Price = p.Price ?? 0,
                    PropertyType = p.PropertyType.Name,
                    Size = p.Size,
                    Year = p.Year ?? 0,
                    TotalFloors = p.TotalFloors ?? 0,
                    YardSize = p.YardSize ?? 0,
                    Tags = p.Tags.Select(t => t.Name).ToList(),
                })
                .ToList();

            string xmlText = XMLSerializationOfProperties(properties);

            // Insert destination
            ExportXMLFile("Properties.xml", xmlText);


        }

        private static string XMLSerializationOfProperties(List<ExportPropertiesXMLModel> propertiesXMLModels)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(List<ExportPropertiesXMLModel>),
                                                        new XmlRootAttribute("Properties"));

            var writer = new StringWriter();

            serializer.Serialize(writer, propertiesXMLModels);

            return writer.ToString();
        }

        private static void ExportXMLFile(string destination, string xmlText)
        {
            XDocument doc = XDocument.Parse(xmlText);
            doc.Save(new StreamWriter(destination));
        }
    }
}
