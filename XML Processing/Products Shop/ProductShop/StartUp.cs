using Microsoft.EntityFrameworkCore;
using ProductShop.Data;
using ProductShop.DTOs;
using ProductShop.Models;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace ProductShop
{
    public class StartUp
    {
        public static string ImportUsers(ProductShopContext context, string inputXml)
        {
            var serializer = new XmlSerializer(typeof(List<User>), new XmlRootAttribute("Users"));

            var users = (List<User>)serializer.Deserialize(new StringReader(inputXml));

            context.Users.AddRange(users);

            context.SaveChanges();

            return $"Successfully imported {context.Users.Count()}";
        }

        public static string ImportProducts(ProductShopContext context, string inputXml)
        {
            var serializer = new XmlSerializer(typeof(List<Product>), new XmlRootAttribute("Products"));

            var products = (List<Product>)serializer.Deserialize(new StringReader(inputXml));

            context.Products.AddRange(products);

            context.SaveChanges();

            return $"Successfully imported {context.Products.Count()}";
        }

        public static string ImportCategories(ProductShopContext context, string inputXml)
        {
            var serializer = new XmlSerializer(typeof(List<Category>), new XmlRootAttribute("Categories"));

            var categories = (List<Category>)serializer.Deserialize(new StringReader(inputXml));

            context.Categories.AddRange(categories);

            context.SaveChanges();

            return $"Successfully imported {context.Categories.Count()}";
        }

        public static string ImportCategoryProducts(ProductShopContext context, string inputXml)
        {
            var serializer = new XmlSerializer(typeof(List<CategoryProduct>), new XmlRootAttribute("CategoryProducts"));

            var cp = (List<CategoryProduct>)serializer.Deserialize(new StringReader(inputXml));

            foreach (var item in cp)
            {
                if (context.Categories.Any(c => c.Id == item.CategoryId) && context.Products.Any(p => p.Id == item.ProductId))
                    context.CategoryProducts.Add(item);
            }

            context.SaveChanges();

            return $"Successfully imported {context.CategoryProducts.Count()}";
        }

        public static string GetProductsInRange(ProductShopContext context)
        {
            var products = context.Products
                .Where(p => p.Price >= 500 && p.Price <= 1000)
                .OrderBy(p => p.Price)
                .Take(10)
                .Select(p => new ProductsInRangeDTO
                {
                    name = p.Name,
                    price = p.Price,
                    buyer = p.Buyer.FirstName + " " + p.Buyer.LastName
                })
                .ToList();

            var serializer = new XmlSerializer(typeof(List<ProductsInRangeDTO>), new XmlRootAttribute("Products"));

            using (var writer = new StreamWriter("products-in-range.xml"))
            {
                serializer.Serialize(writer, products);
            }
            var doc = XDocument.Load("products-in-range.xml");

            doc.Root.Name = "Products";
            doc.Root.Attributes().Remove();

            return doc.ToString();
        }

        public static string GetSoldProducts(ProductShopContext context)
        {
            var users = context.Users
                    .Where(u => u.ProductsSold.Any())
                    .OrderBy(u => u.LastName)
                    .ThenBy(u => u.FirstName)
                    .Take(5)
                    .Select(u => new SoldProductsDTO
                    {
                        FirstName = u.FirstName,
                        LastName = u.LastName,
                        SoldProducts = new List<OneSoldProductDTO>(u.ProductsSold.Select(p => new OneSoldProductDTO
                        {
                            Name = p.Name,
                            Price = p.Price
                        }))
                    })
                    .ToList();

            var serializer = new XmlSerializer(typeof(List<SoldProductsDTO>), new XmlRootAttribute("Users"));

            using (var writer = new StreamWriter("users-sold-products.xml"))
            {
                serializer.Serialize(writer, users);
            }

            var doc = XDocument.Load("users-sold-products.xml");

            doc.Root.Name = "Users";
            doc.Root.Attributes().Remove();

            return doc.ToString(SaveOptions.DisableFormatting);
        }

        public static string GetCategoriesByProductsCount(ProductShopContext context)
        {
            var categories = context.Categories
                .Select(c => new CategoriesByProductsCount
                {
                    Name = c.Name,
                    Count = c.CategoryProducts.Count(),
                    AveragePrice = c.CategoryProducts.Average(cp => cp.Product.Price),
                    TotalRevenue = c.CategoryProducts.Sum(cp => cp.Product.Price)
                })
                .OrderByDescending(c => c.Count)
                .ThenBy(c => c.TotalRevenue)
                .ToList();

            XmlSerializer serializer = new XmlSerializer(typeof(List<CategoriesByProductsCount>), new XmlRootAttribute("Categories"));

            using (var writer = new StreamWriter("categories-by-products.xml"))
            {
                serializer.Serialize(writer, categories);
            }

            var doc = XDocument.Load("categories-by-products.xml");

            doc.Root.Name = "Categories";
            doc.Root.Attributes().Remove();

            return doc.ToString();
        }

        public static string GetUsersWithProducts(ProductShopContext context)
        {
            var users = context.Users
                .Where(u => u.ProductsSold.Any())
                .OrderByDescending(u => u.ProductsSold.Count())
                .Take(10)
                .Include(u => u.ProductsSold)
                .ToList();

            var exportedUsers = new EmportUsersDTO()
            {
                Count = context.Users.Where(u => u.ProductsSold.Any()).Count(),
                users = users.Select(u => new UsersAndProducts
                {
                    FirstName = u.FirstName,
                    LastName = u.LastName,
                    Age = u.Age,
                    SoldProducts = new ProductsSoldPerUser
                    {
                        Count = u.ProductsSold.Count(),
                        products = u.ProductsSold.Select(p => new OneSoldProductDTO
                        {
                            Name = p.Name,
                            Price = p.Price
                        })
                        .OrderByDescending(p => p.Price)
                        .ToList()
                    }
                }).ToList()
            };

            var serializer = new XmlSerializer(typeof(EmportUsersDTO), new XmlRootAttribute("Users"));

            using (var writer = new StreamWriter("users-and-products.xml"))
            {
                serializer.Serialize(writer, exportedUsers);
            }

            var doc = XDocument.Load("users-and-products.xml");

            doc.Root.Name = "Users";
            doc.Root.Attributes().Remove();

            return doc.ToString(SaveOptions.DisableFormatting);
        }

        public static void Main(string[] args)
        {
            var db = new ProductShopContext();

            db.Database.EnsureCreated();

            // Write (a) method(s) from above
        }
    }
}