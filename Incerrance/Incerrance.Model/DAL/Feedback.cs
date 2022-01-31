namespace Incerrance.Model.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Feedback")]
    public partial class Feedback
    {
        public Guid Id { get; set; }

        [StringLength(256)]
        [Required(ErrorMessage = "You did not enter a first and last name")]
        [Display(Name = "First and last name")]
        public string Name { get; set; }
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$",
                   ErrorMessage = "You did not enter a phone number")]
        [Display(Name = "Phone Number")]
        [StringLength(50)]
        public string Phone { get; set; }
        [Required(ErrorMessage = "You have not entered email yet")]
        [Display(Name = "Email")]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Incorrect mail format.")]
        [StringLength(256)]
        public string Email { get; set; }
        [Display(Name = "Address")]
        [StringLength(256)]
        public string Address { get; set; }
        [Required(ErrorMessage = "You did not enter content")]
        [Display(Name = "Content")]
        public string Content { get; set; }
        [Display(Name = "Feedback")]
        public string Reply { get; set; }
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
    }
}
