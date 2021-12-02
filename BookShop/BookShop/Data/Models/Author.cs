using BookShop.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace BookShop.Data.Models
{
    public class Author
    {
        public Author()
        {
            AuthorsBooks = new HashSet<AuthorBook>();
        }

        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(GlobalConstants.AUTHOR_FIRSTNAME_MAX_LENGTH)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(GlobalConstants.AUTHOR_LASTNAME_MAX_LENGTH)]
        public string LastName { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        [MaxLength(GlobalConstants.AUTHOR_PHONE_MAX_LENGTH)]
        public string Phone { get; set; }

        public ICollection<AuthorBook> AuthorsBooks { get; set; }
    }
}
