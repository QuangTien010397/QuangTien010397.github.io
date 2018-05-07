using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MVCStudentManager.Models;
using MVCStudentManager.BLL;

namespace MVCStudentManager.Controllers
{
    public class AuthenticationController : Controller
    {
        // GET: Authentication
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DoLogin(UserDetails user)
        {
            if (ModelState.IsValid)
            {
                UserBusinessLayer bal = new UserBusinessLayer();
                //New code start
                UserStatus status = bal.GetUserValidity(user);
                bool IsAdmin = false;
                if (status == UserStatus.AuthenticatedAdmin)
                {
                    IsAdmin = true;
                }
                else if (status == UserStatus.AuthenticatedUser)
                {
                    IsAdmin = false;
                }
                else
                {
                    ModelState.AddModelError("CredentialError", "Invalid Username or password");
                    return View("Login");
                }
                FormsAuthentication.SetAuthCookie(user.UserName, false);
                Session["IsAdmin"] = IsAdmin;
                return RedirectToAction("Index", "Admin");
            }
            else
                return View("Login");
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}