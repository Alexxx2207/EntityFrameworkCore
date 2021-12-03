using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace VaporStore.DataProcessor.Dto.Import
{
    public class CardDTO
    {
        [JsonProperty]
        [Required]
        [RegularExpression(@"^\d{4} \d{4} \d{4} \d{4}$")]
        public string Number { get; set; } 
        
        [JsonProperty]
        [Required]
        [RegularExpression(@"^\d{3}$")]
        public string CVC { get; set; }
        
        [JsonProperty]
        [Required]
        [RegularExpression(@"^(Debit|Credit)$")]
        public string Type { get; set; }


    }
}
