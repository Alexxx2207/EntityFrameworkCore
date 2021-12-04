namespace Theatre.DataProcessor
{
    using Newtonsoft.Json;
    using System;
    using System.IO;
    using System.Linq;
    using System.Xml.Serialization;
    using Theatre.Data;
    using Theatre.DataProcessor.ExportDto;

    public class Serializer
    {
        public static string ExportTheatres(TheatreContext context, int numbersOfHalls)
        {
            var theaters = context.Theatres
                            .ToArray()
                            .Where(t => t.NumberOfHalls >= numbersOfHalls
                                   && t.Tickets.Count() >= 20)
                            .Select(t => new
                            {
                                Name = t.Name,
                                Halls = t.NumberOfHalls,
                                TotalIncome = t.Tickets
                                               .Where(ti => ti.RowNumber >= 1
                                                            && ti.RowNumber <= 5)
                                               .Sum(ti => ti.Price),
                                Tickets = t.Tickets
                                            .Where(ti => ti.RowNumber >= 1
                                                            && ti.RowNumber <= 5)
                                            .Select(ti => new
                                {
                                    Price = ti.Price,
                                    RowNumber = ti.RowNumber
                                })
                                .OrderByDescending(ti => ti.Price)
                            })
                            .OrderByDescending(t => t.Halls)
                            .ThenBy(t => t.Name)
                            .ToArray();

            var json = JsonConvert.SerializeObject(theaters, Formatting.Indented);

            return json;
        }


        public static string ExportPlays(TheatreContext context, double rating)
        {
            var plays = context.Plays
                        .ToArray()
                        .Where(p => p.Rating <= rating)
                        .Select(p => new ExportPlaysDTO
                        {
                            Title = p.Title,
                            Duration = p.Duration.ToString(@"hh\:mm\:ss"),
                            Rating = p.Rating == 0 ? "Premier" : p.Rating.ToString(),
                            Genre = p.Genre.ToString(),
                            Actors = p.Casts.Where(c => c.IsMainCharacter)
                                            .Select(c => new ExportActorDTO
                                            {
                                                FullName = c.FullName,
                                                MainCharacter = $"Plays main character in '{p.Title}'."
                                            })
                                            .OrderByDescending(c => c.FullName)
                                            .ToArray()
                        })
                        .OrderBy(p => p.Title)
                        .ThenByDescending(p => p.Genre)
                        .ToArray();

            var xmlSerializer = new XmlSerializer(typeof(ExportPlaysDTO[]), new XmlRootAttribute("Plays"));

            var writer = new StringWriter();

            var ns = new XmlSerializerNamespaces();
            ns.Add(string.Empty, string.Empty);

            xmlSerializer.Serialize(writer, plays, ns);

            return writer.ToString();
        }
    }
}
