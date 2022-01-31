using Incerrance.Model.DAL;
using Incerrance.Model.Dao;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Incerrance.WebApp.Controllers
{
    public class InsurranceController : Controller
    {
        private IncerranceDbContext db = new IncerranceDbContext();

        public ActionResult LoadNormalInsurrance1()
        {
            List<Insurrance> list = new List<Insurrance>();
            list = db.Insurrances.Where(x => x.IsDeleted == false).OrderByDescending(x => x.CreatedOn).Take(4).ToList();
            ViewBag.Count = list.Count();
            return PartialView(list);
        }
        public ActionResult LoadNormalInsurranceCategory()
        {
            List<Insurrance> list = new List<Insurrance>();
            list = db.Insurrances.Where(x => x.IsDeleted == false).OrderByDescending(x => x.CreatedOn).Take(20).ToList();
            ViewBag.Count = list.Count();
            return PartialView(list);
        }

        public ActionResult Details(Guid id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Insurrance insurrance = db.Insurrances.Find(id);
            if (insurrance == null)
            {
                return HttpNotFound();
            }
            return View(insurrance);
        }

        public ActionResult LoadLastedInsurrance(Guid? id)
        {
            Insurrance insurrance = db.Insurrances.Find(id);
            List<Insurrance> list = new List<Insurrance>();
            list = db.Insurrances.Where(x => x.IsDeleted == false  && x.Id != insurrance.Id).OrderByDescending(x => x.CreatedOn).Take(2).ToList();
            ViewBag.Count = list.Count();
            return PartialView(list);
        }

        public ActionResult LoadCategory()
        {
            List<VehicleType> insurranceCategory = new List<VehicleType>();
            insurranceCategory = db.VehicleType.Where(x => x.IsDeleted == false).ToList();
            var insurrance = db.Insurrances.Where(x => x.IsDeleted == false).ToList();
            ViewBag.Count = insurranceCategory.Count();
            ViewBag.CountAllInsurrance = insurrance.Count();
            return PartialView(insurranceCategory);
        }

        public ActionResult LoadAllInsurrance(int? page)
		{
            List<Insurrance> list = new List<Insurrance>();
            list = db.Insurrances.Where(x => x.IsDeleted == false).OrderByDescending(x => x.CreatedOn).ToList();
            ViewBag.Count = list.Count();
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return View(list.ToPagedList(pageNumber, pageSize));
        }

        //Load product from price
        public ActionResult CategoryDetail(/*InsurranceCategory insurranceCategory*/)
        {
            //List<Insurrance> list = new List<Insurrance>();
            //list = db.Insurrances.Where(x => x.IsDeleted == false && x.VehicleId == insurranceCategory.Id).ToList();
            //ViewBag.Count = list.Count();
            return View();
        }

        //Search auto complete
        public JsonResult ListName(string q)
        {
            var data = new InsurranceDao().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Search(string keyword)
        {
            var model = new InsurranceDao().Search(keyword);
            ViewBag.Keyword = keyword;
            ViewBag.Count = model.Count();
            return View(model);
        }
    }
}