using Incerrance.Model.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Incerrance.WebApp.Controllers
{
    public class AboutController : Controller
    {
        private IncerranceDbContext db = new IncerranceDbContext();
        // GET: About
        public ActionResult Index()
        {
            return View(db.About.Where(x => x.IsDeleted == false).ToList());
        }
    }
}