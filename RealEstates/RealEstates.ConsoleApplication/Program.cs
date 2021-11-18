using Microsoft.EntityFrameworkCore;
using RealEstates.Data;
using RealEstates.Models;
using RealEstates.Services;
using RealEstates.Services.Contracts;
using System;
using System.Text;

namespace RealEstates.ConsoleApplication
{
    class Program
    {
        public static void Main(string[] args)
        {
            var db = new RealEstateDbContext();
            
            db.Database.Migrate();

            Console.OutputEncoding = Encoding.UTF8;

            while (true)
            {
                Console.Clear();
                Console.WriteLine("Choose To: ");
                Console.WriteLine("1 - Search For A Property");
                Console.WriteLine("2 - Get Most Expensive Disticts");
                Console.WriteLine("3 - Add Tags");
                Console.WriteLine("4 - Add Tags To Properties");
                Console.WriteLine("5 - Get Properties Count By Property Type");
                Console.WriteLine("0 - Exit");

                Console.Write("\nYour Choice: ");
                bool input = int.TryParse(Console.ReadLine(), out int choice);

                if (choice == 0)
                    break;

                switch (choice)
                {
                    case 1:
                        SearchProperties(db);
                        Console.WriteLine("\n\nClick Anything To Go Forward...");
                        Console.ReadKey();
                        break;

                    case 2:
                        while (true)
                        {
                            Console.Write("How much districts: ");
                            bool isValidCountInput = int.TryParse(Console.ReadLine(), out int count);

                            if (isValidCountInput && count > 0)
                            { 
                                GetMostExpensiveDistrics(db, count);
                                break;
                            }

                            Console.WriteLine("Input number(bigger than 0)");

                        }

                        Console.WriteLine("\n\nClick Anything To Go Forward...");
                        Console.ReadKey();
                        break;

                    case 3:
                        AddTags(db);
                        Console.WriteLine("\n\nClick Anything To Go Forward...");
                        Console.ReadKey();
                        break;

                    case 4:
                        AddTagsToProperties(db);
                        Console.WriteLine("\n\nClick Anything To Go Forward...");
                        Console.ReadKey();
                        break;

                    case 5:
                        GetCountOfPropertiesByProertyType(db);
                        Console.WriteLine("\n\nClick Anything To Go Forward...");
                        Console.ReadKey();
                        break;
                    default:
                        break;
                }
            }
        }

        private static void SearchProperties(RealEstateDbContext context)
        {
            IPropertiesService propertiesService = new PropertiesService(context);

            Console.Write("Minimum Price (0 if you don't know): ");
            decimal minPrice = decimal.Parse(Console.ReadLine());

            Console.Write("Maximum Price (-1 if you don't know): ");
            decimal maxPrice = decimal.Parse(Console.ReadLine());

            Console.Write("Minimum Size (0 if you don't know): ");
            double minSize = double.Parse(Console.ReadLine());
            
            Console.Write("Minimum floor (0 if you don't know): ");
            int minFloor = int.Parse(Console.ReadLine());


            if (minPrice <= 0)
                minPrice = 0;

            if (minSize <= 0)
                minSize = 0;

            if (minFloor <= 0)
                minFloor = 0;

            if (maxPrice == -1)
                maxPrice = 1000000000;

            var properties = propertiesService.SearchForProperty(minPrice, maxPrice, minFloor, minSize);

            foreach (var p in properties)
            {
                Console.WriteLine(new string('-', 40));

                Console.WriteLine($"Size: {p.Size:F2}m²");
                Console.WriteLine($"Yard Size: {p.YardSize ?? 0:F2}m²");
                Console.WriteLine($"Floor: {p.Floor ?? 0}");
                Console.WriteLine($"All Floors: {p.BuildingFloors ?? 0}");
                Console.WriteLine($"District: {p.DistrictName}");
                Console.WriteLine($"Year: {p.Year ?? 0}");
                Console.WriteLine($"Property Type: {p.PropertyTypeName}");
                Console.WriteLine($"Building Type: {p.BuildingTypeName}");
                Console.WriteLine($"Price: {p.Price:F2}€");
                Console.WriteLine($"Tags: {string.Join(", ", p.Tags)}");
                
                Console.WriteLine(new string('-', 40));
            }
        }

        private static void GetMostExpensiveDistrics(RealEstateDbContext context, int count)
        {
            IDistrictsService districtsService = new DistrictsService(context);

            var districts = districtsService.GetMostExpensiveDistricts(count);

            foreach (var d in districts)
            {
                Console.WriteLine(new string('-', 40));

                Console.WriteLine($"Name: {d.Name}");
                Console.WriteLine($"Properties count: {d.PropertiesCount}");
                Console.WriteLine($"Price per m²: {d.PricePerSquareMeter:F2}");

                Console.WriteLine(new string('-', 40));
            }
        }

        private static void AddTags(RealEstateDbContext context)
        {
            ITagService tagService = new TagService(context);

            tagService.AddTags();
        }
        
        private static void AddTagsToProperties(RealEstateDbContext context)
        {
            ITagService tagService = new TagService(context);

            tagService.SetTagsToProperties();
        }

        private static void GetCountOfPropertiesByProertyType(RealEstateDbContext context)
        {
            IPropertiesService propertyService = new PropertiesService(context);

            var groupsOfProperties = propertyService.GetCountOfPropertiesByPropertyType();

            foreach (var group in groupsOfProperties)
            {
                Console.WriteLine(new string('-', 40));

                Console.WriteLine($"Property Type: {group.PropertyTypeName} \n\tProperties: {group.Count}");

                Console.WriteLine(new string('-', 40));

            }
        }
    }
}
