using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceCodeFirstExercise.Data.Models
{
    public class Department
    {
        public Department()
        {
            Categories = new HashSet<Category>();
            Employees = new HashSet<Employee>();
        }
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string Name { get; set; }

        public ICollection<Category> Categories { get; set; }
        public ICollection<Employee> Employees { get; set; }
    }
}
