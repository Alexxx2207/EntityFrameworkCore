using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace ProductShop.DTOs
{
    [XmlType("Product")]
    public class ProductsInRangeDTO
    {
        [XmlElement("name")]
        public string name { get; set; }

        [XmlElement("price")]
        public decimal price { get; set; }

        [XmlElement("buyer")]
        public string buyer { get; set; }
    }
}
