using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Incerrance.WebApp.Models
{
    public class LoginModel
    {
        [Key]
        [Display(Name = "User name")]
        [Required(ErrorMessage = "You have not entered your username")]
        public string UserName { get; set; }
        [Display(Name = "Password")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "You have not entered your password ")]
        public string Password { get; set; }
    }
}