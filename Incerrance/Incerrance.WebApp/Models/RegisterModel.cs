using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Incerrance.WebApp.Models
{
    public class RegisterModel
    {
        [Key]
        public Guid Id { get; set; }
        [Display(Name = "User name")]
        [Required(ErrorMessage = "Please enter your username")]
        public string UserName { get; set; }
        [Display(Name = "Password")]
        [Required(ErrorMessage = "Please enter a password")]
        public string Password { get; set; }
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "Password incorrect")]
        public string ConfirmPassword { get; set; }
        [Required(ErrorMessage = "Please enter the last name")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Please enter a name")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        [Display(Name = "Email")]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Định dạng email không đúng.")]
        [Required(ErrorMessage = "Please enter your email")]
        public string Email { get; set; }
        public string Address { get; set; }
    }
}