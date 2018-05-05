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
        public ActionResult Index(string searchString)
        {       
            var giaovien = from e in db.GiaoViens select e;
            if (!String.IsNullOrEmpty(searchString))
            {
                giaovien = giaovien.Where(s => s.TenGiaoVien.Contains(searchString));
            }
            ViewBag.SeachString = searchString;
            return View(giaovien.ToList());
        }
        //Trang quản lí học sinh
        public ActionResult Student(int? page, string searchString)
        {
            var hocsinh = from e in db.HocSinhs select e;
            if (!String.IsNullOrEmpty(searchString))
            {
                hocsinh = hocsinh.Where(s => s.HoTen.Contains(searchString));
            }
            ViewBag.SeachString = searchString;
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            return View(hocsinh.ToList().OrderBy(n => n.MaHS).ToPagedList(pageNumber, pageSize));
        }
        //Trang điểm
        public ActionResult Mark(int? page, string searchString)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            return View(db.DiemMons.ToList().OrderBy(n => n.MaDiemMon).ToPagedList(pageNumber, pageSize));
        }
        //Trang lớp
        public ActionResult Class(int? page, string searchString)
        {
            var lop = from e in db.Lops select e;
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
            if (!String.IsNullOrEmpty(searchString))
            {
                giaovien = giaovien.Where(s => s.TenGiaoVien.Contains(searchString));
            }
            ViewBag.SeachString = searchString;
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            return View(giaovien.ToList().OrderBy(n => n.MaGiaoVien).ToPagedList(pageNumber, pageSize));
        }

        /***** DANH SÁCH ĐIỂM*****/
        //Thêm 
        [HttpGet]
        public ActionResult ThemDiem()
        {
            ViewBag.MaHS = new SelectList(db.HocSinhs.ToList().OrderBy(n => n.HoTen), "MaHS", "HoTen");
            ViewBag.MaHocKy = new SelectList(db.HocKies.ToList().OrderBy(n => n.TenHocKy), "MaHocKy", "TenHocKy");
            ViewBag.MaMon = new SelectList(db.MonHocs.ToList().OrderBy(n => n.TenMon), "MaMon", "TenMon");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemDiem(DiemMon DIEM, HttpPostedFileBase fileupload)
        {
            DiemMon diem = db.DiemMons.SingleOrDefault(n => n.MaDiemMon == DIEM.MaDiemMon);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                db.DiemMons.InsertOnSubmit(DIEM);
                db.SubmitChanges();
            }
            return RedirectToAction("Mark");
        }
    }
}