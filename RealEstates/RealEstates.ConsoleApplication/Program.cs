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
                Console.WriteLine("3 - Exit");

                Console.Write("\nYour Choice: ");
                bool input = int.TryParse(Console.ReadLine(), out int choice);

                if (choice == 3)
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
                Console.WriteLine($"Yard Size: {p.YardSize:F2}m²");
                Console.WriteLine($"Floor: {p.Floor}");
                Console.WriteLine($"All Floors: {p.BuildingFloors}");
                Console.WriteLine($"District: {p.DistrictName}");
                Console.WriteLine($"Year: {p.Year}");
                Console.WriteLine($"Property Type: {p.PropertyTypeName}");
                Console.WriteLine($"Building Type: {p.BuildingTypeName}");
                Console.WriteLine($"Price: {p.Price:F2}€");
                
                Console.WriteLine(new string('-', 40));
            }
        }

        private static void GetMostExpensiveDistrics(RealEstateDbContext context, int count)
        {
            IDistrictsService districtsService = new DistricsService(context);

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
    }
}
