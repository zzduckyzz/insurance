using BotDetect.Web.Mvc;
using Facebook;
using Incerrance.Common;
using Incerrance.Model.DAL;
using Incerrance.Model.Dao;
using Incerrance.WebApp.Common;
using Incerrance.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace Incerrance.WebApp.Controllers
{
    public class UserController : BaseController
    {
        private IncerranceDbContext db = new IncerranceDbContext();
        // GET: Users
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.UserName, Encryptor.MD5Hash(model.Password), false);
                if (result == 1)
                {
                    var user = dao.GetById(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserId = user.Id;
                    userSession.Email = user.Email;
                    userSession.Address = user.Address;
                    userSession.FirstName = user.FirstName;
                    userSession.LastName = user.LastName;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return Redirect("/");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Account does not exist.");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "The account is locked.");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Incorrect password.");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "The account is incorrect.");
                }
                else
                {
                    ModelState.AddModelError("", "Login incorrect.");
                }
            }
            return View(model);
        }

        // Register New Account
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [CaptchaValidation("CaptchaCode", "ExampleCaptcha", "Mã CAPTCHA không đúng!")]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (dao.CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Username already exists in the system");
                }
                else if (dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email already exists in the system");
                }
                else
                {
                    var user = new User();
                    user.Id = Guid.NewGuid();
                    user.UserName = model.UserName;
                    user.Password = Encryptor.MD5Hash(model.Password);
                    user.ConfirmPassword = Encryptor.MD5Hash(model.ConfirmPassword);
                    user.FirstName = model.FirstName;
                    user.LastName = model.LastName;
                    user.Email = model.Email;
                    user.GroupId = "MEMBER";
                    user.Address = model.Address;
                    user.IsDeleted = false;
                    user.CreatedOn = DateTime.Now;
                    //Save
                    db.User.Add(user);
                    db.SaveChanges();
                    SetAlert("Sign Up Success", "success");

                    //Login
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserId = user.Id;
                    userSession.Email = user.Email;
                    userSession.Address = user.Address;
                    userSession.FirstName = user.FirstName;
                    userSession.LastName = user.LastName;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return Redirect("/");
                }
            }
            else
            {
                SetAlert("Registration failed", "warning");
                MvcCaptcha.ResetCaptcha("ExampleCaptcha");
            }
            return View(model);
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return RedirectToAction("Index", "Homes");
        }

        //Reset password function
        [NonAction]
        public void SendVerificationLinkEmail(string emailID, string activationCode, string emailFor = "VerifyAccount")
        {
            var verifyUrl = "/User/" + emailFor + "/" + activationCode;
            var link = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, verifyUrl);

            var fromEmail = new MailAddress("elahoteldanangk16@gmail.com", "Security");
            var toEmail = new MailAddress(emailID);
            var fromEmailPassword = "Vinh123456"; // Replace with actual password

            string subject = "";
            string body = "";
            if (emailFor == "VerifyAccount")
            {
                subject = "Your account is successfully created!";
                body = "<br/><br/>We are excited to tell you that your Dotnet Awesome account is" +
                    " successfully created. Please click on the below link to verify your account" +
                    " <br/><br/><a href='" + link + "'>" + link + "</a> ";
            }
            else if (emailFor == "ResetPassword")
            {
                subject = "Reset Password";
                body = "Hello, We have received a request to reset your account password. Please click on the link below to reset your password" +
                    "<br/><br/><a href=" + link + ">Click here to reset your password</a>";
            }


            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromEmail.Address, fromEmailPassword)
            };

            using (var message = new MailMessage(fromEmail, toEmail)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
                smtp.Send(message);
        }
        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ForgotPassword(string EmailID)
        {
            //Verify Email ID
            //Generate Reset password link 
            //Send Email 
            string message = "";
            //bool status = false;

            var account = db.User.Where(a => a.Email == EmailID).FirstOrDefault();
            if (account != null)
            {
                //Send email for reset password
                string resetCode = Guid.NewGuid().ToString();
                SendVerificationLinkEmail(account.Email, resetCode, "ResetPassword");
                account.ResetPasswordCode = resetCode;
                //This line I have added here to avoid confirm password not match issue , as we had added a confirm password property 
                //in our model class in part 1
                db.Configuration.ValidateOnSaveEnabled = false;
                db.SaveChanges();
                message = "A link has been sent to your Email. Please check Email to perform password reset";
            }
            else
            {
                message = "Email does not exist in the system. Please contact the operator 1900.89.89.89 for more details.";
            }
            ViewBag.Message = message;
            return View();
        }

        public ActionResult ResetPassword(string id)
        {
            //Verify the reset password link
            //Find account associated with this link
            //redirect to reset password page
            if (string.IsNullOrWhiteSpace(id))
            {
                return HttpNotFound();
            }

            var user = db.User.Where(a => a.ResetPasswordCode == id).FirstOrDefault();
            if (user != null)
            {
                ResetPasswordModel model = new ResetPasswordModel();
                model.ResetCode = id;
                return View(model);
            }
            else
            {
                return HttpNotFound();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassword(ResetPasswordModel model)
        {
            var message = "";
            if (ModelState.IsValid)
            {
                var user = db.User.Where(a => a.ResetPasswordCode == model.ResetCode).FirstOrDefault();
                if (user != null)
                {
                    user.Password = Encryptor.MD5Hash(model.NewPassword);
                    user.ConfirmPassword = Encryptor.MD5Hash(model.ConfirmPassword);
                    user.ResetPasswordCode = null;
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.SaveChanges();
                    SetAlert("The new password has been successfully set", "success");
                    return Redirect("/dang-nhap");
                }
            }
            else
            {
                message = "Unsuccessful. Please check again";
            }
            ViewBag.Message = message;
            return View(model);
        }

        //Ho so nguoi dung
        public ActionResult EditProfile(Guid? id)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (session == null)
            {
                return Redirect("/trang-chu");
            }
            else
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                User user = db.User.Find(id);
                if (user == null)
                {
                    return HttpNotFound();
                }
                return View(user);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditProfile(User user)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (ModelState.IsValid)
            {
                AuditTable.UpdateAuditFields(user);
                user.ModifiedBy = session.UserName;
                user.Password = Encryptor.MD5Hash(user.Password);
                user.ConfirmPassword = Encryptor.MD5Hash(user.ConfirmPassword);
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Update successful", "success");
                return Redirect("/trang-chu");
            }
            return View(user);
        }
    }
}