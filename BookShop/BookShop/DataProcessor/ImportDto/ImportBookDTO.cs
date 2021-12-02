using BookShop.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Xml.Serialization;

namespace BookShop.DataProcessor.ImportDto
{
    [XmlType("Book")]
    public class ImportBookDTO
    {
        [XmlElement]
        [MinLength(GlobalConstants.BOOK_NAME_MIN_LENGTH)]
        [MaxLength(GlobalConstants.BOOK_NAME_MAX_LENGTH)]
        public string Name { get; set; }

        [XmlElement]
        [Range(GlobalConstants.BOOK_GENRE_MIN_NUMBER, GlobalConstants.BOOK_GENRE_MAX_NUMBER)]
        public int Genre { get; set; }

        [XmlElement]
        public decimal Price { get; set; }

        [XmlElement]
        [Range(GlobalConstants.BOOK_PAGES_MIN_NUMBER, GlobalConstants.BOOK_PAGES_MAX_NUMBER)]
        public int Pages { get; set; }

        [XmlElement]
        public string PublishedOn { get; set; }
    }
}
