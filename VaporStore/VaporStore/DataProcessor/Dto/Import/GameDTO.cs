using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace VaporStore.DataProcessor.Dto.Import
{
    public class GameDTO
    {
        [JsonProperty]
        [Required]
        public string Name { get; set; }

        [JsonProperty]
        [Required]
        public decimal Price { get; set; }

        [JsonProperty]
        public string ReleaseDate { get; set; }

        [JsonProperty]
        [Required]
        public string Developer { get; set; }

        [JsonProperty]
        [Required]
        public string Genre { get; set; }

        public ICollection<string> Tags { get; set; }
    }
}
