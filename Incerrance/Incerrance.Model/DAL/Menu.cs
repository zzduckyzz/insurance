namespace Incerrance.Model.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Menu")]
    public partial class Menu
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "You have not entered a name menu")]
        [StringLength(256)]
        [Display(Name = "Name")]
        public string MenuName { get; set; }
        [Display(Name = "Link")]
        [StringLength(256)]
        [Required(ErrorMessage = "You have not entered the link")]
        public string Link { get; set; }
        [Display(Name = "Stt")]
        public int? DisplayOrder { get; set; }
        [Display(Name = "Mini menu")]
        public int? ParentId { get; set; }
        [Display(Name = "Turn to page")]
        [Required(ErrorMessage = "you have not entered the page transitions yet")]
        [StringLength(256)]
        public string Target { get; set; }
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
        [Display(Name = "Is Deleted")]
        public bool IsDeleted { get; set; }
    }
}
