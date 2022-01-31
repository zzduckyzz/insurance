namespace Incerrance.Model.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Registration_Insurance
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Registration_Insurance()
        {
            ClaimInsurance = new HashSet<ClaimInsurance>();
        }

        public Guid Id { get; set; }

        [Display(Name = "Insurrance")]
        [Required(ErrorMessage = "You have not entered a Insurrance")]
        public Guid? InsurranceId { get; set; }

        [Display(Name = "User")]
        [Required(ErrorMessage = "You have not entered a User")]
        public Guid? UserId { get; set; }

        [StringLength(255)]

        [Display(Name = "Full Name")]
        [Required(ErrorMessage = "You have not entered a Full Name")]
        public string FullName { get; set; }

        [Column(TypeName = "date")]
        [Display(Name = "Date Of Birth")]
        [Required(ErrorMessage = "You have not entered a DateOfBirth")]
        public DateTime? DateOfBirth { get; set; }

        [StringLength(255)]
        [Required(ErrorMessage = "You have not entered a Address")]
        public string Address { get; set; }

        [StringLength(255)]
        [Required(ErrorMessage = "You have not entered a Phone")]
        public string Phone { get; set; }

        [StringLength(255)]
        [Required(ErrorMessage = "You have not entered a Email")]
        public string Email { get; set; }

        [StringLength(255)]
        [Display(Name = "License Plate")]
        [Required(ErrorMessage = "You have not entered a License Plate")]
        public string LicensePlate { get; set; }

        [Display(Name = "Vehicle Rate")]
        [Required(ErrorMessage = "You have not entered a Vehicle Rate")]
        public int? VehicleRate { get; set; }

        [StringLength(255)]
        [Display(Name = "Range Of Vehicle")]
        [Required(ErrorMessage = "You have not entered a Range Of Vehicle")]
        public string RangeOfVehicle { get; set; }

        [Display(Name = "Registration Date")]
        [Required(ErrorMessage = "You have not entered a Registration Date")]
        public DateTime? RegistrationDate { get; set; }

        [Display(Name = "Expiration Date")]
        [Required(ErrorMessage = "You have not entered a Expiration Date")]
        public DateTime? ExpirationDate { get; set; }

        [Display(Name = "Total Money")]
        [Required(ErrorMessage = "You have not entered a Total Money")]
        public int? TotalMoney { get; set; }

        [StringLength(255)]
        public string CMND { get; set; }

        [StringLength(255)]
        public string Status { get; set; }

        [StringLength(50)]
        [Display(Name = "Registration InsuranceCode")]
        public string RegistrationInsuranceCode { get; set; }

        [StringLength(256)]
        public string ModifiedBy { get; set; }

        public DateTimeOffset? ModifiedOn { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClaimInsurance> ClaimInsurance { get; set; }

        public virtual Insurrance Insurrance { get; set; }
    }
}
