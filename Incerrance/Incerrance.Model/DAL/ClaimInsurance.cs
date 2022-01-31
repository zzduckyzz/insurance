namespace Incerrance.Model.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ClaimInsurance")]
    public partial class ClaimInsurance
    {
        public Guid Id { get; set; }

        [Display(Name = "Registration Insurance")]
        [Required(ErrorMessage = "You have not entered a Registration Insurance")]
        public Guid? Registration_InsuranceId { get; set; }

        [Display(Name = "User")]
        [Required(ErrorMessage = "You have not entered a User")]
        public Guid? UserId { get; set; }

        public string Reply { get; set; }

        [StringLength(256)]
        [Display(Name = "Place Of Accident")]
        [Required(ErrorMessage = "You have not entered a Place Of Accident")]
        public string PlaceOfAccident { get; set; }

        [Display(Name = "Date Of Accident")]
        [Required(ErrorMessage = "You have not entered a Date Of Accident")]
        public DateTime? DateOfAccident { get; set; }

        [Display(Name = "Policy End Date")]
        public DateTime? PolicyEndDate { get; set; }

        [Display(Name = "Insured Amount")]
        public int? InsuredAmount { get; set; }

        [Required(ErrorMessage = "You have not entered a Insured Description")]
        public string Description { get; set; }

        [StringLength(255)]
        public string Status { get; set; }

        [StringLength(256)]
        public string ModifiedBy { get; set; }

        public DateTimeOffset? CreatedOn { get; set; }

        [StringLength(256)]
        public string CreatedBy { get; set; }

        public DateTimeOffset? ModifiedOn { get; set; }

        public virtual Registration_Insurance Registration_Insurance { get; set; }
    }
}
