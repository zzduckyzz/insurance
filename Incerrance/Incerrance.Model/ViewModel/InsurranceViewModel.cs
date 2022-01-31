using Incerrance.Model.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Incerrance.Model.ViewModel
{
        public class InsurranceViewModel
        {
        public Guid Id { get; set; }
        public Guid? InsurranceCategoryId { get; set; }
        public string InsurranceCode { get; set; }
        public string Name { get; set; }

        [AllowHtml]
        public string Description { get; set; }
        public string MetaTitle { get; set; }
        public string ImagesInsurrance { get; set; }
        public decimal? Price { get; set; }
        public string InsurancePeriod { get; set; }
        public int? Quantity { get; set; }

        public bool IsDeleted { get; set; }

        public DateTimeOffset? CreatedOn { get; set; }

        public string CreatedBy { get; set; }

        public DateTimeOffset? ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }

        /*public virtual InsurranceCategory InsurranceCategory { get; set; }*/
        public virtual ICollection<Registration_Insurance> Registration_Insurance { get; set; }
    }
}
