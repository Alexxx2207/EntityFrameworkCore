using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstates.Models
{
    public class Property
    {
        public int Id { get; set; }

        public double Size { get; set; }

        public double? YardSize { get; set; }

        public int? Floor { get; set; }

        public int? TotalFloors { get; set; }

        public int DistrictId { get; set; }

        public District District { get; set; }

        public int? Year { get; set; }

        public int PropertyTypeId { get; set; }

        public PropertyType PropertyType { get; set; }

        public int BuildingTypeId { get; set; }

        public BuildingType BuildingType { get; set; }

        /// <summary>
        /// In Euros
        /// </summary>
        public decimal? Price { get; set; }

        public ICollection<Tag> Tags { get; set; }
    }
}
