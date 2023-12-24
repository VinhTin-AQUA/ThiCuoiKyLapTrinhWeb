using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ThiCuoiKy.Controllers
{
    public class HomeController : Controller
    {
        private readonly QLBanQuanAoEntities3 db = new QLBanQuanAoEntities3();
        public ActionResult Index()
        {
            // lấy phân loại
            var phanLoai = db.PhanLoais.ToList();
            ViewBag.phanLoai = phanLoai;


            // lấy sản phầm
            var sapPham = db.SanPhams.ToList();
            ViewBag.sanPham = sapPham;

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpGet]
        public ActionResult GetProductByCategory(int? cateId) 
        {
            if(cateId == null)
            {
                return RedirectToAction("Index");
            }

            // lấy phân loại
            //var phanLoai = db.PhanLoais.ToList();
            //ViewBag.phanLoai = phanLoai;

            var sanPham = db.SanPhams
                .Where(sp => sp.MaPhanLoai == cateId)
                .ToList();

            // tạo danh sách mới chỉ lấy các thuộc tính
            // không lấy các đối tượng tham chiếu
            var _sanPham = sanPham
                .Select(sp => new SanPham 
                { 
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    DonGiaBanNhoNhat = sp.DonGiaBanNhoNhat,
                    TrangThai = sp.TrangThai,
                    MoTaNgan = sp.MoTaNgan,
                    AnhDaiDien = sp.AnhDaiDien,
                    NoiBat = sp.NoiBat,
                    MaPhanLoaiPhu = sp.MaPhanLoaiPhu,
                    MaPhanLoai = sp.MaPhanLoai,
                    GiaNhap = sp.GiaNhap
                }).ToList();

            return Json(new { sanPham = _sanPham }, JsonRequestBehavior.AllowGet);
        }


        [HttpGet] // action này trả về trang chỉnh sửa
        public ActionResult Edit(int? maSP)
        {
            if(maSP == null)
            {
                return RedirectToAction("Index");
            }

            var sanPham = db.SanPhams
                .Where(sp => sp.MaSanPham == maSP)
                .FirstOrDefault();


            return View(sanPham);
        }

        [HttpPost] // action này để lưu thay đổi sản phẩm r trả về trang chỉnh sửa
        public ActionResult Edit(SanPham model)
        {
            

            return View();
        }



    }
}