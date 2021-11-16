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

        public double YardSize { get; set; }

        public int Floor { get; set; }

        public int BuildingFloors { get; set; }
    }
}
