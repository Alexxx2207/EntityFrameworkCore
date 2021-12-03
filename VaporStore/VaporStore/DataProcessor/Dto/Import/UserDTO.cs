using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace VaporStore.DataProcessor.Dto.Import
{
    public class UserDTO
    {
        [JsonProperty]
        [Required]
        [RegularExpression(@"^[A-Z]{1}[a-z]* [A-Z]{1}[a-z]*$")]
        public string FullName { get; set; }
        
        [JsonProperty]
        [MinLength(3)]
        [MaxLength(20)]
        public string Username { get; set; }
        
        [JsonProperty]
        [Required]
        public string Email { get; set; }

        [JsonProperty]
        [Range(3,103)]
        public int Age { get; set; }

        public ICollection<CardDTO> Cards { get; set; }
    }
}
