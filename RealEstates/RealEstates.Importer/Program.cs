using Newtonsoft.Json;
using RealEstates.Data;
using RealEstates.Models;
using RealEstates.Models.InputModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace RealEstates.Importer
{
    class Program
    {
        public static void Main(string[] args)
        {
            var db = new RealEstateDbContext();

            string jsonTextHouses = File.ReadAllText(@"..\..\..\Json Files\imot.bg-houses-Sofia-raw-data-2021-03-18.json");
            string jsonText = File.ReadAllText(@"..\..\..\Json Files\imot.bg-raw-data-2021-03-18.json");

            //Uncomment if you want to import
            //JsonImport(db, jsonTextHouses);
            //JsonImport(db, jsonText);

        }

        private static void JsonImport(RealEstateDbContext db, string jsonText)
        {
            var jsonProperties = 
                    JsonConvert.DeserializeObject<IEnumerable<JsonPropertyInputModel>>(jsonText)
                    .ToList();

            foreach (var jp in jsonProperties)
            {
                var property = new Property
                {
                    Size = jp.Size,
                    YardSize = jp.YardSize <= 0 ? null : jp.YardSize,
                    Floor = jp.Floor <= 0 ? null : jp.Floor,
                    TotalFloors = jp.TotalFloors <= 0 ? null : jp.TotalFloors,
                    Price = jp.Price <= 0 ? null : jp.Price,
                    Year = jp.Year <= 0 ? null : jp.Year
                };

                var district = db.Districts.FirstOrDefault(p => p.Name == jp.District);
                if (district == null)
                {
                    district = new District() { Name = jp.District };
                }
                property.District = district;

                var propertyType = db.PropertyTypes.FirstOrDefault(p => p.Name == jp.Type);
                if (propertyType == null)
                {
                    propertyType = new PropertyType() { Name = jp.Type };
                }
                property.PropertyType = propertyType;

                var buildingType = db.BuildingTypes.FirstOrDefault(p => p.Name == jp.BuildingType);
                if (buildingType == null)
                {
                    buildingType = new BuildingType() { Name = jp.BuildingType };
                }
                property.BuildingType = buildingType;
                
                db.Properties.Add(property);
                db.SaveChanges();
                Console.Write('.');


            }
        }
    }
}
