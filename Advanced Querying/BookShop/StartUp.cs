namespace BookShop
{
    using System;
    using System.Globalization;
    using System.Linq;
    using System.Text;
    using BookShop.Models.Enums;
    using Data;
    using Initializer;
    using Microsoft.EntityFrameworkCore;

    public class StartUp
    {
        public static string GetBooksByAgeRestriction(BookShopContext context, string command)
        {
            command = command.ToLower();

            AgeRestriction indexSearching = Enum.Parse<AgeRestriction>(command, true);

            var titles = context.Books
                .Where(x => x.AgeRestriction == indexSearching)
                .Select(x => x.Title)
                .OrderBy(t => t)
                .ToList();


            string result = string.Join(Environment.NewLine, titles);

            return result;
        }

        public static string GetGoldenBooks(BookShopContext context)
        {
            var titles = context.Books
                .Where(x => x.EditionType == EditionType.Gold && x.Copies < 5000)
                .Select(x => new
                {
                    x.Title,
                    x.BookId
                })
                .OrderBy(x => x.BookId)
                .ToList();

            string result = string.Join(Environment.NewLine, titles.Select(x => x.Title));

            return result;
        }

        public static string GetBooksByPrice(BookShopContext context)
        {
            var books = context.Books
                .Where(x => x.Price > 40)
                .Select(x => new
                {
                    x.Title,
                    x.Price
                })
                .OrderByDescending(x => x.Price)
                .ToList();

            string result = string.Join(Environment.NewLine, books.Select(x => $"{x.Title} - ${x.Price:f2}"));

            return result;
        }

        public static string GetBooksNotReleasedIn(BookShopContext context, int year)
        {
            var titles = context.Books
                .Where(b => b.ReleaseDate.Value.Year != year)
                .OrderBy(b => b.BookId)
                .Select(b => b.Title)
                .ToList();

            string result = string.Join(Environment.NewLine, titles);

            return result;
        }

        public static string GetBooksByCategory(BookShopContext context, string input)
        {
            string[] categories = input.Split(" ", StringSplitOptions.RemoveEmptyEntries).Select(x => x.ToLower()).ToArray();
            var books = context.BooksCategories
                .Where(bc => categories.Contains(bc.Category.Name.ToLower()))
                .Select(b => b.Book.Title)
                .OrderBy(t => t)
                .ToList();

            string result = string.Join(Environment.NewLine, books);

            return result;
        }

        public static string GetBooksReleasedBefore(BookShopContext context, string date)
        {
            DateTime dateTime = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);

            var books = context.Books
                .Where(b => b.ReleaseDate < dateTime)
                .Select(x => new
                {
                    x.Title,
                    x.EditionType,
                    x.Price,
                    x.ReleaseDate
                })
                .OrderByDescending(x => x.ReleaseDate)
                .ToList();

            string result = string.Join(Environment.NewLine, books.Select(x => $"{x.Title} - {x.EditionType} - ${x.Price:f2}"));

            return result;
        }

        public static string GetAuthorNamesEndingIn(BookShopContext context, string input)
        {
            var names = context.Authors
                .Where(a => a.FirstName.EndsWith(input))
                .Select(a => new
                {
                    a.FirstName,
                    a.LastName
                })
                .ToList()
                .Select(a => $"{a.FirstName} {a.LastName}")
                .OrderBy(a => a)
                .ToList();

            string result = string.Join(Environment.NewLine, names);

            return result;
        }

        public static string GetBookTitlesContaining(BookShopContext context, string input)
        {
            var titles = context.Books
                .Where(b => b.Title.ToLower().Contains(input.ToLower()))
                .Select(b => b.Title)
                .OrderBy(t => t)
                .ToList();

            string result = string.Join(Environment.NewLine, titles);

            return result;
        }

        public static string GetBooksByAuthor(BookShopContext context, string input)
        { 
            var books = context.Books
                .Where(b => b.Author.LastName.ToLower().StartsWith(input.ToLower()))
                .Select(b => new
                { 
                    b.BookId,
                    b.Title,
                    AuthorName = b.Author.FirstName + " " + b.Author.LastName 
                })
                .OrderBy(b => b.BookId)
                .ToList();

            string result = string.Join(Environment.NewLine, books.Select(b => $"{b.Title} ({b.AuthorName})"));

            return result;
        }

        public static int CountBooks(BookShopContext context, int lengthCheck)
        {
            int books = context.Books
                .Where(b => b.Title.Length > lengthCheck).Count();

            return books;
        }

        public static string CountCopiesByAuthor(BookShopContext context)
        {
            var authors = context.Authors
                .Select(a => new
                {
                    Name = a.FirstName + " " + a.LastName,
                    Copies = a.Books.Sum(b => b.Copies)
                })
                .OrderByDescending(x => x.Copies)
                .ToList();

            string result = string.Join(Environment.NewLine, authors.Select(a => $"{a.Name} - {a.Copies}"));

            return result;
        }

        public static string GetTotalProfitByCategory(BookShopContext context)
        {
            var profits = context.Categories
                .Select(c => new
                {
                    c.Name,
                    Revenue = c.CategoryBooks.Sum(cb => cb.Book.Price * cb.Book.Copies)
                })
                .OrderByDescending(x => x.Revenue)
                .ThenBy(x => x.Name)
                .ToList();

            string result = string.Join(Environment.NewLine, profits.Select(x => $"{x.Name} ${x.Revenue:f2}"));

            return result;
        }

        public static string GetMostRecentBooks(BookShopContext context)
        {
            var categories = context.Categories
                .Select(c => new
                {
                    c.Name,
                    Books = c.CategoryBooks.Select(cb => new
                    {
                        cb.Book.Title,
                        cb.Book.ReleaseDate
                    })
                    .OrderByDescending(b => b.ReleaseDate).Take(3)
                })
                .OrderBy(c => c.Name)
                .ToList();

            string result = string.Join(Environment.NewLine, categories.Select(c => $"--{c.Name}{Environment.NewLine}{string.Join(Environment.NewLine, c.Books.Select(b => $"{b.Title} ({b.ReleaseDate.Value.Year})"))}"));

            return result;
        }

        public static void IncreasePrices(BookShopContext context)
        {
            var books = context.Books
                .Where(b => b.ReleaseDate.Value.Year < 2010)
                .ToList();

            foreach (var book in books)
            {
                book.Price += 5;
            }
            context.SaveChanges();
        }

        public static int RemoveBooks(BookShopContext context)
        {
            var books = context.Books
                .Where(b => b.Copies < 4200)
                .ToList();

            foreach (var book in books)
            {
                context.Remove(book);
            }

            context.SaveChanges();

            return books.Count;
        }

        public static void Main()
        {
            using var db = new BookShopContext();
            DbInitializer.ResetDatabase(db);

            //Insert method(s) from above
        }
    }
}
