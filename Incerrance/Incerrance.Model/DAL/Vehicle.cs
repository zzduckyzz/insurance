namespace Incerrance.Model.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Vehicle")]
    public partial class Vehicle
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Vehicle()
        {
            Insurrance = new HashSet<Insurrance>();
        }

        public Guid Id { get; set; }

        [Display(Name = "Vehicle Type")]
        [Required(ErrorMessage = "You have not entered a Vehicle Type")]
        public Guid? VehicleTypeId { get; set; }

        [StringLength(250)]
        [Required(ErrorMessage = "You have not entered a Name")]
        public string Name { get; set; }

        [StringLength(250)]
        [Display(Name = "Vehicle Model")]
        [Required(ErrorMessage = "You have not entered a Vehicle Model")]
        public string VehicleModel { get; set; }

        [StringLength(250)]
        [Display(Name = "Vehicle Version")]
        [Required(ErrorMessage = "You have not entered a Vehicle Version")]
        public string VehicleVersion { get; set; }

        [StringLength(250)]
        [Display(Name = "Vehicle Body Number")]
        [Required(ErrorMessage = "You have not entered a Vehicle Body Number")]
        public string VehicleBodyNumber { get; set; }

        [StringLength(250)]
        [Display(Name = "Image Vehicle")]
        [Required(ErrorMessage = "You have not entered a Image Vehicle")]
        public string ImageVehicle { get; set; }

        [StringLength(250)]
        [Display(Name = "Vehicle Engine Number")]
        [Required(ErrorMessage = "You have not entered a Vehicle Engine Number")]
        public string VehicleEngineNumber { get; set; }

        [StringLength(50)]
        [Display(Name = "Meta Title")]
        [Required(ErrorMessage = "You have not entered a Meta Title")]
        public string MetaTitle { get; set; }

        public DateTimeOffset? CreatedOn { get; set; }

        [StringLength(256)]
        public string CreatedBy { get; set; }

        public DateTimeOffset? ModifiedOn { get; set; }

        [StringLength(256)]
        public string ModifiedBy { get; set; }

        public bool? IsDeleted { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Insurrance> Insurrance { get; set; }

        public virtual VehicleType VehicleType { get; set; }
    }
}
