using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace ProductShop.DTOs
{
    [XmlType("Users")]
    public class EmportUsersDTO
    {
        [XmlElement("count")]
        public int Count { get; set; }

        [XmlArray]
        public List<UsersAndProducts> users { get; set; }
    }
}

