using Incerrance.Common;
using Incerrance.Model.DAL;
using Incerrance.WebApp.Common.NganLuongAPI;
using System;
using System.Configuration;
using System.Data.Entity;
using System.Net;
using System.Web.Mvc;

namespace Incerrance.WebApp.Controllers
{
	public class Registration_InsuranceController : BaseController
	{
		private IncerranceDbContext db = new IncerranceDbContext();
		private string merchantId = ConfigurationManager.AppSettings["MerchantID"];
		private string merchantPassword = ConfigurationManager.AppSettings["MerchantPassword"];
		private string merchantEmail = ConfigurationManager.AppSettings["MerchantEmail"];

		// GET: Registration_Insurance
		public ActionResult Index(Guid Id)
		{
			if (Session[CommonConstants.USER_SESSION] != null)
			{
				if (Id == null)
				{
					return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
				}
				Insurrance insurrance = db.Insurrances.Find(Id);
				if (insurrance == null)
				{
					return HttpNotFound();
				}
				return View(insurrance);
			}
			else
			{
				SetAlert("You need to login to do this", "warning");
				return Redirect("/dang-nhap");
			}
		}

		[HttpPost]
		public ActionResult Payment(Guid InsuranceId, string Address, string Phone, string Email, string LicensePlate, string VehicleRate, string RangeOfVehicle, string CMND, string FullName)
		{
			if (Session[CommonConstants.USER_SESSION] != null)
			{
				var insurrance = db.Insurrances.Find(InsuranceId);
				var session = (UserLogin)Session[CommonConstants.USER_SESSION];
				Registration_Insurance registration_Insurance = new Registration_Insurance();
				registration_Insurance.InsurranceId = InsuranceId;
				registration_Insurance.UserId = session.UserId;
				registration_Insurance.FullName = FullName;
				registration_Insurance.DateOfBirth = null;
				registration_Insurance.Address = Address;
				registration_Insurance.Phone = Phone;
				registration_Insurance.Email = Email;
				registration_Insurance.LicensePlate = LicensePlate;
				registration_Insurance.VehicleRate = Convert.ToInt32(VehicleRate);
				registration_Insurance.RangeOfVehicle = RangeOfVehicle;
				registration_Insurance.RegistrationDate = DateTime.Now;
				registration_Insurance.ExpirationDate = DateTime.Now.AddMonths(Convert.ToInt32(insurrance.TimeInsurrance));
				registration_Insurance.TotalMoney = registration_Insurance.VehicleRate * insurrance.Price;
				registration_Insurance.Status = "unconfimred";
				registration_Insurance.RegistrationInsuranceCode = DateTime.Now.ToString() + CMND + registration_Insurance.TotalMoney.ToString();
				registration_Insurance.CMND = CMND;
				return View(registration_Insurance);
			}
			else
			{
				SetAlert("You need to login to do this", "warning");
				return Redirect("/dang-nhap");
			}
			
		}

		[HttpPost]
		public ActionResult ConfirmRegistrationInsurance(Guid InsuranceId, string Address, string Phone, string Email, string LicensePlate, string VehicleRate, string RangeOfVehicle, string CMND, string FullName, string ExpirationDate, string RegistrationDate, string TotalMoney, string RegistrationInsuranceCode)
		{
			if (Session[CommonConstants.USER_SESSION] != null)
			{
				var session = (UserLogin)Session[CommonConstants.USER_SESSION];
				Registration_Insurance registration_Insurance = new Registration_Insurance();
				registration_Insurance.Id = Guid.NewGuid();
				registration_Insurance.InsurranceId = InsuranceId;
				registration_Insurance.UserId = session.UserId;
				registration_Insurance.FullName = FullName;
				registration_Insurance.DateOfBirth = DateTime.Now;
				registration_Insurance.Address = Address;
				registration_Insurance.Phone = Phone;
				registration_Insurance.Email = Email;
				registration_Insurance.LicensePlate = LicensePlate;
				registration_Insurance.VehicleRate = Convert.ToInt32(VehicleRate);
				registration_Insurance.RangeOfVehicle = RangeOfVehicle;
				registration_Insurance.RegistrationDate = Convert.ToDateTime(RegistrationDate);
				registration_Insurance.ExpirationDate = Convert.ToDateTime(ExpirationDate);
				registration_Insurance.TotalMoney = Convert.ToInt32(TotalMoney);
				registration_Insurance.Status = "unconfimred";
				registration_Insurance.RegistrationInsuranceCode = RegistrationInsuranceCode;
				registration_Insurance.CMND = CMND;
				registration_Insurance.ModifiedBy = session.UserName;
				registration_Insurance.ModifiedOn = DateTime.Now;
				db.Registration_Insurance.Add(registration_Insurance);
				db.SaveChanges();
				string content = System.IO.File.ReadAllText(Server.MapPath("~/Content/Client/neworder.html"));

				content = content.Replace("{{CustomerName}}", registration_Insurance.FullName);
				content = content.Replace("{{Phone}}", registration_Insurance.Phone);
				content = content.Replace("{{Email}}", registration_Insurance.Email);
		
				content = content.Replace("{{Address}}", registration_Insurance.Address);
				content = content.Replace("{{Total}}", registration_Insurance.TotalMoney.ToString());
				var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();
				new MailHelper().SendMail(registration_Insurance.Email, "Application form from insurance provider", content);
				new MailHelper().SendMail(toEmail, "Application form from insurance provider", content);
				SetAlert("You have just made a successful purchase. Our staff will contact you within a few minutes to confirm your order.", "success");
				return Redirect("/Homes/Index");
			}
			else
			{
				SetAlert("You need to login to do this", "warning");
				return Redirect("/dang-nhap");
			}
			
		}

