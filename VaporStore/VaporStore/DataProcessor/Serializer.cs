namespace VaporStore.DataProcessor
{
	using System;
    using System.IO;
    using System.Linq;
    using System.Xml.Serialization;
    using Data;
    using Microsoft.EntityFrameworkCore;
    using Newtonsoft.Json;
    using VaporStore.DataProcessor.Dto.Export;

    public static class Serializer
	{
		public static string ExportGamesByGenres(VaporStoreDbContext context, string[] genreNames)
		{
			var listOfgenres = genreNames.ToList();
			
			var gamesByGenres = context.Genres
								.Where(g => listOfgenres.Contains(g.Name))
								.Include(g => g.Games)
								.ThenInclude(g => g.Purchases)
								.Include(g => g.Games)
								.ThenInclude(g => g.GameTags)
								.ThenInclude(gt => gt.Tag)
								.Include(g => g.Games)
								.ThenInclude(g => g.Developer)
								.ToList()
								.Select(g => new
								{
									Id = g.Id,
									Genre = g.Name,
									Games = g.Games
											 .Where(game => game.Purchases.Count > 0)
											 .Select(game => new
									{
										Id = game.Id,
										Title = game.Name,
										Developer = game.Developer.Name,
										Tags = string.Join(", ", game.GameTags.Select(gt => gt.Tag.Name)),
										Players = game.Purchases.Count
									})
									.OrderByDescending(g => g.Players)
									.ThenBy(g => g.Id),
									TotalPlayers = g.Games.Sum(game => game.Purchases.Count)
								})
								.OrderByDescending(g => g.TotalPlayers)
								.ThenBy(g => g.Id)
								.ToList();

			string json = JsonConvert.SerializeObject(gamesByGenres, Formatting.Indented);

			return json;

		}

		public static string ExportUserPurchasesByType(VaporStoreDbContext context, string storeType)
		{
			var writer = new StringWriter();

			var xmlSerializer = new XmlSerializer(typeof(ExportUserDTO[]), new XmlRootAttribute("Users"));

			var user = context.Users
						.ToArray()
						.Where(u => u.Cards.Any(c => c.Purchases.Any()))
						.Select(u => new ExportUserDTO
						{
							Username = u.Username,
							Purchases = u.Cards
										.Where(c => c.Purchases.Any())
										.SelectMany(c => c.Purchases)
										.Where(p => p.Type.ToString() == storeType)
										.Select(p => new ExportPurchaseDTO
										{
											Card = p.Card.Number,
											Cvc = p.Card.Cvc,
											Date = p.Date.ToString("yyyy-MM-dd HH:mm"),
											Game = new ExportGameDTO
											{
												Genre = p.Game.Genre.Name,
												Title = p.Game.Name,
												Price = p.Game.Price
											}
										})
										.OrderBy(p => p.Date)
										.ToArray(),
							TotalMoneySpent = u.Cards
												.SelectMany(c => c.Purchases)
												.Where(p => p.Type.ToString() == storeType)
												.Sum(p => p.Game.Price)
						})
						.Where(u => u.Purchases.Any())
						.OrderByDescending(u => u.TotalMoneySpent)
						.ThenBy(u => u.Username)
						.ToArray();

			var ns = new XmlSerializerNamespaces();
			ns.Add(string.Empty, string.Empty);

			xmlSerializer.Serialize(writer, user, ns);

			return writer.ToString();
		}
	}
}