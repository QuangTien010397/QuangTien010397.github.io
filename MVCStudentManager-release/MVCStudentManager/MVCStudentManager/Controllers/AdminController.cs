﻿using System;
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
        public ActionResult Index()
        {
            return View();
        }
        //Trang lớp
        public ActionResult Class(int? page, string searchString)
        {
            var lop = from e in db.Lops select e;
            Session["Lop"] = lop;
            if (Session["Taikhoanadmin"] == null || Session["Taikhoanadmin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }
            if (Session["Lop"] == null)
            {
                return RedirectToAction("Class", "Admin");
            }
            if (!String.IsNullOrEmpty(searchString))
            {
                lop = lop.Where(s => s.TenLop.Contains(searchString));
            }
            ViewBag.SeachString = searchString;
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            return View(lop.ToList().OrderBy(n => n.MaLop).ToPagedList(pageNumber, pageSize));
        }
        //Trang giáo viên
        public ActionResult Teacher(int? page, string searchString)
        {
            var giaovien = from e in db.GiaoViens select e;
            Session["GiaoVien"] = giaovien;
            if (Session["Taikhoanadmin"] == null || Session["Taikhoanadmin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }
            if (Session["GiaoVien"] == null)
            {
                return RedirectToAction("Teacher", "Admin");
            }
            if (!String.IsNullOrEmpty(searchString))
            {
                giaovien = giaovien.Where(s => s.TenGiaoVien.Contains(searchString));
            }
            ViewBag.SeachString = searchString;
            int pageNumber = (page ?? 1);
            int pageSize = 10;
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
            var hoten = collection["hoten"];
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
                Admin name = db.Admins.SingleOrDefault(n => n.HoTen == hoten);
                if (ad != null)
                {
                    Session["Taikhoanadmin"] = ad;
                    Session["HoTen"] = name;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
        //Trang đăng xuất
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Admin");
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
            return RedirectToAction("Index");
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
            return RedirectToAction("Index");
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
                db.SubmitChanges();
            }
            return RedirectToAction("Index");
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
                db.SubmitChanges();
            }
            return RedirectToAction("Class");
        }
        // Học sinh theo lớp
        public ActionResult DSLop()
        {
            var hs = from lop in db.Lops select lop;
            return PartialView(hs);
        }
        public ActionResult HocSinhTheoLop(int? page, int id, string searchString)
        {
            var hs = from s in db.HocSinhs where s.MaLop == id select s;

            Session["DSHocSinh"] = hs;
            if (Session["Taikhoanadmin"] == null || Session["Taikhoanadmin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }
            if (Session["DSHocSinh"] == null)
            {
                return RedirectToAction("HocSinhTheoLop", "Admin");
            }
            if (!String.IsNullOrEmpty(searchString))
            {
                hs = hs.Where(s => s.HoTen.Contains(searchString));
            }
            //return View(hs);
            ViewBag.SeachString = searchString;
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            return View(hs.ToList().OrderBy(n => n.MaHS).ToPagedList(pageNumber, pageSize));
        }

        /***** DANH SÁCH ĐIỂM*****/
        //Thêm 
        [HttpGet]
        public ActionResult ThemDiem()
        {
            ViewBag.MaHS = new SelectList(db.HocSinhs.ToList().OrderBy(n => n.HoTen), "MaHS", "HoTen");
            ViewBag.MaHocKy = new SelectList(db.HocKies.ToList().OrderBy(n => n.TenHocKy), "MaHocKy", "TenHocKy");
            ViewBag.MaMon = new SelectList(db.MonHocs.ToList().OrderBy(n => n.TenMon), "MaMon", "TenMon");
            ViewBag.MaNamHoc = new SelectList(db.NamHocs.ToList().OrderBy(n => n.TenNamHoc), "MaNamHoc", "TenNamHoc");
            ViewBag.MaLop = new SelectList(db.Lops.ToList().OrderBy(n => n.TenLop), "MaLop", "TenLop");
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
            return RedirectToAction("Index");
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
            return RedirectToAction("Index");
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
            ViewBag.MaNamHoc = new SelectList(db.NamHocs.ToList().OrderBy(n => n.TenNamHoc), "MaNamHoc", "TenNamHoc");
            ViewBag.MaLop = new SelectList(db.Lops.ToList().OrderBy(n => n.TenLop), "MaLop", "TenLop");
            return View(diem);
        }
        [HttpPost, ActionName("SuaDiem")]
        [ValidateInput(false)]
        public ActionResult SuaDiem(DiemMon DIEM)
        {
            ViewBag.MaHS = new SelectList(db.HocSinhs.ToList().OrderBy(n => n.HoTen), "MaHS", "HoTen");
            ViewBag.MaHocKy = new SelectList(db.HocKies.ToList().OrderBy(n => n.TenHocKy), "MaHocKy", "TenHocKy");
            ViewBag.MaMon = new SelectList(db.MonHocs.ToList().OrderBy(n => n.TenMon), "MaMon", "TenMon");
            ViewBag.MaNamHoc = new SelectList(db.NamHocs.ToList().OrderBy(n => n.TenNamHoc), "MaNamHoc", "TenNamHoc");
            ViewBag.MaLop = new SelectList(db.Lops.ToList().OrderBy(n => n.TenLop), "MaLop", "TenLop");
            var diem = db.DiemMons.SingleOrDefault(n => n.MaDiemMon == DIEM.MaDiemMon);
            // Lưu vào CSDL
            if (ModelState.IsValid)
            {
                diem.Diem15phut = DIEM.Diem15phut;
                diem.Diem1Tiet = DIEM.Diem1Tiet;
                diem.DiemHK = DIEM.DiemHK;
                diem.DiemTB = (DIEM.Diem15phut + DIEM.Diem1Tiet + DIEM.DiemHK) / 3;
                db.SubmitChanges();
            }
            return RedirectToAction("Index");
        }
        //Điểm theo học sinh
        //public ActionResult DSHocSinh()
        //{
        //    var diem = from HS in db.HocSinhs select HS;
        //    return PartialView(diem);
        //}
        public ActionResult DiemTheoHS(int id)
        {
            var diem = from d in db.DiemMons where d.MaHS == id select d;
            return View(diem);
        }

        //public ActionResult DiemTheoMon(int id)
        //{
        //    var diem = from d in db.DiemMons where d.MaMon == id select d;
        //    return PartialView(diem);
        //}


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
            GiaoVien gv = db.GiaoViens.SingleOrDefault(n => n.MaGiaoVien == GV.MaGiaoVien);
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
            GiaoVien gv = db.GiaoViens.SingleOrDefault(n => n.MaGiaoVien == id);
            ViewBag.MaGiaoVien = gv.MaGiaoVien;
            if (gv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(gv);
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
                gv.MaMon = GV.MaMon;
                db.SubmitChanges();
            }
            return RedirectToAction("Teacher");
        }

    }
}