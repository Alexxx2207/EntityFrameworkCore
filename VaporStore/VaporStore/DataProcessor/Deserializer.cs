namespace VaporStore.DataProcessor
{
	using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Globalization;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Xml.Serialization;
    using Data;
    using Newtonsoft.Json;
    using VaporStore.Data.Models;
    using VaporStore.Data.Models.Enums;
    using VaporStore.DataProcessor.Dto.Import;

    public static class Deserializer
	{
		private const string ErrorMessage = "Invalid Data";

		private const string SuccessfullyAddedGame = "Added {0} ({1}) with {2} tags";

		private const string SuccessfullyAddedUsers = "Imported {0} with {1} cards";

		private const string SuccessfullyAddedPurchases = "Imported {0} for {1}";

		public static string ImportGames(VaporStoreDbContext context, string jsonString)
		{
			var sb = new StringBuilder();

			var games = JsonConvert.DeserializeObject<List<GameDTO>>(jsonString);

			var gamesToImport = new List<Game>();
			var gameTagsToImport = new List<Tag>();

            foreach (var game in games)
            {
				if (!IsValid(game))
				{
					sb.AppendLine(ErrorMessage);
					continue;
				}

				if (game.Price < 0)
				{
					sb.AppendLine(ErrorMessage);
					continue;
				}

				if (game.Tags == null || game.Tags.Count == 0)
				{
					sb.AppendLine(ErrorMessage);
					continue;
				}

				var convertedReleaseDate = DateTime.ParseExact(game.ReleaseDate, "yyyy-MM-dd",
											CultureInfo.InvariantCulture);


				var developer = gamesToImport.Select(g => g.Developer).FirstOrDefault(d => d.Name == game.Developer);
				if (developer == null)
				{
					developer = new Developer
					{
						Name = game.Developer 
					};
				}

				var genre = gamesToImport.Select(g => g.Genre).FirstOrDefault(g => g.Name == game.Genre);
				if (genre == null)
				{
					genre = new Genre
					{
						Name = game.Genre 
					};
				}

				var gameToImport = new Game()
				{
					Name = game.Name,
					Developer = developer,
					Genre = genre,
					Price = game.Price,
					ReleaseDate = convertedReleaseDate,
				};


				var tagOfTheGame = new List<GameTag>();
				foreach (var currentTag in game.Tags)
                {
                    var tag = gameTagsToImport.FirstOrDefault(t => t.Name == currentTag);

                    if (tag == null)
                    {
                        tag = new Tag
                        {
                            Name = currentTag
                        };
                    }

					tagOfTheGame.Add(new GameTag
					{ 
						Tag = tag,
						Game = gameToImport
					});

					gameTagsToImport.Add(tag);

				}

				gameToImport.GameTags = tagOfTheGame;

				gamesToImport.Add(gameToImport);

				sb.AppendLine(string.Format(SuccessfullyAddedGame, gameToImport.Name,
									gameToImport.Genre.Name, gameToImport.GameTags.Count));
			}

			context.AddRange(gamesToImport);
			context.SaveChanges();

			return sb.ToString();
		}

		public static string ImportUsers(VaporStoreDbContext context, string jsonString)
		{
			var sb = new StringBuilder();

			var users = JsonConvert.DeserializeObject<List<UserDTO>>(jsonString);

			var usersToImport = new List<User>();

            foreach (var user in users)
            {
				if(!IsValid(user))
                {
					sb.AppendLine(ErrorMessage);
					continue;
                }

				if (user.Cards == null || user.Cards.Count == 0)
				{
					sb.AppendLine(ErrorMessage);
					continue;
				}

				var userToImport = new User
				{
					FullName = user.FullName,
					Username = user.Username,
					Age = user.Age,
					Email = user.Email
				};

				bool validUserCards = true;

                foreach (var card in user.Cards)
                {
					if (!IsValid(card))
					{
						sb.AppendLine(ErrorMessage);
						validUserCards = false;
						break;
					}
                    else
                    {
						CardType cardType = (CardType) Enum.Parse(typeof(CardType), card.Type);

						userToImport.Cards.Add(new Card
						{ 
							Cvc = card.CVC,
							Number = card.Number,
							Type = cardType,
							User = userToImport
						});
                    }
                }

				if (!validUserCards)
				{
					continue;
				}

				usersToImport.Add(userToImport);

				sb.AppendLine(string.Format(SuccessfullyAddedUsers,
											userToImport.Username, userToImport.Cards.Count));
            }

			context.AddRange(usersToImport);
			context.SaveChanges();

			return sb.ToString();
		}

		public static string ImportPurchases(VaporStoreDbContext context, string xmlString)
		{
			var sb = new StringBuilder();

			var xmlSerializer = new XmlSerializer(typeof(PurchaseDTO[]), new XmlRootAttribute("Purchases"));

			var purchases = (PurchaseDTO[])xmlSerializer.Deserialize(new StringReader(xmlString));

			var purchasesToImport = new List<Purchase>();

			foreach (var purchase in purchases)
			{
				if (!IsValid(purchase))
				{
					sb.AppendLine(ErrorMessage);
					continue;
				}

				var dateTime = DateTime.ParseExact(purchase.Date,
													"dd/MM/yyyy HH:mm"													,
													CultureInfo.InvariantCulture);

				var card = context.Cards.FirstOrDefault(c => c.Number == purchase.Card);
				if (card == null)
				{
					sb.AppendLine(ErrorMessage);
					continue;
				}

				var game = context.Games.FirstOrDefault(g => g.Name == purchase.Title);
				if (game == null)
				{
					sb.AppendLine(ErrorMessage);
					continue;
				}

				PurchaseType purchaseType = (PurchaseType)Enum.Parse(typeof(PurchaseType), purchase.Type);

				var purchaseToImport = new Purchase()
				{
					ProductKey = purchase.Key,
					Card = card,
					Game = game,
					Type = purchaseType,
					Date = dateTime
				};

				purchasesToImport.Add(purchaseToImport);

				sb.AppendLine(string.Format(SuccessfullyAddedPurchases,
								purchaseToImport.Game.Name, purchaseToImport.Card.User.Username));
			}
			context.AddRange(purchasesToImport);
			context.SaveChanges();

			return sb.ToString();
		}

		private static bool IsValid(object dto)
		{
			var validationContext = new ValidationContext(dto);
			var validationResult = new List<ValidationResult>();

			return Validator.TryValidateObject(dto, validationContext, validationResult, true);
		}
	}
}