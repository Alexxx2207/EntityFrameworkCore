using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstates.Models.ViewModels
{
    public class SearchedPropertyDTO
    {
        public double Size { get; set; }

        public double? YardSize { get; set; }

        public int? Floor { get; set; }

        public int? BuildingFloors { get; set; }

        public string DistrictName { get; set; }

        public int? Year { get; set; }

        public string PropertyTypeName { get; set; }

        public string BuildingTypeName { get; set; }

        public decimal? Price { get; set; }

        public IEnumerable<string> Tags { get; set; }
    }
}
