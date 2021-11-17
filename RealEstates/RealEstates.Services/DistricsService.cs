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
    public class DistricsService : IDistrictsService
    {
        private RealEstateDbContext db;

        public DistricsService(RealEstateDbContext context)
        {
            db = context;
        }

        public IEnumerable<MostExpensiveDistrictDTO> GetMostExpensiveDistricts(int count)
        {
            var districts = db.Districts
                .Select(d => new MostExpensiveDistrictDTO
                {
                    Name = d.Name,
                    PropertiesCount = d.Properties.Count(),
                    PricePerSquareMeter = d.Properties
                                           .Where(p => p.Price.HasValue)
                                           .Average(p => p.Price.Value / (decimal)p.Size)
                })
                .OrderByDescending(d => d.PricePerSquareMeter)
                .Take(count)
                .ToList();

            return districts;
        }
    }
}
