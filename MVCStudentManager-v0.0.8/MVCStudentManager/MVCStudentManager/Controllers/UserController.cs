using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCStudentManager.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace MVCStudentManager.Controllers
{
    public class UserController : Controller
    {
        dbStudentManagerDataContext db = new dbStudentManagerDataContext();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ThongBao()
        {
            return View();
        }

        //Trang đăng nhập cho học sinh
        [HttpGet]
        public ActionResult LoginHS()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginHS(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                HocSinh hs = db.HocSinhs.SingleOrDefault(n => n.IDLogin == tendn && n.Pass == matkhau);
                if (hs != null)
                {
                    //ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoan"] = hs;
                    return RedirectToAction("Index", "HocSinh");
                }
                else
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }

        //Trang đăng nhập cho giáo viên
        [HttpGet]
        public ActionResult LoginGV()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginGV(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                GiaoVien hs = db.GiaoViens.SingleOrDefault(n => n.IDLogin == tendn && n.Pass == matkhau);
                if (hs != null)
                {
                    //ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoan"] = hs;
                    return RedirectToAction("Index", "GiaoVien");
                }
                else
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "User");
        }
    }
}