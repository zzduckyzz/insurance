using Incerrance.Common;
using Incerrance.Model.DAL;
using Incerrance.WebApp.Common;
using System;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace Incerrance.WebApp.Areas.Admin.Controllers
{
	public class ClaimInsurancesController : BaseController
	{
		private IncerranceDbContext db = new IncerranceDbContext();

		// GET: Admin/ClaimInsurances
		public ActionResult Index()
		{
			var claimInsurances = db.ClaimInsurances.Include(c => c.Registration_Insurance);
			return View(claimInsurances.ToList());
		}

		// GET: Admin/ClaimInsurances/Details/5
		public ActionResult Details(Guid? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			ClaimInsurance claimInsurance = db.ClaimInsurances.Find(id);
			if (claimInsurance == null)
			{
				return HttpNotFound();
			}
			return View(claimInsurance);
		}

		// GET: Admin/ClaimInsurances/Create
		public ActionResult Create()
		{
			ViewBag.Registration_InsuranceId = new SelectList(db.Registration_Insurance, "Id", "FullName");
			return View();
		}

		// POST: Admin/ClaimInsurances/Create
		// To protect from overposting attacks, enable the specific properties you want to bind to, for 
		// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create([Bind(Include = "Id,Registration_InsuranceId,UserId,Reply,PlaceOfAccident,DateOfAccident,PolicyEndDate,InsuredAmount,Description,Status,ModifiedBy,CreatedOn,CreatedBy,ModifiedOn")] ClaimInsurance claimInsurance)
		{
			if (ModelState.IsValid)
			{
				claimInsurance.Id = Guid.NewGuid();
				db.ClaimInsurances.Add(claimInsurance);
				db.SaveChanges();
				return RedirectToAction("Index");
			}

			ViewBag.Registration_InsuranceId = new SelectList(db.Registration_Insurance, "Id", "FullName", claimInsurance.Registration_InsuranceId);
			return View(claimInsurance);
		}

		// GET: Admin/ClaimInsurances/Edit/5
		public ActionResult Edit(Guid? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			ClaimInsurance claimInsurance = db.ClaimInsurances.Find(id);
			if (claimInsurance == null)
			{
				return HttpNotFound();
			}
			ViewBag.Registration_InsuranceId = new SelectList(db.Registration_Insurance, "Id", "FullName", claimInsurance.Registration_InsuranceId);
			return View(claimInsurance);
		}

		// POST: Admin/ClaimInsurances/Edit/5
		// To protect from overposting attacks, enable the specific properties you want to bind to, for 
		// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit([Bind(Include = "Id,Registration_InsuranceId,UserId,Reply,PlaceOfAccident,DateOfAccident,PolicyEndDate,InsuredAmount,Description,Status,ModifiedBy,CreatedOn,CreatedBy,ModifiedOn")] ClaimInsurance claimInsurance)
		{
			if (ModelState.IsValid)
			{
				claimInsurance.Status = "Responded";
				AuditTable.UpdateAuditFields(claimInsurance);
				var session = (UserLogin)Session[CommonConstants.USER_SESSION];
				claimInsurance.ModifiedBy = session.UserName;
				db.Entry(claimInsurance).State = EntityState.Modified;
				db.SaveChanges();
				var user = db.User.FirstOrDefault(x=>x.Id == claimInsurance.UserId);
				string content = System.IO.File.ReadAllText(Server.MapPath("~/Content/Client/neworder2.html"));
				content = content.Replace("{{CustomerName}}", user.FullName);
				content = content.Replace("{{Email}}", user.Email);
				content = content.Replace("{{Total}}", claimInsurance.InsuredAmount.ToString());
				var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();
				new MailHelper().SendMail(user.Email, "Application form from insurance provider", content);
				new MailHelper().SendMail(toEmail, "Application form from insurance provider", content);
				SetAlert("Responded successful", "success");
				return RedirectToAction("Index");
			}
			ViewBag.Registration_InsuranceId = new SelectList(db.Registration_Insurance, "Id", "FullName", claimInsurance.Registration_InsuranceId);
			return View(claimInsurance);
		}

		// GET: Admin/ClaimInsurances/Delete/5
		public ActionResult Delete(Guid? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			ClaimInsurance claimInsurance = db.ClaimInsurances.Find(id);
			if (claimInsurance == null)
			{
				return HttpNotFound();
			}
			return View(claimInsurance);
		}

		// POST: Admin/ClaimInsurances/Delete/5
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteConfirmed(Guid id)
		{
			ClaimInsurance claimInsurance = db.ClaimInsurances.Find(id);
			db.ClaimInsurances.Remove(claimInsurance);
			db.SaveChanges();
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing)
			{
				db.Dispose();
			}
			base.Dispose(disposing);
		}
	}
}
