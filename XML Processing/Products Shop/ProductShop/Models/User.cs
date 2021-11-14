namespace ProductShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.Xml.Serialization;

    public class User
    {
        public User()
        {
            this.ProductsSold = new List<Product>();
            this.ProductsBought = new List<Product>();
        }

        public int Id { get; set; }
        [XmlElement("firstName")]
        public string FirstName { get; set; }
        [XmlElement("lastName")]
        public string LastName { get; set; }
        [XmlElement("age")]
        public int? Age { get; set; }

        [XmlIgnore]
        public ICollection<Product> ProductsSold { get; set; }
        [XmlIgnore]
        public ICollection<Product> ProductsBought { get; set; }
    }
}