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
    public class VehicleTypesController : BaseController
    {
        private IncerranceDbContext db = new IncerranceDbContext();

        // GET: Admin/VehicleTypes
        public ActionResult Index()
        {
            return View(db.VehicleType.Where(X => X.IsDeleted == false).OrderByDescending(x => x.CreatedOn).ToList());
        }

        // GET: Admin/VehicleTypes/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VehicleType vehicleType = db.VehicleType.Find(id);
            if (vehicleType == null)
            {
                return HttpNotFound();
            }
            return View(vehicleType);
        }

        // GET: Admin/VehicleTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/VehicleTypes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,MetaTitle,Description,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,IsDeleted")] VehicleType vehicleType)
        {
            if (ModelState.IsValid)
            {
                AuditTable.InsertAuditFields(vehicleType);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                vehicleType.CreatedBy = session.UserName;
                vehicleType.Id = Guid.NewGuid();
                db.VehicleType.Add(vehicleType);
                db.SaveChanges();
                SetAlert("Thêm mới thành công", "success");
                return RedirectToAction("Index");
            }

            return View(vehicleType);
        }

        // GET: Admin/VehicleTypes/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VehicleType vehicleType = db.VehicleType.Find(id);
            if (vehicleType == null)
            {
                return HttpNotFound();
            }
            return View(vehicleType);
        }

        // POST: Admin/VehicleTypes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,MetaTitle,Description,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,IsDeleted")] VehicleType vehicleType)
        {
            if (ModelState.IsValid)
            {
                AuditTable.UpdateAuditFields(vehicleType);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                vehicleType.ModifiedBy = session.UserName;
                db.Entry(vehicleType).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Cập nhật thành công", "success");
                return RedirectToAction("Index");
            }
            return View(vehicleType);
        }

        // GET: Admin/VehicleTypes/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VehicleType vehicleType = db.VehicleType.Find(id);
            if (vehicleType == null)
            {
                return HttpNotFound();
            }
            return View(vehicleType);
        }

        // POST: Admin/VehicleTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            VehicleType vehicleType = db.VehicleType.Find(id);
            vehicleType.IsDeleted = true;
            db.SaveChanges();
            SetAlert("Xóa thành công", "success");
            return Redirect("/Admin/VehicleTypes");
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
