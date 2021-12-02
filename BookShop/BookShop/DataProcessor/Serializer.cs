namespace BookShop.DataProcessor
{
    using System;
    using System.Globalization;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Xml;
    using System.Xml.Serialization;
    using Data;
    using Newtonsoft.Json;
    using Formatting = Newtonsoft.Json.Formatting;

    public class Serializer
    {
        public static string ExportMostCraziestAuthors(BookShopContext context)
        {
            var authorsWithBooks = context.Authors
                                    .Select(a => new
                                    {
                                        AuthorName = a.FirstName + " " + a.LastName,
                                        Books = a.AuthorsBooks
                                        .OrderByDescending(b => b.Book.Price)
                                        .Select(ab => new
                                        {
                                            BookName = ab.Book.Name,
                                            BookPrice = ab.Book.Price.ToString("F2")
                                        })
                                    })
                                    .ToList()
                                    .OrderByDescending(a => a.Books.Count())
                                    .ThenBy(a => a.AuthorName)
                                    .ToList();

            string result = JsonConvert.SerializeObject(authorsWithBooks, Formatting.Indented);


            return result.TrimEnd();
        }

        public static string ExportOldestBooks(BookShopContext context, DateTime date)
        {
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(ExportDto.ExportBooksDTO[]), 
                new XmlRootAttribute("Books"));

            var books = context.Books
                .Where(b => b.PublishedOn < date)
                .Where(b => b.Genre == Data.Models.Enums.Genre.Science)
                .Select(b => new ExportDto.ExportBooksDTO
                {
                    Name = b.Name,
                    Date = b.PublishedOn.ToString("MM/dd/yyyy"),
                    Pages = b.Pages
                })
                .OrderByDescending(b => b.Pages)
                .ThenByDescending(b => b.Date)
                .Take(10)
                .ToArray();

            StringWriter writer = new StringWriter();

            XmlSerializerNamespaces namespaces = new XmlSerializerNamespaces();
            namespaces.Add(String.Empty, String.Empty);

            xmlSerializer.Serialize(writer, books, namespaces);

            return writer.ToString().TrimEnd();
        }
    }
}