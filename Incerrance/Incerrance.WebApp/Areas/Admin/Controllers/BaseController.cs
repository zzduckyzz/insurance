using Incerrance.Common;
using Incerrance.Model.DAL;
using System.Linq;
using System.Web.Mvc;

namespace Incerrance.WebApp.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (session == null || session.GroupId != CommonConstants.ADMIN_GROUP && session.GroupId != CommonConstants.MOD_GROUP)
            {
                //filterContext.Result = new RedirectToRouteResult(new
                //    RouteValueDictionary(new { controller = "Login", action = "Login", Area = "Admin" }));
                filterContext.Result = Redirect("/quan-tri/dang-nhap");
            }
            base.OnActionExecuting(filterContext);
        }
        protected void SetAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }
        private IncerranceDbContext db = new IncerranceDbContext();
        protected void CountMessage()
        {
            var feedbacks = db.Feedback.Where(x => x.IsDeleted == false && x.Reply == null);
            TempData["cms"] = feedbacks.Count().ToString();
        }
        protected void CountProduct()
        {
            var products = db.ClaimInsurances.Where(x => x.Status == "Unconfirmed");
            TempData["cpd"] = products.Count().ToString();
        }
        protected void CountOrder()
        {
            var orders = db.Registration_Insurance.Where(x => x.Status == "Unconfimred");
            TempData["ord"] = orders.Count().ToString();
        }
    }
}