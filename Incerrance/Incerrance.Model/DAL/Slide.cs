namespace Incerrance.Model.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Slide")]
    public partial class Slide
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "You have not selected pictures")]
        [StringLength(256)]
        [Display(Name = "Image")]
        public string UrlImage { get; set; }
        [Display(Name = "Stt")]
        public int? DisplayOrder { get; set; }
        [Display(Name = "Link")]
        [StringLength(256)]
        public string Link { get; set; }
        [Display(Name = "Description")]
        [StringLength(256)]
        public string Description { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [Display(Name = "Created On")]
        public DateTimeOffset? CreatedOn { get; set; }
        [Display(Name = "Created By")]
        [StringLength(256)]
        public string CreatedBy { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [Display(Name = "Modified On")]
        public DateTimeOffset? ModifiedOn { get; set; }
        [Display(Name = "Modified By")]
        [StringLength(256)]
        public string ModifiedBy { get; set; }
        [Display(Name = "IsDeleted")]
        public bool IsDeleted { get; set; }
    }
}
