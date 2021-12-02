using BookShop.Common;
using BookShop.Data.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace BookShop.DataProcessor.ImportDto
{
    public class ImportAuthorDTO
    {
        [JsonProperty("FirstName")]
        [MinLength(GlobalConstants.AUTHOR_FIRSTNAME_MIN_LENGTH)]
        [MaxLength(GlobalConstants.AUTHOR_FIRSTNAME_MAX_LENGTH)]
        [Required]
        public string FirstName { get; set; }
        
        [JsonProperty("LastName")]
        [Required]
        [MinLength(GlobalConstants.AUTHOR_LASTNAME_MIN_LENGTH)]
        [MaxLength(GlobalConstants.AUTHOR_LASTNAME_MAX_LENGTH)]
        public string LastName { get; set; }
        
        [JsonProperty("Phone")]
        [Required]
        [MaxLength(GlobalConstants.AUTHOR_PHONE_MAX_LENGTH)]
        [RegularExpression(@"^\d{3}\-\d{3}\-\d{4}$")]
        public string Phone { get; set; }
        
        [JsonProperty("Email")]
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        public ICollection<ImportBookForAuthorFTO> Books { get; set; }
    }
}
