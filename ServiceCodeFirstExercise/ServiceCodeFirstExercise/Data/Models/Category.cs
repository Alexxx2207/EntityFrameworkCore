using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceCodeFirstExercise.Data.Models
{
    public class Category
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string Name { get; set; }

        [Required]
        public int DepartmentId { get; set; }

        [Required]
        [NotMapped]
        public Department Department { get; set; }

        public ICollection<Report> Reports { get; set; }
    }
}