		public ActionResult CancelOrder()
		{
			return View();
		}


		public ActionResult ExtensionOfInsurance(Guid reginsuranceId)
		{
			if (Session[CommonConstants.USER_SESSION] != null)
			{
				if (reginsuranceId == null)
				{
					return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
				}
				Registration_Insurance registration_Insurance = db.Registration_Insurance.Find(reginsuranceId);
				if (registration_Insurance == null)
				{
					return HttpNotFound();
				}
				return View(registration_Insurance);
			}
			else
			{
				SetAlert("You need to login to do this", "warning");
				return Redirect("/dang-nhap");
			}

		}

		[HttpPost]
		public ActionResult PaymentExtensionOfInsurance(Guid RegistrationInsuranceId, string paymentMethod, string bankcode)
		{
			Registration_Insurance registration_Insurance = db.Registration_Insurance.Find(RegistrationInsuranceId);
			registration_Insurance.ExpirationDate = DateTime.Now.AddMonths(Convert.ToInt32(registration_Insurance.Insurrance.TimeInsurrance));
			registration_Insurance.Status = "Paid online";

			var currentLink = ConfigurationManager.AppSettings["CurrentLink"];
			RequestInfo info = new RequestInfo();
			info.Merchant_id = merchantId;
			info.Merchant_password = merchantPassword;
			info.Receiver_email = merchantEmail;

			info.cur_code = "vnd";
			info.bank_code = bankcode;

			info.Order_code = registration_Insurance.Id.ToString();
			info.Total_amount = registration_Insurance.TotalMoney.ToString();
			info.fee_shipping = "0";
			info.Discount_amount = "0";
			info.order_description = "Extension Of Insurance";
			info.return_url = currentLink + "xac-nhan-don-hang";
			info.cancel_url = currentLink + "huy-don-hang";

			info.Buyer_fullname = registration_Insurance.FullName;
			info.Buyer_email = registration_Insurance.Email;
			info.Buyer_mobile = registration_Insurance.Phone;

			APICheckoutV3 objNLChecout = new APICheckoutV3();

			ResponseInfo result = objNLChecout.GetUrlCheckout(info, paymentMethod);

			string content = System.IO.File.ReadAllText(Server.MapPath("~/Content/Client/neworder.html"));

			content = content.Replace("{{CustomerName}}", registration_Insurance.FullName);
			content = content.Replace("{{Phone}}", registration_Insurance.Phone);
			content = content.Replace("{{Email}}", registration_Insurance.Email);
			content = content.Replace("{{Address}}", registration_Insurance.Address);
			content = content.Replace("{{Total}}", registration_Insurance.TotalMoney.ToString());
			var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();

			new MailHelper().SendMail(registration_Insurance.Email, "Application form from insurance provider", content);
			new MailHelper().SendMail(toEmail, "Application form from insurance provider", content);
			//Check thanh toán online
			if (result.Error_code == "00")
			{
				registration_Insurance.TotalMoney = registration_Insurance.TotalMoney + Convert.ToInt32(registration_Insurance.Insurrance.Price);
				db.Entry(registration_Insurance).State = EntityState.Modified;
				db.SaveChanges();
				SetAlert("Payment success", "success");
				return Redirect(result.Checkout_url);
			}
			else
			{
				SetAlert("Error!", result.Description);
				return Redirect("/");
			}
		}

	}
}
