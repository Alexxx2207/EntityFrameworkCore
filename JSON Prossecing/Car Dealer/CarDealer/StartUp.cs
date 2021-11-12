using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using AutoMapper;
using CarDealer.Data;
using CarDealer.DTO;
using CarDealer.Models;
using Newtonsoft.Json;

namespace CarDealer
{
    public class StartUp
    {
        static IMapper mapper;

        public static void InitializeMapper()
        {
            var mapperConfig = new MapperConfiguration(cfg =>
                cfg.AddProfile(new CarDealerProfile())
            );

            mapper = mapperConfig.CreateMapper();
        }

        public static string ImportSuppliers(CarDealerContext context, string inputJson)
        {
            InitializeMapper();

            var suppliers = JsonConvert.DeserializeObject<List<JsonSuppliers>>(inputJson)
                .Select(js => mapper.Map<Supplier>(js));

            context.Suppliers.AddRange(suppliers);

            context.SaveChanges();

            return $"Successfully imported {suppliers.Count()}.";
        }

        public static string ImportParts(CarDealerContext context, string inputJson)
        {
            InitializeMapper();

            var parts = JsonConvert.DeserializeObject<List<JsonParts>>(inputJson)
                .Select(p => mapper.Map<Part>(p));

            foreach (var part in parts)
            {
                if (context.Suppliers.Any(s => s.Id == part.SupplierId))
                    context.Parts.Add(part);
            }

            context.SaveChanges();

            return $"Successfully imported {context.Parts.Count()}.";
        }

        public static string ImportCars(CarDealerContext context, string inputJson)
        {
            InitializeMapper();

            var carsInfo = JsonConvert.DeserializeObject<List<JsonCars>>(inputJson);

            List<Car> cars = new List<Car>();

            foreach (var carInfo in carsInfo)
            {
                var car = new Car
                {
                    Make = carInfo.Make,
                    Model = carInfo.Model,
                    TravelledDistance = carInfo.TravelledDistance
                };

                foreach (var part in carInfo.PartsId.Distinct())
                {
                    car.PartCars.Add(new PartCar { PartId = part});
                }

                cars.Add(car);
            }

            context.Cars.AddRange(cars);
            context.SaveChanges();

            return $"Successfully imported {context.Cars.Count()}.";
        }

        public static string ImportCustomers(CarDealerContext context, string inputJson)
        {
            InitializeMapper();

            var customers = JsonConvert.DeserializeObject<List<JsonCustomers>>(inputJson)
                .Select(c => mapper.Map<Customer>(c));

            foreach (var customer in customers)
            {
                context.Customers.Add(customer);
            }

            context.SaveChanges();

            return $"Successfully imported {context.Customers.Count()}.";
        }

        public static string ImportSales(CarDealerContext context, string inputJson)
        {
            InitializeMapper();

            var sales = JsonConvert.DeserializeObject<List<JsonSales>>(inputJson)
                .Select(s => mapper.Map<Sale>(s));

            foreach (var sale in sales)
            {
                context.Sales.Add(sale);
            }

            context.SaveChanges();

            return $"Successfully imported {context.Sales.Count()}.";
        }

        public static string GetOrderedCustomers(CarDealerContext context)
        {
            var customers = context.Customers
                        .OrderBy(x => x.BirthDate)
                        .ThenBy(x => x.IsYoungDriver)
                        .Select(x => new
                        { 
                            x.Name,
                            BirthDate = x.BirthDate.ToString("dd/MM/yyyy"),
                            x.IsYoungDriver
                        })
                        .ToList();

            string json = JsonConvert.SerializeObject(customers);

            return json;
        }

        public static string GetCarsFromMakeToyota(CarDealerContext context)
        {
            var toyotas = context.Cars
                .Where(c => c.Make == "Toyota")
                .Select(c => new
                { 
                    c.Id,
                    c.Make,
                    c.Model,
                    c.TravelledDistance
                })
                .OrderBy(c => c.Model)
                .ThenByDescending(c => c.TravelledDistance)
                .ToList();

            string json = JsonConvert.SerializeObject(toyotas);

            return json;
        }
        
        public static string GetLocalSuppliers(CarDealerContext context)
        {
            var suppliers = context.Suppliers
                .Where(s => !s.IsImporter)
                .Select(s => new
                {
                    s.Id,
                    s.Name,
                    PartsCount = s.Parts.Count()
                })
                .ToList();

            string json = JsonConvert.SerializeObject(suppliers);

            return json;
        }

        public static string GetCarsWithTheirListOfParts(CarDealerContext context)
        {
            var cars = context.Cars
                .Select(c => new
                {
                    car = new
                    {
                        c.Make,
                        c.Model,
                        c.TravelledDistance
                    },
                    parts = c.PartCars.Select(p => new
                    {
                        p.Part.Name,
                        Price = p.Part.Price.ToString("F2")
                    })
                })
                .ToList();

            string json = JsonConvert.SerializeObject(cars);

            return json;
        }

        public static string GetTotalSalesByCustomer(CarDealerContext context)
        {
            var customers = context.Customers
                .Where(c => c.Sales.Any())
                .Select(c => new
                {
                    fullName = c.Name,
                    boughtCars = c.Sales.Count(),
                    spentMoney = c.Sales.Sum(sale => sale.Car.PartCars.Select(p => p.Part.Price).Sum())
                })
                .OrderByDescending(x => x.spentMoney)
                .ThenByDescending(x => x.boughtCars)
                .ToList();

            string json = JsonConvert.SerializeObject(customers);

            return json;
        }

        public static string GetSalesWithAppliedDiscount(CarDealerContext context)
        {
            var sales = context.Sales
                .Take(10)
                .Select(s => new
                {
                    car = new
                    {
                        s.Car.Make,
                        s.Car.Model,
                        s.Car.TravelledDistance
                    },
                    customerName = s.Customer.Name,
                    Discount = s.Discount.ToString("F2"),
                    price = s.Car.PartCars.Select(p => p.Part.Price).Sum().ToString("F2"),
                    priceWithDiscount =
                            (s.Car.PartCars.Select(p => p.Part.Price).Sum() * (1 - s.Discount / 100))
                            .ToString("F2")
                })
                .ToList();

            string json = JsonConvert.SerializeObject(sales);

            return json;
        }

        public static void Main(string[] args)
        {
            var db = new CarDealerContext();

            db.Database.EnsureCreated();

            Console.WriteLine(GetSalesWithAppliedDiscount(db));
        }
    }
}