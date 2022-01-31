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

namespace Incerrance.WebApp.Areas.Admin.Controllers
{
    public class VehiclesController : BaseController
    {
        private IncerranceDbContext db = new IncerranceDbContext();

        // GET: Admin/Vehicles
        public ActionResult Index()
        {
            var vehicle = db.Vehicle.Include(v => v.VehicleType).Where(X => X.IsDeleted == false).OrderByDescending(x => x.CreatedOn);
            return View(vehicle.ToList());
        }

        // GET: Admin/Vehicles/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vehicle vehicle = db.Vehicle.Find(id);
            if (vehicle == null)
            {
                return HttpNotFound();
            }
            return View(vehicle);
        }

        // GET: Admin/Vehicles/Create
        public ActionResult Create()
        {
            ViewBag.VehicleTypeId = new SelectList(db.VehicleType.Where(x => x.IsDeleted == false), "Id", "Name");
            return View();
        }

        // POST: Admin/Vehicles/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Vehicle vehicle)
        {
            if (ModelState.IsValid)
            {
                vehicle.Id = Guid.NewGuid();
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                AuditTable.InsertAuditFields(vehicle);
                vehicle.CreatedBy = session.UserName;
                db.Vehicle.Add(vehicle);
                SetAlert("New successfully added", "success");
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.VehicleTypeId = new SelectList(db.VehicleType.Where(x => x.IsDeleted == false), "Id", "Name", vehicle.VehicleTypeId);
            return View(vehicle);
        }

        // GET: Admin/Vehicles/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vehicle vehicle = db.Vehicle.Find(id);
            if (vehicle == null)
            {
                return HttpNotFound();
            }
            ViewBag.VehicleTypeId = new SelectList(db.VehicleType.Where(x=>x.IsDeleted == false), "Id", "Name", vehicle.VehicleTypeId);
            return View(vehicle);
        }

        // POST: Admin/Vehicles/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Vehicle vehicle)
        {
            if (ModelState.IsValid)
            {
                AuditTable.UpdateAuditFields(vehicle);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                vehicle.ModifiedBy = session.UserName;
                db.Entry(vehicle).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Update successful", "success");
                return RedirectToAction("Index");
            }
            ViewBag.VehicleTypeId = new SelectList(db.VehicleType.Where(x => x.IsDeleted == false), "Id", "Name", vehicle.VehicleTypeId);
            return View(vehicle);
        }

        // GET: Admin/Vehicles/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vehicle vehicle = db.Vehicle.Find(id);
            if (vehicle == null)
            {
                return HttpNotFound();
            }
            return View(vehicle);
        }

        // POST: Admin/Vehicles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Vehicle vehicle = db.Vehicle.Find(id);
            vehicle.IsDeleted = true;
            db.SaveChanges();
            SetAlert("Xóa thành công", "success");
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
