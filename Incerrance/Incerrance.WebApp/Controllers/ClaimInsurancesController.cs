using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Incerrance.Common;
using Incerrance.Model.DAL;
using Incerrance.WebApp.Common;

namespace Incerrance.WebApp.Controllers
{
    public class ClaimInsurancesController : BaseController
	{
        private IncerranceDbContext db = new IncerranceDbContext();

        // GET: ClaimInsurances
        public ActionResult Index(Guid registrationInsuranceId)
        {
			if (Session[CommonConstants.USER_SESSION] != null)
			{
				if (registrationInsuranceId == null)
				{
					return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
				}
				Registration_Insurance registrationinsurance = db.Registration_Insurance.Find(registrationInsuranceId);
				if (registrationinsurance == null)
				{
					return HttpNotFound();
				}
				return View(registrationinsurance);
			}
			else
			{
				SetAlert("You need to login to do this", "warning");
				return Redirect("/dang-nhap");
			}
		}

		[HttpPost]
		public ActionResult PostClaimInsurances(Guid RegistrationInsuranceId, string PlaceOfAccident, DateTime DateOfAccident, string Description)
		{
				var session = (UserLogin)Session[CommonConstants.USER_SESSION];
				ClaimInsurance claimInsurance = new ClaimInsurance();
				claimInsurance.Id = Guid.NewGuid();
				claimInsurance.Registration_InsuranceId = RegistrationInsuranceId;
				claimInsurance.UserId = session.UserId;
				claimInsurance.Description = Description;
				claimInsurance.PlaceOfAccident = PlaceOfAccident;
				claimInsurance.DateOfAccident = DateOfAccident;
				claimInsurance.Status = "Unconfimred";
				claimInsurance.CreatedOn = DateTime.Now;
				claimInsurance.CreatedBy = session.UserName;
				db.ClaimInsurances.Add(claimInsurance);
				db.SaveChanges();
			SetAlert("Submit request successfully", "success");
			return Redirect("/");
		}


	}
}
