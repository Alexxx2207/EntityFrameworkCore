using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceCodeFirstExercise.Data.Models
{
    public class Report
    {
        public int Id { get; set; }

        [Required]
        public int CategoryId { get; set; }
        [Required]
        public Category Category { get; set; }

        [Required]
        public int StatusId { get; set; }
        [Required]
        public Status Status { get; set; }

        [Required]
        public DateTime OpenDate { get; set; }

        public DateTime? CloseDate { get; set; }

        [Required]
        [MaxLength(200)]
        public string Description { get; set; }

        [Required]
        public int UserId { get; set; }
        [Required]
        public User User { get; set; }

        public int? EmployeeId { get; set; }
        public Employee Employee { get; set; }
    }
}
