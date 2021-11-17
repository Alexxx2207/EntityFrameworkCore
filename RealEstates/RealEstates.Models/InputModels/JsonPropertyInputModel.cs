using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstates.Models.InputModels
{
    public class JsonPropertyInputModel
    {

        public double Size { get; set; }

        public double YardSize { get; set; }

        public int Floor { get; set; }

        public int TotalFloors { get; set; }
        
        public string District { get; set; }

        public int Year { get; set; }

        public string Type { get; set; }

        public string BuildingType { get; set; }

        public decimal Price { get; set; }
    }
}
