using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using TeisterMask.Common;

namespace TeisterMask.DataProcessor.ImportDto
{
    public class EmployeeDTO
    {
        [JsonProperty]
        [Required]
        [MinLength(GlobalConstants.EMPLOYEE_USERNAME_MIN_LENGTH)]
        [MaxLength(GlobalConstants.EMPLOYEE_USERNAME_MAX_LENGTH)]
        [RegularExpression(@"^[A-Za-z0-9]*$")]//???
        public string Username { get; set; }
        
        [JsonProperty]
        [EmailAddress]
        public string Email { get; set; }
        
        [JsonProperty]
        [MaxLength(GlobalConstants.EMPLOYEE_Phone_MAX_LENGTH)]
        [RegularExpression(@"^\d{3}-\d{3}-\d{4}$")]
        public string Phone { get; set; }

        public ICollection<int> Tasks { get; set; }
    }
}
