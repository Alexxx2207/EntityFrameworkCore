namespace BookShop.DataProcessor
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Globalization;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Xml.Serialization;
    using BookShop.Common;
    using BookShop.Data.Models;
    using BookShop.Data.Models.Enums;
    using BookShop.DataProcessor.ImportDto;
    using Data;
    using Newtonsoft.Json;
    using ValidationContext = System.ComponentModel.DataAnnotations.ValidationContext;

    public class Deserializer
    {
        private const string ErrorMessage = "Invalid data!";

        private const string SuccessfullyImportedBook
            = "Successfully imported book {0} for {1:F2}.";

        private const string SuccessfullyImportedAuthor
            = "Successfully imported author - {0} with {1} books.";

        // Completed
        public static string ImportBooks(BookShopContext context, string xmlString)
        {
            StringBuilder sb = new StringBuilder();

            XmlRootAttribute root = new XmlRootAttribute("Books");

            XmlSerializer xmlSerializer = new XmlSerializer(typeof(ImportBookDTO[]), root);

            StringReader reader = new StringReader(xmlString);

            ImportBookDTO[] books = (ImportBookDTO[])xmlSerializer.Deserialize(reader);

            HashSet<Book> booksToImport = new HashSet<Book>();

            foreach (var book in books)
            {
                if (!IsValid(book))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                if(book.Price < GlobalConstants.BOOK_PRICE_MIN || book.Price > GlobalConstants.BOOK_PRICE_MAX)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                Genre currentBookGenre = (Genre)book.Genre;

                bool isValidPublishedOn = DateTime.TryParseExact(book.PublishedOn, "MM/dd/yyyy", CultureInfo.InvariantCulture,
                                        DateTimeStyles.None, out DateTime publishedOn);

                if (!isValidPublishedOn)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                Book newBook = new Book()
                {
                    Name = book.Name,
                    Genre = currentBookGenre,
                    Price = book.Price,
                    Pages = book.Pages,
                    PublishedOn = publishedOn
                };

                booksToImport.Add(newBook);
                sb.AppendLine(String.Format(SuccessfullyImportedBook, book.Name, book.Price));
            }

            context.AddRange(booksToImport);
            context.SaveChanges();


            return sb.ToString();
        }

        public static string ImportAuthors(BookShopContext context, string jsonString)
        {
            StringBuilder sb = new StringBuilder();

            var authors = JsonConvert.DeserializeObject<ImportAuthorDTO[]>(jsonString);

            List<Author> authorsToImport = new List<Author>();

            foreach (var author in authors)
            {
                if (!IsValid(author))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                if (authorsToImport.FirstOrDefault(a => a.Email == author.Email) != null)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                Author newAuthor = new Author()
                {
                    FirstName = author.FirstName,
                    LastName = author.LastName,
                    Email = author.Email,
                    Phone = author.Phone,
                };


                foreach (var book in author.Books)
                {
                    Book bookToAdd = context.Books.Find(book.Id);

                    if (bookToAdd == null)
                    {
                        continue;
                    }

                    newAuthor.AuthorsBooks.Add(new AuthorBook
                    {
                        Book = bookToAdd,
                        Author = newAuthor
                    });
                }

                if (newAuthor.AuthorsBooks.Count == 0)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                authorsToImport.Add(newAuthor);
                sb.AppendLine(String.Format(SuccessfullyImportedAuthor,
                                            newAuthor.FirstName + " " + newAuthor.LastName,
                                            newAuthor.AuthorsBooks.Count()));
            }

            context.AddRange(authorsToImport);
            context.SaveChanges();

            string result = sb.ToString().TrimEnd();

            return result;
        }

        private static bool IsValid(object dto)
        {
            var validationContext = new ValidationContext(dto);
            var validationResult = new List<ValidationResult>();

            return Validator.TryValidateObject(dto, validationContext, validationResult, true);
        }
    }
}