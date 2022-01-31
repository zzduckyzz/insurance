namespace Incerrance.Model.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
	using System.Web.Mvc;

	[Table("Insurrance")]
    public partial class Insurrance
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Insurrance()
        {
            Registration_Insurance = new HashSet<Registration_Insurance>();
        }

        public Guid Id { get; set; }

        [Display(Name = "Vehicle ")]
        [Required(ErrorMessage = "You have not entered a Vehicle")]
        public Guid? VehicleId { get; set; }

        [StringLength(50)]
        [Display(Name = "Insurrance Code ")]
        [Required(ErrorMessage = "You have not entered a Insurrance Code")]
        public string InsurranceCode { get; set; }

        [StringLength(250)]
        [Display(Name = "Name")]
        [Required(ErrorMessage = "You have not entered a Name")]
        public string Name { get; set; }

        [AllowHtml]
        [Required(ErrorMessage = "You have not entered a Description")]
        public string Description { get; set; }

        [StringLength(250)]
        [Display(Name = "Meta Title")]
        [Required(ErrorMessage = "You have not entered a MetaTitle")]
        public string MetaTitle { get; set; }

        [Required(ErrorMessage = "You have not entered a Price")]
        public int? Price { get; set; }

        [Display(Name = "Time Insurrance")]
        [Required(ErrorMessage = "You have not entered a Time Insurrance")]
        public int? TimeInsurrance { get; set; }

        [Display(Name = "Quantity")]
        [Required(ErrorMessage = "You have not entered a Quantity")]
        public int? Quantity { get; set; }

        public bool IsDeleted { get; set; }

        public DateTimeOffset? CreatedOn { get; set; }

        [StringLength(256)]
        public string CreatedBy { get; set; }

        public DateTimeOffset? ModifiedOn { get; set; }

        [StringLength(256)]
        public string ModifiedBy { get; set; }

        public virtual Vehicle Vehicle { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Registration_Insurance> Registration_Insurance { get; set; }
    }
}
