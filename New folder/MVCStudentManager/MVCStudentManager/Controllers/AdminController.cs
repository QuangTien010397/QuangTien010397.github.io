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
    public class AdminController : Controller
    {
        dbStudentManagerDataContext db = new dbStudentManagerDataContext();
        // GET: Admin
        public ActionResult IndexLogOut()
        {
            return View();
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
        public ActionResult Teacher(int ? page, string searchString)
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

        //Trang đăng nhập
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
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
                Admin ad = db.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("IndexLogOut", "Admin");
                }
                else
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }

        /***** DANH SÁCH HỌC SINH *****/
        //Thêm 
        [HttpGet]
        public ActionResult ThemHS()
        {
            ViewBag.MaLop = new SelectList(db.Lops.ToList().OrderBy(n => n.TenLop), "MaLop", "TenLop");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemHS(HocSinh HS, HttpPostedFileBase fileupload)
        {
            HocSinh hs = db.HocSinhs.SingleOrDefault(n => n.MaHS == HS.MaHS);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                db.HocSinhs.InsertOnSubmit(HS);
                db.SubmitChanges();
            }
            return RedirectToAction("Student");
        }
        //Xóa
        [HttpGet]
        public ActionResult XoaHS(int id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            HocSinh hs = db.HocSinhs.SingleOrDefault(n => n.MaHS == id);
            ViewBag.MaHS = hs.MaHS;
            if (hs == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(hs);
        }
        [HttpPost, ActionName("XoaHS")]
        public ActionResult XacnhanxoaHS(int id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            HocSinh HS = db.HocSinhs.SingleOrDefault(n => n.MaHS == id);
            ViewBag.MaHS = HS.MaHS;
            if (HS == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.HocSinhs.DeleteOnSubmit(HS);
            db.SubmitChanges();
            return RedirectToAction("Student");
        }
        //Sửa
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
            ViewBag.MaLop = new SelectList(db.Lops.ToList().OrderBy(n => n.TenLop), "MaLop", "TenLop");
            return View(hs);
        }
        [HttpPost, ActionName("SuaHS")]
        [ValidateInput(false)]
        public ActionResult SuaHS(HocSinh HS, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaLop = new SelectList(db.Lops.ToList().OrderBy(n => n.TenLop), "MaLop", "TenLop");
            var hs = db.HocSinhs.SingleOrDefault(n => n.MaHS == HS.MaHS);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                hs.HoTen = HS.HoTen;
                hs.NgaySinh = HS.NgaySinh;
                hs.GioiTinh = HS.GioiTinh;
                hs.Email = HS.Email;
                hs.DiaChi = HS.DiaChi;
                db.HocSinhs.InsertOnSubmit(HS);
                db.SubmitChanges();
            }
            return RedirectToAction("Student");
        }


        /***** DANH SÁCH LỚP *****/
        //Thêm 
        [HttpGet]
        public ActionResult ThemLop()
        {
            ViewBag.MaKhoi = new SelectList(db.Khois.ToList().OrderBy(n => n.TenKhoi), "MaKhoi", "TenKhoi");
            ViewBag.MaNamHoc = new SelectList(db.NamHocs.ToList().OrderBy(n => n.TenNamHoc), "MaNamHoc", "TenNamHoc");
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens.ToList().OrderBy(n => n.TenGiaoVien), "MaGiaoVien", "TenGiaoVien");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemLop(Lop LOP, HttpPostedFileBase fileupload)
        {
            Lop lop = db.Lops.SingleOrDefault(n => n.MaLop == LOP.MaLop);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                db.Lops.InsertOnSubmit(LOP);
                db.SubmitChanges();
            }
            return RedirectToAction("Class");
        }
        //Xóa
        [HttpGet]
        public ActionResult XoaLop(int id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            Lop lop = db.Lops.SingleOrDefault(n => n.MaLop == id);
            ViewBag.MaLop = lop.MaLop;
            if (lop == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(lop);
        }
        [HttpPost, ActionName("XoaLop")]
        public ActionResult XacnhanxoaLop(int id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            Lop lop = db.Lops.SingleOrDefault(n => n.MaLop == id);
            ViewBag.MaLop = lop.MaLop;
            if (lop == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.Lops.DeleteOnSubmit(lop);
            db.SubmitChanges();
            return RedirectToAction("Class");
        }
        //Sửa
        [HttpGet]
        public ActionResult SuaLop(int id)
        {
            //Lấy ra đối tượng sách cần sửa theo mã
            Lop lop = db.Lops.SingleOrDefault(n => n.MaLop == id);
            if (lop == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaKhoi = new SelectList(db.Khois.ToList().OrderBy(n => n.TenKhoi), "MaKhoi", "TenKhoi");
            ViewBag.MaNamHoc = new SelectList(db.NamHocs.ToList().OrderBy(n => n.TenNamHoc), "MaNamHoc", "TenNamHoc");
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens.ToList().OrderBy(n => n.TenGiaoVien), "MaGiaoVien", "TenGiaoVien");
            return View(lop);
        }
        [HttpPost, ActionName("SuaLop")]
        [ValidateInput(false)]
        public ActionResult SuaLop(Lop LOP, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaKhoi = new SelectList(db.Khois.ToList().OrderBy(n => n.TenKhoi), "MaKhoi", "TenKhoi");
            ViewBag.MaNamHoc = new SelectList(db.NamHocs.ToList().OrderBy(n => n.TenNamHoc), "MaNamHoc", "TenNamHoc");
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens.ToList().OrderBy(n => n.TenGiaoVien), "MaGiaoVien", "TenGiaoVien");
            var lop = db.Lops.SingleOrDefault(n => n.MaLop == LOP.MaLop);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                lop.MaKhoi = LOP.MaKhoi;
                lop.MaNamHoc = LOP.MaNamHoc;
                lop.TenLop = LOP.TenLop;
                lop.MaGiaoVien = LOP.MaGiaoVien;
                lop.SiSo = LOP.SiSo;
                db.SubmitChanges();
            }
            return RedirectToAction("Class");
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
        //Xóa
        [HttpGet]
        public ActionResult XoaDiem(int id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            DiemMon diem = db.DiemMons.SingleOrDefault(n => n.MaDiemMon == id);
            ViewBag.MaDiemMon = diem.MaDiemMon;
            if (diem == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(diem);
        }
        [HttpPost, ActionName("XoaDiem")]
        public ActionResult XacnhanxoaDiem(int id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            DiemMon diem = db.DiemMons.SingleOrDefault(n => n.MaDiemMon == id);
            ViewBag.MaDiemMon = diem.MaDiemMon;
            if (diem == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.DiemMons.DeleteOnSubmit(diem);
            db.SubmitChanges();
            return RedirectToAction("Class");
        }
        //Sửa
        [HttpGet]
        public ActionResult SuaDiem(int id)
        {
            //Lấy ra đối tượng sách cần sửa theo mã
            DiemMon diem = db.DiemMons.SingleOrDefault(n => n.MaDiemMon == id);
            if (diem == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaHS = new SelectList(db.HocSinhs.ToList().OrderBy(n => n.HoTen), "MaHS", "HoTen");
            ViewBag.MaHocKy = new SelectList(db.HocKies.ToList().OrderBy(n => n.TenHocKy), "MaHocKy", "TenHocKy");
            ViewBag.MaMon = new SelectList(db.MonHocs.ToList().OrderBy(n => n.TenMon), "MaMon", "TenMon");
            return View(diem);
        }
        [HttpPost, ActionName("SuaDiem")]
        [ValidateInput(false)]
        public ActionResult SuaDiem(DiemMon DIEM)
        {
            ViewBag.MaHS = new SelectList(db.HocSinhs.ToList().OrderBy(n => n.HoTen), "MaHS", "HoTen");
            ViewBag.MaHocKy = new SelectList(db.HocKies.ToList().OrderBy(n => n.TenHocKy), "MaHocKy", "TenHocKy");
            ViewBag.MaMon = new SelectList(db.MonHocs.ToList().OrderBy(n => n.TenMon), "MaMon", "TenMon");
            var diem = db.DiemMons.SingleOrDefault(n => n.MaDiemMon == DIEM.MaDiemMon);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                diem.Diem15phut = DIEM.Diem15phut;
                diem.Diem1Tiet = DIEM.Diem1Tiet;
                diem.DiemHK = DIEM.DiemHK;
                diem.DiemTB = DIEM.DiemTB;
                db.SubmitChanges();
            }
            return RedirectToAction("Mark");
        }


        /***** DANH SÁCH GIÁO VIÊN*****/
        // Thêm
        [HttpGet]
        public ActionResult ThemGV()
        {
            ViewBag.MaMon = new SelectList(db.MonHocs.ToList().OrderBy(n => n.TenMon), "MaMon", "TenMon");
            return View();
        }
        [HttpPost]
        public ActionResult ThemGV(GiaoVien GV)
        {
            GiaoVien gv = db.GiaoViens.SingleOrDefault(n => n.MaGiaoVien== GV.MaGiaoVien);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                db.GiaoViens.InsertOnSubmit(GV);
                db.SubmitChanges();
            }
            return RedirectToAction("Teacher");
        }
        // Xóa 
        public ActionResult XoaGV(int id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            GiaoVien diem = db.GiaoViens.SingleOrDefault(n => n.MaGiaoVien == id);
            ViewBag.MaGiaoVien= diem.MaGiaoVien;
            if (diem == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(diem);
        }
        [HttpPost, ActionName("XoaGV")]
        public ActionResult XacnhanxoaGV(int id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            GiaoVien gv = db.GiaoViens.SingleOrDefault(n => n.MaGiaoVien == id);
            ViewBag.MaGiaoVien = gv.MaGiaoVien;
            if (gv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.GiaoViens.DeleteOnSubmit(gv);
            db.SubmitChanges();
            return RedirectToAction("Teacher");
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
        public ActionResult SuaDiem(GiaoVien GV)
        {
            ViewBag.MaMon = new SelectList(db.MonHocs.ToList().OrderBy(n => n.TenMon), "MaMon", "TenMon");
            var gv = db.GiaoViens.SingleOrDefault(n => n.MaGiaoVien == GV.MaGiaoVien);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                gv.TenGiaoVien = GV.TenGiaoVien;
                gv.DiaChi = GV.DiaChi;
                gv.DienThoai = GV.DienThoai;
                gv.MaMon = GV.MaMon;
                db.SubmitChanges();
            }
            return RedirectToAction("Teacher");
        }
    }
}