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
    }
}