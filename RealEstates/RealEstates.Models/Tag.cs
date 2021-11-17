using System.Collections.Generic;

namespace RealEstates.Models
{
    public class Tag
    {
        public int Id { get; set; }

        public string Name { get; set; }

        /// <summary>
        /// The lower the number the greater importance the tag has 
        /// </summary>
        public int? Importance { get; set; }

        public ICollection<Property> Properties { get; set; }
    }
}