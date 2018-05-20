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
    public class HocSinhController : Controller
    {
        dbStudentManagerDataContext db = new dbStudentManagerDataContext();
        // GET: HocSinh
        public ActionResult Index()
        {
            return View();
        }

        // Trang lớp
        public ActionResult Class(int? page, string searchString)
        {
            var lop = from e in db.Lops select e;
            Session["Class"] = lop;
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("LoginHS", "User");
            }
            if (Session["Class"] == null)
            {
                return RedirectToAction("Index", "HocSinh");
            }
            if (!String.IsNullOrEmpty(searchString))
            {
                lop = lop.Where(s => s.TenLop.Contains(searchString));
            }
            ViewBag.SeachString = searchString;
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            return View(lop.ToList().OrderBy(n => n.MaLop).ToPagedList(pageNumber, pageSize));
        }
        //Danh sách lớp
        public ActionResult DSLop()
        {
            var hs = from lop in db.Lops select lop;
            return PartialView(hs);
        }
        public ActionResult HocSinhTheoLop(int id)
        {
            var hs = from s in db.HocSinhs where s.MaLop == id select s;
            Session["Student"] = hs;
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("LoginGV", "User");
            }
            if (Session["Student"] == null)
            {
                return RedirectToAction("Index", "GiaoVien");
            }
            return View(hs);
        }

        //Trang thôn tin
        public ActionResult Info()
        {
            return View();
        }

        //Sửa thông tin học sinh
        [HttpGet]
        public ActionResult SuaHS(int id)
        {
            //Lấy ra đối tượng sách cần sửa theo mã
            HocSinh hs = db.HocSinhs.SingleOrDefault(n => n.MaHS == id);
            if (hs == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(hs);
        }
        [HttpPost, ActionName("SuaHS")]
        [ValidateInput(false)]
        public ActionResult SuaHS(HocSinh HS)
        {
            var hs = db.HocSinhs.SingleOrDefault(n => n.MaHS == HS.MaHS);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                hs.HoTen = HS.HoTen;
                hs.NgaySinh = HS.NgaySinh;
                hs.GioiTinh = HS.GioiTinh;
                hs.Email = HS.Email;
                hs.DiaChi = HS.DiaChi;
                hs.Pass = HS.Pass;
                db.SubmitChanges();
            }
            return RedirectToAction("Index");
        }
    }
}