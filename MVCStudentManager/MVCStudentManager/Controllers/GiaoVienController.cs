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
    }
}