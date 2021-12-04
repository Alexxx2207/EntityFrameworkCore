using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Theatre.DataProcessor.ImportDto
{
    public class ImportTheaterDTO
    {
        [JsonProperty("Name")]
        [Required]
        [MinLength(4)]
        [MaxLength(30)]
        public string TheaterName { get; set; }

        [JsonProperty("NumberOfHalls")]
        [Required]
        [Range(1, 10)]
        public sbyte NumberOfHalls { get; set; }

        [JsonProperty("Director")]
        [Required]
        [MinLength(4)]
        [MaxLength(30)]
        public string Director { get; set; }

        public ICollection<TicketDTO> Tickets { get; set; }
    }
}
