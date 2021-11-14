using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace ProductShop.DTOs
{
    [XmlType("SoldProduct")]
    public class ProductsSoldPerUser
    {
        [XmlElement("count")]
        public int Count { get; set; }

        [XmlArray]
        public List<OneSoldProductDTO> products { get; set; }
    }
}
