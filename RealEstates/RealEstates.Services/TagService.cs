using Microsoft.EntityFrameworkCore;
using RealEstates.Data;
using RealEstates.Models;
using RealEstates.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstates.Services
{
    public class TagService : ITagService
    {
        private RealEstateDbContext db;
        private decimal averagePrice;
        private double averageYear;
        private double averageSize;

        public TagService(RealEstateDbContext context)
        {
            db = context;

            averagePrice = AveragePriceOfAllProperties();
            averageYear = AverageYearOfAllProperties();
            averageSize = AverageSizeOfAllProperties();
        }

        public void AddTags()
        {

            var tags = new Tag[]
                {
                    new Tag { Name = "скъп-имот" , Importance = 1 },
                    new Tag { Name = "евтин-имот" , Importance = 1 },
                    new Tag { Name = "нов-имот" , Importance = 2 },
                    new Tag { Name = "стар-имот" , Importance = 2 },
                    new Tag { Name = "голям-имот" , Importance = 3 },
                    new Tag { Name = "малък-имот" , Importance = 3 },
                    new Tag { Name = "последен-етаж" , Importance = 4 },
                    new Tag { Name = "първи-етаж" , Importance = 4 },
                };

            foreach (var tag in tags)
            {
                if(!db.Tags.Any(t => t.Name == tag.Name))
                    db.Tags.Add(new Tag { Name = tag.Name, Importance = tag.Importance});
            }
            db.SaveChanges();
        }

        private decimal AveragePriceOfAllProperties()
        {
            return db.Properties.Average(p => p.Price) ?? 0;
        }

        private double AverageYearOfAllProperties()
        {
            return db.Properties.Average(prop => prop.Year) ?? 0;
        }

        private double AverageSizeOfAllProperties()
        {
            return db.Properties.Average(prop => prop.Size);
        }

        public void SetTagsToProperties()
        {
            var properties = db.Properties
                .Include(p => p.Tags)
                .ToList();

            foreach (var property in properties)
            {
                if (property.Price != null && !property.Tags.Any(t => t.Importance < 3))
                {
                    if (property.Price <= averagePrice)
                    {
                        var tag = db.Tags
                            .Include(p => p.Properties)
                            .First(t => t.Name == "евтин-имот");
                        property.Tags.Add(tag);
                        db.Tags.Find(tag.Id).Properties.Add(property);
                    }
                    else
                    {
                        var tag = db.Tags
                            .Include(p => p.Properties)
                            .First(t => t.Name == "скъп-имот");
                        property.Tags.Add(tag);
                        db.Tags.Find(tag.Id).Properties.Add(property);
                    }
                }

                if (property.Year != null && !property.Tags.Any(t => t.Importance < 5 && t.Importance > 2))
                {
                    if (property.Year <= averageYear)
                    {
                        var tag = db.Tags
                                .Include(p => p.Properties)
                                .First(t => t.Name == "стар-имот");
                        property.Tags.Add(tag);
                        db.Tags.Find(tag.Id).Properties.Add(property);

                    }
                    else
                    {
                        var tag = db.Tags
                                    .Include(p => p.Properties)
                                    .First(t => t.Name == "нов-имот");
                        property.Tags.Add(tag);
                        db.Tags.Find(tag.Id).Properties.Add(property);

                    }
                }

                if (!property.Tags.Any(t => t.Importance < 7 && t.Importance > 4))
                {
                    if (property.Size <= averageSize)
                    {
                        var tag = db.Tags
                                .Include(p => p.Properties)
                                .First(t => t.Name == "малък-имот");
                        property.Tags.Add(tag);
                        db.Tags.Find(tag.Id).Properties.Add(property);

                    }
                    else
                    {
                        var tag = db.Tags
                                .Include(p => p.Properties)
                                .First(t => t.Name == "голям-имот");
                        property.Tags.Add(tag);
                        db.Tags.Find(tag.Id).Properties.Add(property);

                    } 
                }

                if (property.Floor != null && property.TotalFloors != null &&
                    !property.Tags.Any(t => t.Importance < 9 && t.Importance > 6))
                {
                    if (property.Floor == 1)
                    {
                        var tag = db.Tags
                            .Include(p => p.Properties)
                            .First(t => t.Name == "първи-етаж");
                        property.Tags.Add(tag);
                        db.Tags.Find(tag.Id).Properties.Add(property);

                    }
                    else if (property.Floor == property.TotalFloors)
                    {
                        var tag = db.Tags
                            .Include(p => p.Properties)
                            .First(t => t.Name == "последен-етаж");
                        property.Tags.Add(tag);
                        db.Tags.Find(tag.Id).Properties.Add(property);

                    }
                }

                db.SaveChanges();
            }
        }
    }
}
