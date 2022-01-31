using Incerrance.Model.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Incerrance.WebApp.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        private IncerranceDbContext db = new IncerranceDbContext();
        // GET: Admin/Home
        public ActionResult Index()
        {
            CountMessage();
            CountOrder();
            CountProduct();
            ViewBag.CountUserGroup = db.UserGroup.Count();
            ViewBag.CountUser = db.User.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountRole = db.Role.Count();
            ViewBag.CountCredential = db.Credentials.Count();
            ViewBag.CountInsurrance = db.Insurrances.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountVehicle = db.Vehicle.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountVehicleType = db.VehicleType.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountNews = db.News.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountNewsCategory = db.NewsCategory.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountAbout = db.About.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountMenu = db.Menu.Where(x => x.IsDeleted == false && x.ParentId == null).Count();
            ViewBag.CountSlide = db.Slide.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountContact = db.Contact.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountFooter = db.Footer.Where(x => x.IsDeleted == false).Count();
            ViewBag.CountOrder = db.Registration_Insurance.Count();
            
            return View();
        }
    }
}