using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Incerrance.WebApp.Areas.Admin.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "You have not entered User Name")]
        [Display(Name = "User name")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "You have not entered the Password")]
        [Display(Name = "Password")]
        public string Password { get; set; }
        public bool RememberMe { get; set; }
    }
}