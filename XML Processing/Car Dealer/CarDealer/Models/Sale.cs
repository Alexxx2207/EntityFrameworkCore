using System.Xml.Serialization;

namespace CarDealer.Models
{
    [XmlType("Sale")]
    public class Sale
    {
        public int Id { get; set; }

        [XmlElement("discount")]
        public decimal Discount { get; set; }

        [XmlElement("carId")]
        public int CarId { get; set; }
        public Car Car { get; set; }

        [XmlElement("customerId")]
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }
    }
}
