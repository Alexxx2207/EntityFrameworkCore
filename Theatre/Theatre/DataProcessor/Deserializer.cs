namespace Theatre.DataProcessor
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Globalization;
    using System.IO;
    using System.Text;
    using System.Xml.Serialization;
    using Theatre.Data;
    using Theatre.Data.Models;
    using Theatre.Data.Models.Enums;
    using Theatre.DataProcessor.ImportDto;

    public class Deserializer
    {
        private const string ErrorMessage = "Invalid data!";

        private const string SuccessfulImportPlay
            = "Successfully imported {0} with genre {1} and a rating of {2}!";

        private const string SuccessfulImportActor
            = "Successfully imported actor {0} as a {1} character!";

        private const string SuccessfulImportTheatre
            = "Successfully imported theatre {0} with #{1} tickets!";

        public static string ImportPlays(TheatreContext context, string xmlString)
        {
            var sb = new StringBuilder();

            var xmlSerializer = new XmlSerializer(typeof(ImportPlaysDTO[]), new XmlRootAttribute("Plays"));

            var plays = (ImportPlaysDTO[])xmlSerializer.Deserialize(new StringReader(xmlString));

            var playsToImport = new List<Play>();

            foreach (var play in plays)
            {
                if (!IsValid(play))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                TimeSpan timeSpan = TimeSpan.ParseExact(play.Duration,
                                                "c",
                                                CultureInfo.InvariantCulture);

                bool isValidGenre = Enum.TryParse(typeof(Genre),
                    play.Genre,
                     out object genre);

                if (!isValidGenre)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                if (timeSpan.Hours < 1)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                var playToImport = new Play()
                {
                    Title = play.Title,
                    Duration = timeSpan,
                    Rating = play.Rating,
                    Genre = (Genre)genre,
                    Description = play.Description,
                    Screenwriter = play.Screenwriter
                };

                playsToImport.Add(playToImport);
                sb.AppendLine(string.Format(SuccessfulImportPlay,
                            playToImport.Title,
                            playToImport.Genre.ToString(),
                            playToImport.Rating));
            }

            context.Plays.AddRange(playsToImport);
            context.SaveChanges();

            return sb.ToString();
        }

        public static string ImportCasts(TheatreContext context, string xmlString)
        {
            var sb = new StringBuilder();

            var xmlSerializer = new XmlSerializer(typeof(ImportCastDTO[]), new XmlRootAttribute("Casts"));

            var casts = (ImportCastDTO[])xmlSerializer.Deserialize(new StringReader(xmlString));

            var castsToImport = new List<Cast>();

            foreach (var cast in casts)
            {
                if (!IsValid(cast))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                var play = context.Plays.Find(cast.PlayId);

                var castToImport = new Cast
                { 
                    FullName = cast.FullName,
                    IsMainCharacter = bool.Parse(cast.IsMainCharacter),
                    PhoneNumber = cast.PhoneNumber,
                    Play = play
                };

                castsToImport.Add(castToImport);
                sb.AppendLine(string.Format(SuccessfulImportActor,
                                castToImport.FullName,
                                castToImport.IsMainCharacter ? "main" : "lesser"
                                ));
            }

            context.Casts.AddRange(castsToImport);
            context.SaveChanges();

            return sb.ToString();
        }

        public static string ImportTtheatersTickets(TheatreContext context, string jsonString)
        {
            var sb = new StringBuilder();

            var theaters = JsonConvert.DeserializeObject<List<ImportTheaterDTO>>(jsonString);

            var theatersToImport = new List<Theatre>();

            foreach (var theater in theaters)
            {
                if (!IsValid(theater))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }

                var theaterToImport = new Theatre
                {
                    Name = theater.TheaterName,
                    NumberOfHalls = theater.NumberOfHalls,
                    Director = theater.Director
                };

                foreach (var ticket in theater.Tickets)
                {
                    if (!IsValid(ticket))
                    {
                        sb.AppendLine(ErrorMessage);
                        continue;
                    }

                    var play = context.Plays.Find(ticket.PlayId);

                    var ticketToImport = new Ticket
                    { 
                        Price = ticket.Price,
                        RowNumber = ticket.RowNumber,
                        Play = play,
                        Theatre = theaterToImport
                    };

                    theaterToImport.Tickets.Add(ticketToImport);
                }

                theatersToImport.Add(theaterToImport);
                sb.AppendLine(string.Format(SuccessfulImportTheatre,
                                    theaterToImport.Name,
                                    theaterToImport.Tickets.Count));
            }


            context.Theatres.AddRange(theatersToImport);
            context.SaveChanges();

            return sb.ToString();
        }


        private static bool IsValid(object obj)
        {
            var validator = new ValidationContext(obj);
            var validationRes = new List<ValidationResult>();

            var result = Validator.TryValidateObject(obj, validator, validationRes, true);
            return result;
        }
    }
}
