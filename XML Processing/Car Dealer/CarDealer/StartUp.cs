using AutoMapper;
using CarDealer.Data;
using CarDealer.DTOs;
using CarDealer.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace CarDealer
{
    public class StartUp
    {
        public static IMapper mapper;

        public static string ImportSuppliers(CarDealerContext context, string inputXml)
        {
            var serializer = new XmlSerializer(typeof(List<Supplier>), new XmlRootAttribute("Suppliers"));

            var suppliers = (List<Supplier>)serializer.Deserialize(new StringReader(inputXml));

            context.Suppliers.AddRange(suppliers);

            context.SaveChanges();

            return $"Successfully imported {suppliers.Count()}";
        }

        public static string ImportParts(CarDealerContext context, string inputXml)
        {
            var serializer = new XmlSerializer(typeof(List<Part>), new XmlRootAttribute("Parts"));

            var parts = (List<Part>)serializer.Deserialize(new StringReader(inputXml));
            parts = parts.Where(p => context.Suppliers.Any(s => s.Id == p.SupplierId)).ToList();

            context.Parts.AddRange(parts);

            context.SaveChanges();

            return $"Successfully imported {parts.Count}";
        }

        public static string ImportCars(CarDealerContext context, string inputXml)
        {
            var serializer = new XmlSerializer(typeof(List<ImportCarDTO>), new XmlRootAttribute("Cars"));

            var carsInfo = (List<ImportCarDTO>)serializer.Deserialize(new StringReader(inputXml));

            List<Car> carsToAdd = new List<Car>();

            foreach (var item in carsInfo)
            {
                var car = new Car
                {
                    Make = item.Make,
                    Model = item.Model,
                    TravelledDistance = item.TraveledDistance
                };

                var parts = item.Parts
                            .Where(partId => context.Parts.Any(p => p.Id == partId.Id))
                            .Select(p => p.Id)
                            .Distinct();

                foreach (var partId in parts)
                {
                    car.PartCars.Add(new PartCar { PartId = partId });
                }
                carsToAdd.Add(car);
            }

            context.Cars.AddRange(carsToAdd);

            context.SaveChanges();

            return $"Successfully imported {carsToAdd.Count}";
        }

        public static string ImportCustomers(CarDealerContext context, string inputXml)
        {
            var serializer = new XmlSerializer(typeof(List<Customer>), new XmlRootAttribute("Customers"));

            var customers = (List<Customer>)serializer.Deserialize(new StringReader(inputXml));

            context.Customers.AddRange(customers);

            context.SaveChanges();

            return $"Successfully imported {customers.Count}";
        }

        public static string ImportSales(CarDealerContext context, string inputXml)
        {
            var serializer = new XmlSerializer(typeof(List<Sale>), new XmlRootAttribute("Sales"));

            var sales = ((List<Sale>)serializer.Deserialize(new StringReader(inputXml)))
                    .Where(s => context.Cars.Any(c => c.Id == s.CarId));

            context.Sales.AddRange(sales);

            context.SaveChanges();

            return $"Successfully imported {sales.Count()}";
        }

        public static string GetCarsWithDistance(CarDealerContext context)
        {
            InitializeMapper();

            var cars = context.Cars
                .Where(c => c.TravelledDistance > 2000000)
                .OrderBy(c => c.Make)
                .ThenBy(c => c.Model)
                .Take(10)
                .Select(c => mapper.Map<CarsWithDistanceDTO>(c))
                .ToList();

            var serializer = new XmlSerializer(typeof(List<CarsWithDistanceDTO>), new XmlRootAttribute("carse"));

            using (var writer = new StreamWriter("cars.xml"))
            {
                serializer.Serialize(writer, cars);
            }

            var doc = XDocument.Load("cars.xml");

            doc.Root.Name = "cars";
            doc.Root.Attributes().Remove();

            return doc.ToString();
        }

        public static string GetCarsFromMakeBmw(CarDealerContext context)
        {
            InitializeMapper();

            var cars = context.Cars.Where(c => c.Make == "BMW")
                .OrderBy(c => c.Model)
                .ThenByDescending(c => c.TravelledDistance)
                .Select(c => mapper.Map<BMWCarsDTO>(c))
                .ToList();

            var serializer = new XmlSerializer(typeof(List<BMWCarsDTO>), new XmlRootAttribute("cars"));

            using (var writer = new StreamWriter("bmw-cars.xml"))
            {
                serializer.Serialize(writer, cars);
            }

            var doc = XDocument.Load("bmw-cars.xml");

            doc.Root.Name = "cars";
            doc.Root.Attributes().Remove();

            return doc.ToString();
        }

        public static string GetLocalSuppliers(CarDealerContext context)
        {
            var suppliers = context.Suppliers
                .Where(s => !s.IsImporter)
                .Select(s => new LocalSupplierDTO
                { 
                    Id = s.Id,
                    Name = s.Name,
                    PartCount = s.Parts.Count()
                })
                .ToList();

            var serializer = new XmlSerializer(typeof(List<LocalSupplierDTO>), new XmlRootAttribute("suppliers"));

            using (var writer = new StreamWriter("local-suppliers.xml"))
            {
                serializer.Serialize(writer, suppliers);
            }

            var doc = XDocument.Load("local-suppliers.xml");

            doc.Root.Name = "suppliers";
            doc.Root.Attributes().Remove();

            return doc.ToString(SaveOptions.DisableFormatting);
        }

        public static string GetCarsWithTheirListOfParts(CarDealerContext context)
        {
            var cars = context.Cars
                .Select(c => new ExportCarInfoDTO
                {
                    Make = c.Make,
                    Model = c.Model,
                    TravelledDistance = c.TravelledDistance,
                    Parts = c.PartCars.Select(pc => new ExportCarInfoPartDTO 
                    {
                        Name = pc.Part.Name,
                        Price = pc.Part.Price
                    })
                    .OrderByDescending(p => p.Price)
                    .ToList()
                })
                .OrderByDescending(c => c.TravelledDistance)
                .ThenBy(c => c.Model)
                .Take(5)
                .ToList();

            var serializer = new XmlSerializer(typeof(List<ExportCarInfoDTO>), new XmlRootAttribute("cars"));


            var writer = new StringWriter();

            var @namespace = new XmlSerializerNamespaces();
            @namespace.Add("", "");

            serializer.Serialize(writer, cars, @namespace);

            return writer.ToString();
        }

        public static string GetTotalSalesByCustomer(CarDealerContext context)
        {
            var customers = context.Customers
                .Where(c => c.Sales.Any())
                .Select(c => new ExportCustomerDTO
                {
                    FullName = c.Name,
                    BoughtCars = c.Sales.Count(),
                    SpentMoney = c.Sales.SelectMany(sale => sale.Car.PartCars).Select(p => p.Part.Price).Sum()
                })
                .OrderByDescending(c => c.SpentMoney)
                .ToList();

            var serializer = new XmlSerializer(typeof(List<ExportCustomerDTO>), new XmlRootAttribute("customers"));

            var textWriter = new StringWriter();

            var ns = new XmlSerializerNamespaces();
            ns.Add("", "");

            serializer.Serialize(textWriter, customers, ns);

            return textWriter.ToString();
        }

        public static string GetSalesWithAppliedDiscount(CarDealerContext context)
        {
            var sales = context.Sales
                .Select(s => new ExportSaleDTO
                {
                    Car = new ExportSaleCarInfoDTO
                    {
                        Make = s.Car.Make,
                        Model = s.Car.Model,
                        TravelledDistance = s.Car.TravelledDistance
                    },
                    Discount = s.Discount,
                    CustomerName = s.Customer.Name,
                    Price = s.Car.PartCars.Sum(p => p.Part.Price),
                    PriceWithDiscount = s.Car.PartCars.Sum(p => p.Part.Price) - s.Car.PartCars.Sum(p => p.Part.Price) * s.Discount / 100m
                })
                .ToList();

            var serializer = new XmlSerializer(typeof(List<ExportSaleDTO>), new XmlRootAttribute("sales"));

            var textWriter = new StringWriter();

            var ns = new XmlSerializerNamespaces();
            ns.Add("", "");

            serializer.Serialize(textWriter, sales, ns);


            return textWriter.ToString();
        }

        public static void Main(string[] args)
        {
            var db = new CarDealerContext();

            db.Database.EnsureCreated();

            // Write (a) method(s) from above
        }

        public static void InitializeMapper()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new CarDealerProfile());
            });

            mapper = config.CreateMapper();
        }
    }
}