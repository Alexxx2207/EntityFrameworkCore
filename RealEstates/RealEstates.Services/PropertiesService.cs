using RealEstates.Data;
using RealEstates.Models.ViewModels;
using RealEstates.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstates.Services
{
    public class PropertiesService : IPropertiesService
    {
        private RealEstateDbContext db;
        public PropertiesService(RealEstateDbContext context)
        {
            db = context;
        }

        public IEnumerable<SearchedPropertyDTO> SearchForProperty(
                                decimal minPrice, decimal maxPrice, 
                                int minFloor, 
                                double minSize)
        {
            var properties = db.Properties
                            .Where(p => p.Size >= minSize &&
                                        p.Price >= minPrice && p.Price <= maxPrice &&
                                        p.Floor >= minFloor)
                            .Select(p => new SearchedPropertyDTO()
                            {
                                BuildingFloors = p.TotalFloors,
                                Size = p.Size,
                                YardSize = p.YardSize,
                                Price = p.Price,
                                DistrictName = p.District.Name,
                                Floor = p.Floor,
                                BuildingTypeName = p.BuildingType.Name,
                                PropertyTypeName = p.PropertyType.Name,
                                Year = p.Year,
                                //Tags = p.Tags.OrderBy(t => t.Importance).Select(t => t.Name)
                            })
                            .ToList();
                            
            return properties;
        }
    }
}
