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
        public ActionResult Index(string searchString)
        {          
            var hocsinh = from e in db.HocSinhs select e;
            if (!String.IsNullOrEmpty(searchString))
            {
                hocsinh = hocsinh.Where(s => s.HoTen.Contains(searchString));
            }
            ViewBag.SeachString = searchString;
            return View(hocsinh.ToList());
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
    }
}