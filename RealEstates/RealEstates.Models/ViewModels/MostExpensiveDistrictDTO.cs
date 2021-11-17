using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstates.Models.ViewModels
{
    public class MostExpensiveDistrictDTO
    {
        public string Name { get; set; }

        public decimal PricePerSquareMeter { get; set; }

        public int PropertiesCount { get; set; }
    }
}
