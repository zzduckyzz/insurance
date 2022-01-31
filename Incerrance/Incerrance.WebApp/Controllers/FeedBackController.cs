using Incerrance.Common;
using Incerrance.Model.DAL;
using Incerrance.WebApp.Common;
using System;
using System.Linq;
using System.Web.Mvc;

namespace Incerrance.WebApp.Controllers
{
    public class FeedBackController : BaseController
    {
        private IncerranceDbContext db = new IncerranceDbContext();
        // GET: Contact
        [HttpGet]
        public ActionResult ContactFromCustomer()
        {
            if (Session[CommonConstants.USER_SESSION] != null)
            {
                return View();
            }
            else
            {
                SetAlert("You need to login to do this", "warning");
                return Redirect("/dang-nhap");
            }
        }
        [HttpPost]
        public ActionResult ContactFromCustomer(Feedback model)
        {
            if (ModelState.IsValid)
            {
                model.Id = Guid.NewGuid();
                AuditTable.InsertAuditFields(model);
                db.Feedback.Add(model);
                db.SaveChanges();
                SetAlert("Thank you for comment", "success");
                return Redirect("/phan-hoi-y-kien-khach-hang");
            }
            return View(model);
        }
        // Phan hoi y kien khach hang
        public ActionResult ReplyFeedBack()
        {
            var result = db.Feedback.Where(x => x.IsDeleted == false).OrderByDescending(x => x.CreatedOn).ToList();
            return View(result);
        }
    }
}