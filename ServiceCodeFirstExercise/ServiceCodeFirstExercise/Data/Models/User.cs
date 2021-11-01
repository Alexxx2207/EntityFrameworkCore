using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ServiceCodeFirstExercise.Data.Models
{
    public class User
    {
        public User()
        {
            Reports = new HashSet<Report>();
        }
        public int Id { get; set; }

        [Required]
        [MaxLength(30)]
        public string Username { get; set; }

        [Required]
        [MaxLength(50)]
        public string Password { get; set; }

        [MaxLength(50)]
        public string Name { get; set; }

        public DateTime Birthdate { get; set; }

        [Range(14, 110)]
        public int Age { get; set; }

        [Required]
        [EmailAddress]
        [MaxLength(50)]
        public string Email { get; set; }

        public ICollection<Report> Reports { get; set; }
    }
}
