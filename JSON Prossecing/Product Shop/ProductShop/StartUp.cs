using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using ProductShop.Data;
using ProductShop.DTOs;
using ProductShop.Models;

namespace ProductShop
{
    public class StartUp
    {
        static IMapper mapper;

        public static string ImportUsers(ProductShopContext context, string inputJson)
        {
            InitializeAutoMapper();

            IList<JsonUser> users = JsonConvert.DeserializeObject<IList<JsonUser>>(inputJson);

            foreach (var dtoUser in users)
            {
                context.Users.Add(mapper.Map<User>(dtoUser));
            }

            context.SaveChanges();

            return $"Successfully imported {context.Users.Count()}";
        }

        public static string ImportProducts(ProductShopContext context, string inputJson)
        {
            InitializeAutoMapper();

            IList<JsonProduct> products = JsonConvert.DeserializeObject<IList<JsonProduct>>(inputJson);

            foreach (var dtoProduct in products)
            {
                context.Products.Add(mapper.Map<Product>(dtoProduct));
            }

            context.SaveChanges();

            return $"Successfully imported {context.Products.Count()}";
        }

        public static string ImportCategories(ProductShopContext context, string inputJson)
        {
            InitializeAutoMapper();

            IList<JsonCategory> categories = JsonConvert.DeserializeObject<IList<JsonCategory>>(inputJson);

            foreach (var category in categories)
            {
                    context.Categories.Add(mapper.Map<Category>(category));
            }

            context.SaveChanges();

            return $"Successfully imported {context.Categories.Where(c => c.Name != null).Count()}";

        }

        public static string ImportCategoryProducts(ProductShopContext context, string inputJson)
        {
            InitializeAutoMapper();

            IList<CategoryProduct> cps = JsonConvert.DeserializeObject<IList<CategoryProduct>>(inputJson);

            foreach (var cp in cps)
            {
                 context.CategoryProducts.Add(mapper.Map<CategoryProduct>(cp));
            }

            context.SaveChanges();

            return $"Successfully imported {context.CategoryProducts.Count()}";

        }

        public static string GetProductsInRange(ProductShopContext context)
        {
            InitializeAutoMapper();

            IEnumerable<ProductInRangeDTO> products = context.Products
                .Where(p => p.Price >= 500 && p.Price <= 1000)
                .OrderBy(p => p.Price)
                .ToList()
                .Select(p => mapper.Map<ProductInRangeDTO>(p));


            var resultJSON = JsonConvert.SerializeObject(products);

            return resultJSON;
        }

        public static string GetSoldProducts(ProductShopContext context)
        {
            InitializeAutoMapper();

            var users = context.Users
                .Where(u => u.ProductsSold.Where(p => p.Buyer != null).Count() >= 1)
                .Select(u => new
                {
                    firstName = u.FirstName,
                    lastName = u.LastName,
                    soldProducts = u.ProductsSold.Where(p => p.Buyer != null)
                                        .Select(p => new
                                        {
                                            name = p.Name,
                                            price = p.Price,
                                            buyerFirstName = p.Buyer.FirstName,
                                            buyerLastName = p.Buyer.LastName
                                        })
                                        .ToList()
                })
                .OrderBy(u => u.lastName)
                .ThenBy(u => u.firstName)
                .ToList();


            string json = JsonConvert.SerializeObject(users);

            return json;

        }

        public static string GetCategoriesByProductsCount(ProductShopContext context)
        {
            var result = context.
                Categories
                .Select(x => new
                {
                    category = x.Name,
                    productsCount = x.CategoryProducts.Select(y => y.Product.Id).Count(),
                    averagePrice = $"{(x.CategoryProducts.Average(y => y.Product.Price)):f2}",
                    totalRevenue = x.CategoryProducts.Sum(y => y.Product.Price).ToString("f2")
                })
                .OrderByDescending(x => x.productsCount)
                .ToList();

            string jsonResult = JsonConvert.SerializeObject(result, Formatting.Indented);
            return jsonResult;

        }

        public static string GetUsersWithProducts(ProductShopContext context)
        {
            var users = context.Users
                .Include(x => x.ProductsSold)
                .ToList()
                .Where(u => u.ProductsSold.Any(p => p.Buyer != null))
                .Select(u => new
                {
                    firstName = u.FirstName,
                    lastName = u.LastName,
                    age = u.Age,
                    soldProducts = new
                    {
                        count = u.ProductsSold.Where(p => p.Buyer != null).Count(),
                        products = u.ProductsSold.Where(p => p.Buyer != null)
                                .Select(p => new
                                {
                                    name = p.Name,
                                    price = p.Price
                                })
                    }
                })
                .OrderByDescending(x => x.soldProducts.products.Count())
                .ToList();

            var resultObject = new
            {
                usersCount = users.Count(),
                users = users
            };

            var settings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore,
                Formatting = Formatting.Indented
            };

            var json = JsonConvert.SerializeObject(resultObject, settings);

            return json;

        }

        public static void Main(string[] args)
        {
            var db = new ProductShopContext();
            //db.Database.EnsureDeleted();
            db.Database.EnsureCreated();

            // Write (a) method(s) from above
        }

        static void InitializeAutoMapper()
        {
            MapperConfiguration config = new MapperConfiguration(c =>
            {
                c.AddProfile(new ProductShopProfile());
            });

            mapper = config.CreateMapper();
        }
    }
}