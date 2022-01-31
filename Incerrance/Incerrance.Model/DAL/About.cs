namespace Incerrance.Model.DAL
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Web.Mvc;

    [Table("About")]
    public partial class About
    {
        public Guid Id { get; set; }
        [Display(Name = "Title")]
        [Required(ErrorMessage = "You have not entered a title")]
        [StringLength(255)]
        public string Title { get; set; }
        [Display(Name = "Description")]
        public string Description { get; set; }
        [AllowHtml]
        [Display(Name = "Content")]
        public string Content { get; set; }
        [Display(Name = "Created On")]
        public DateTimeOffset? CreatedOn { get; set; }
        [StringLength(50)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [Display(Name = "Created By")]
        public string CreatedBy { get; set; }
        [Display(Name = "Modified On")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        public DateTimeOffset? ModifiedOn { get; set; }
        [StringLength(50)]
        [Display(Name = "Modified By")]
        public string ModifiedBy { get; set; }
        [Display(Name = "IsDeleted")]
        public bool IsDeleted { get; set; }
    }
}
