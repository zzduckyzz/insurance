namespace Incerrance.Model.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("VehicleType")]
    public partial class VehicleType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public VehicleType()
        {
            Vehicle = new HashSet<Vehicle>();
        }

        public Guid Id { get; set; }

        [StringLength(250)]
        [Required(ErrorMessage = "You have not entered a Name")]
        public string Name { get; set; }

        [StringLength(50)]
        [Display(Name = "Meta Title")]
        [Required(ErrorMessage = "You have not entered a Meta Title")]
        public string MetaTitle { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "You have not entered a Description")]
        public string Description { get; set; }

        public DateTimeOffset? CreatedOn { get; set; }

        [StringLength(256)]
        public string CreatedBy { get; set; }

        public DateTimeOffset? ModifiedOn { get; set; }

        [StringLength(256)]
        public string ModifiedBy { get; set; }

        public bool? IsDeleted { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Vehicle> Vehicle { get; set; }
    }
}
