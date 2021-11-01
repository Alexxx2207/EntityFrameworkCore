using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceCodeFirstExercise.Data.Models
{
    public class Status
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(30)]
        public string Label { get; set; }
    }
}
