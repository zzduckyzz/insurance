namespace Incerrance.Model.DAL
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("User")]
    public partial class User
    {
        public Guid Id { get; set; }

        [StringLength(50)]
        [Display(Name = "Role")]
        public string GroupId { get; set; }
        [Display(Name = "User name")]
        [Required(ErrorMessage = "You have not entered your username")]
        [StringLength(50)]
        public string UserName { get; set; }
        [Display(Name = "Password")]
        [Required(ErrorMessage = "You have not entered the password")]
        [StringLength(50)]
        public string Password { get; set; }
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "Password incorrect")]
        [StringLength(50)]
        public string ConfirmPassword { get; set; }
        [Display(Name = "First name")]
        [StringLength(100)]
        public string FirstName { get; set; }
        [Display(Name = "Last name")]
        [StringLength(100)]
        public string LastName { get; set; }
        [Display(Name = "First and last name")]
        public string FullName => FirstName + ' ' + LastName;
        [Required(ErrorMessage = "Bạn chưa nhập email")]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Định dạng email không đúng.")]
        [Display(Name = "Email")]
        [StringLength(256)]
        public string Email { get; set; }
        [StringLength(100)]
        public string ResetPasswordCode { get; set; }
        [Display(Name = "Address")]
        public string Address { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [Display(Name = "Created On")]
        public DateTimeOffset? CreatedOn { get; set; }
        [StringLength(256)]
        [Display(Name = "Created By")]
        public string CreatedBy { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [Display(Name = "Modified On")]
        public DateTimeOffset? ModifiedOn { get; set; }
        [StringLength(256)]
        [Display(Name = "Modified By")]
        public string ModifiedBy { get; set; }
        [Display(Name = "IsDeleted")]
        public bool IsDeleted { get; set; }
        public virtual UserGroup UserGroup { get; set; }
    }
}
