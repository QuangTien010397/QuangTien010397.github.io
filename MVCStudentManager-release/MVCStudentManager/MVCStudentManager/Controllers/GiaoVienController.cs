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
    public class GiaoVienController : Controller
    {
        dbStudentManagerDataContext db = new dbStudentManagerDataContext();      
        // GET: GiaoVien
        public ActionResult Index()
        {       
            return View();
        }

        //Trang lớp
        public ActionResult Class(int? page, string searchString)
        {
            var lop = from e in db.Lops select e;
            Session["Class"] = lop;
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("LoginGV", "User");
            }
            if (Session["Class"] == null)
            {
                return RedirectToAction("Index", "GiaoVien");
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
        //Trang giáo viên
        public ActionResult Teacher(int? page, string searchString)
        {
            var giaovien = from e in db.GiaoViens select e;
            Session["Teacher"] = giaovien;
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("LoginGV", "User");
            }
            if (Session["Teacher"] == null)
            {
                return RedirectToAction("Index", "GiaoVien");
            }
            if (!String.IsNullOrEmpty(searchString))
            {
                giaovien = giaovien.Where(s => s.TenGiaoVien.Contains(searchString));
            }
            ViewBag.SeachString = searchString;
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            return View(giaovien.ToList().OrderBy(n => n.MaGiaoVien).ToPagedList(pageNumber, pageSize));
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

        //Điểm của học sinh
        public ActionResult DiemTheoHS(int id)
        {
            var diem = from d in db.DiemMons where d.MaHS == id select d;
            Session["Mark"] = diem;
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("LoginGV", "User");
            }
            if (Session["Mark"] == null)
            {
                return RedirectToAction("Index", "GiaoVien");
            }
            return View(diem);
        }

        //Trang thông tin giáo viên
        public ActionResult Info()
        {
            return View();
        }

        // Sửa 
        [HttpGet]
        public ActionResult SuaGV(int id)
        {
            //Lấy ra đối tượng sách cần sửa theo mã
            GiaoVien gv = db.GiaoViens.SingleOrDefault(n => n.MaGiaoVien == id);
            if (gv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaMon = new SelectList(db.MonHocs.ToList().OrderBy(n => n.TenMon), "MaMon", "TenMon");
            return View(gv);
        }
        [HttpPost, ActionName("SuaGV")]
        [ValidateInput(false)]
        public ActionResult SuaGV(GiaoVien GV)
        {
            ViewBag.MaMon = new SelectList(db.MonHocs.ToList().OrderBy(n => n.TenMon), "MaMon", "TenMon");
            var gv = db.GiaoViens.SingleOrDefault(n => n.MaGiaoVien == GV.MaGiaoVien);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                gv.TenGiaoVien = GV.TenGiaoVien;
                gv.DiaChi = GV.DiaChi;
                gv.DienThoai = GV.DienThoai;
                gv.Pass = GV.Pass;
                db.SubmitChanges();
            }
            return RedirectToAction("Teacher");
        }
    }
}