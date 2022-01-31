using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Incerrance.Common;
using Incerrance.Model.DAL;

namespace Incerrance.WebApp.Areas.Admin.Controllers
{
    public class Registration_InsuranceController : BaseController
    {
        private IncerranceDbContext db = new IncerranceDbContext();

        // GET: Admin/Registration_Insurance
        public ActionResult Index()
        {
            var registration_Insurance = db.Registration_Insurance.Include(r => r.Insurrance);
            return View(registration_Insurance.OrderByDescending(x=>x.RegistrationDate).ToList());
        }

        // GET: Admin/Registration_Insurance/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registration_Insurance registration_Insurance = db.Registration_Insurance.Find(id);
            if (registration_Insurance == null)
            {
                return HttpNotFound();
            }
            return View(registration_Insurance);
        }

        // GET: Admin/Registration_Insurance/Create
        public ActionResult Create()
        {
            ViewBag.InsurranceId = new SelectList(db.Insurrances, "Id", "InsurranceCode");
            return View();
        }

        // POST: Admin/Registration_Insurance/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,InsurranceId,UserId,FullName,DateOfBirth,Address,Phone,Email,LicensePlate,VehicleRate,RangeOfVehicle,RegistrationDate,ExpirationDate,TotalMoney,CMND,Status,RegistrationInsuranceCode,ModifiedBy,ModifiedOn")] Registration_Insurance registration_Insurance)
        {
            if (ModelState.IsValid)
            {
                registration_Insurance.Id = Guid.NewGuid();
                db.Registration_Insurance.Add(registration_Insurance);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.InsurranceId = new SelectList(db.Insurrances, "Id", "InsurranceCode", registration_Insurance.InsurranceId);
            return View(registration_Insurance);
        }

        // GET: Admin/Registration_Insurance/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registration_Insurance registration_Insurance = db.Registration_Insurance.Find(id);
            if (registration_Insurance == null)
            {
                return HttpNotFound();
            }
            ViewBag.InsurranceId = new SelectList(db.Insurrances, "Id", "InsurranceCode", registration_Insurance.InsurranceId);
            return View(registration_Insurance);
        }

        // POST: Admin/Registration_Insurance/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,InsurranceId,UserId,FullName,DateOfBirth,Address,Phone,Email,LicensePlate,VehicleRate,RangeOfVehicle,RegistrationDate,ExpirationDate,TotalMoney,CMND,Status,RegistrationInsuranceCode,ModifiedBy,ModifiedOn")] Registration_Insurance registration_Insurance)
        {
            if (ModelState.IsValid)
            {
                db.Entry(registration_Insurance).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Update successful", "success");
				if (registration_Insurance.Status == "Confirmed")
				{
                    string content = System.IO.File.ReadAllText(Server.MapPath("~/Content/Client/neworder1.html"));
                    content = content.Replace("{{CustomerName}}", registration_Insurance.FullName);
                    content = content.Replace("{{Email}}", registration_Insurance.Email);
                    content = content.Replace("{{Total}}", registration_Insurance.TotalMoney.ToString());
                    var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();
                    new MailHelper().SendMail(registration_Insurance.Email, "Application form from insurance provider", content);
                    new MailHelper().SendMail(toEmail, "Application form from insurance provider", content);
                }
                return RedirectToAction("Index");
            }
            ViewBag.InsurranceId = new SelectList(db.Insurrances, "Id", "InsurranceCode", registration_Insurance.InsurranceId);
            return View(registration_Insurance);
        }

        // GET: Admin/Registration_Insurance/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registration_Insurance registration_Insurance = db.Registration_Insurance.Find(id);
            if (registration_Insurance == null)
            {
                return HttpNotFound();
            }
            return View(registration_Insurance);
        }

        // POST: Admin/Registration_Insurance/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Registration_Insurance registration_Insurance = db.Registration_Insurance.Find(id);
            db.Registration_Insurance.Remove(registration_Insurance);
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
