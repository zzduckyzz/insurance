using Incerrance.Common;
using Incerrance.Model.DAL;
using Incerrance.Model.Dao;
using Incerrance.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Incerrance.WebApp.Controllers
{
    public class HomesController : BaseController
    {
        private IncerranceDbContext db = new IncerranceDbContext();
        private const string CartSession = "CartSession";

        // GET: Homes
        public ActionResult Index()
        {
            var result = db.Vehicle.Where(x=> x.IsDeleted == false).OrderBy(x=>x.CreatedOn);
            return View(result);
        }
        // Footer
       // [ChildActionOnly]
        public ActionResult Footer()
        {
            var result = db.Footer.SingleOrDefault(x => x.IsDeleted == false);
            return PartialView(result);
        }
        //Main menu
       // [ChildActionOnly]
        public ActionResult MainMenu()
        {
            List<Menu> dsmenu = new List<Menu>();
            dsmenu = db.Menu.Where(x => x.ParentId == null && x.IsDeleted == false).OrderBy(x => x.DisplayOrder).ToList();
            return PartialView(dsmenu);
        }
       // [ChildActionOnly]
        public ActionResult SubMenu(int ParentId)
        {
            List<Menu> lst = new List<Menu>();
            lst = db.Menu.Where(x => x.ParentId == ParentId && x.IsDeleted == false).OrderBy(x => x.DisplayOrder).ToList();
            ViewBag.Count = lst.Count();
            return PartialView(lst);
        }
        //Slide
        //[ChildActionOnly]
        public PartialViewResult Slide()
        {
            List<Slide> getSlide = new List<Slide>();
            getSlide = db.Slide.Where(x => x.IsDeleted == false).ToList();
            ViewBag.Count = getSlide.Count();
            return PartialView(getSlide);
        }
        public PartialViewResult LeftMenu()
        {
            List<VehicleType> getVehicleType = new List<VehicleType>();
            getVehicleType = db.VehicleType.Where(x => x.IsDeleted == false).ToList();
            return PartialView(getVehicleType);
        }
        public PartialViewResult RightMenu()
        {
            List<VehicleType> getVehicleType = new List<VehicleType>();
            getVehicleType = db.VehicleType.Where(x => x.IsDeleted == false).ToList();
            return PartialView(getVehicleType);
        }
        //Footer -- Contact
        //Detail Vehicle
        public ActionResult DetailVehicle(Guid Id)
        {
            var result = db.Insurrances.Where(x=>x.VehicleId == Id && x.IsDeleted == false).ToList();
            return View(result);
        }
        public ActionResult DetailIncerranceVehicle(Guid Id)
        {
            var result = db.Insurrances.FirstOrDefault(x=>x.Id == Id && x.IsDeleted == false);
            ViewBag.RelatedInsurrances = db.Insurrances.Where(x => x.VehicleId == Id).ToList();
            return View(result);
        }
        public ActionResult DetailVehicleType(Guid Id)
        {
            var result = db.Vehicle.Where(x => x.VehicleTypeId == Id && x.IsDeleted == false).ToList();
            return View(result);
        }
        public ActionResult DetailIncerranceVeicle(Guid Id)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            var result = db.Registration_Insurance.FirstOrDefault(x => x.Id == Id && x.UserId == session.UserId);
            return View(result);
        }
        public ActionResult Contact()
        {
            List<Contact> list = new List<Contact>();
            list = db.Contact.Where(x => x.IsDeleted == false).ToList();
            ViewBag.Count = list.Count();
            return PartialView(list);
        }
        //Payment history
        public ActionResult HistoryPayment()
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (session != null)
            {
                return View(db.Registration_Insurance.Where(x => x.UserId == session.UserId).ToList());
            }
            else
            {
                SetAlert("You need to login to do this", "warning");
                return Redirect("/dang-nhap");
            }
        }
    }
}