using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
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

            if(sanPham == null)
            {
                return RedirectToAction("Index");
            }

            // lấy phân loại chính
            var phanLoaiChinh = db.PhanLoais.ToList();

            // lấy phân loại phụ
            var phanLoaiPhu = db.PhanLoaiPhus.ToList();

            // tạo SelectList
            /*
             3 tham số
            - tham số 1: danh sách để xổ xuống cho mình chọn
            - tham số 2: giá trị được chọn (ví dụ mình chọn loại VipPro thì MaPhanLoai của VipPro là 1)
            - tham số 3: là chữ hiện trên view cho mình chọn (ví dụ VipPro, Normal, ....)
            - Lưu ý: tham số 2 và 3 là tên thuộc tính của Model PhanLoai
            - Phan Loại phụ tương tự
             */
            SelectList selectPhanLoaiChinh = new SelectList(phanLoaiChinh, "MaPhanLoai", "PhanLoaiChinh");
            SelectList selectPhanLoaiPhu = new SelectList(phanLoaiPhu, "MaPhanLoaiPhu", "TenPhanLoaiPhu");

            // sử dụng ViewBag để truyền 2 select list này sang view
            ViewBag.selectPhanLoaiChinh = selectPhanLoaiChinh;
            ViewBag.selectPhanLoaiPhu = selectPhanLoaiPhu;

            // sản phẩm tui truyền vào tham số View để nó truyền tới @model SanPham ở hàng đầu tiên
            // mục đích là để chỉnh sửa dữ liệu của sản phẩm để truyền tới Action xử lý
            // thường thì để chỉnh sửa 1 bản ghi thì mới truyền vào tham số của View
            // còn dữ liệu chỉ xem mà không chỉnh sửa thì truyền theo ViewBag hoặc ViewData như ở SelectList
            return View(sanPham);
        }

        [HttpPost] // action này để lưu thay đổi sản phẩm r trả về trang chỉnh sửa
        public async Task<ActionResult> Edit(SanPham model, HttpPostedFileBase image)
        {
            /*
             * tuy chuyển sang hàm bất đồng bộ async await để đảm bảo dữ liệu sẽ lưu xong trước khi trả về view
             model: là dữ liệu mới truyền từ view, nó chưa lưu trong database
             */

            if (model == null)
            {
                return RedirectToAction("Index");
            }

            // tìm sản phẩm cũ trong database
            var sanPham = db.SanPhams
                .Where(sp => sp.MaSanPham == model.MaSanPham)
                .FirstOrDefault();

            if(sanPham == null)
            {
                return RedirectToAction("Index");
            }

            // tìm phân loại chính mới và phân loại phụ mới
            var phanLoaiChinhMoi = db.PhanLoais
                .Where(plc => plc.MaPhanLoai == model.MaPhanLoai)
                .FirstOrDefault();

            // tìm phân loại chính mới và phân loại phụ mới
            var phanLoaiPhuMoi = db.PhanLoaiPhus
                .Where(plc => plc.MaPhanLoaiPhu == model.MaPhanLoaiPhu)
                .FirstOrDefault();

            // gán sản phẩm cũ bằng dữ liệu mới
            sanPham.TenSanPham = model.TenSanPham;
            sanPham.DonGiaBanNhoNhat = model.DonGiaBanNhoNhat;
            sanPham.TrangThai = model.TrangThai;
            sanPham.MoTaNgan = model.MoTaNgan;
            sanPham.NoiBat = model.NoiBat;
            sanPham.GiaNhap = model.GiaNhap;

            // gán phân loại mới
            sanPham.MaPhanLoai = model.MaPhanLoai;
            sanPham.PhanLoai = phanLoaiChinhMoi;
            sanPham.MaPhanLoaiPhu = model.MaPhanLoaiPhu;
            sanPham.PhanLoaiPhu = phanLoaiPhuMoi;

            /*lưu ảnh */
            // kiểm tra coi có ảnh mới hông, nếu có thì tiến hành thay ảnh mới
            if(image != null)
            {
                // xóa ảnh cũ
                /* lấy đường dẫn ảnh cũ
                 * Server.MapPath("~/") lấy đường dẫn thư mục của dự án
                 */
                string fileAnhCu = Path.Combine(Server.MapPath("~/Content/images"), sanPham.AnhDaiDien);
               
                // kiemr tra file ảnh có tồn tại hông, có thì xóa
                if(System.IO.File.Exists(fileAnhCu))
                {
                    System.IO.File.Delete(fileAnhCu); // xóa
                }

                // lưu ảnh mới
                // tạo đường dẫn file ảnh mới
                string tenAnhMoi = Path.GetFileName(image.FileName);
                string fileAnhMoi = Path.Combine(Server.MapPath("~/Content/images"), tenAnhMoi);
                image.SaveAs(fileAnhMoi);
                sanPham.AnhDaiDien = tenAnhMoi;
            }

            db.SanPhams.AddOrUpdate(sanPham);
            await db.SaveChangesAsync();

            #region cách 1
            // trả về action Edit [MethodGet] phải có maSP kèm theo vì tham số của Edit có Edit
            return RedirectToAction("Edit", new { maSP = sanPham.MaSanPham });
            #endregion

            #region cách 2 
            // lấy phân loại chính
            //var phanLoaiChinh = db.PhanLoais.ToList();
            //// lấy phân loại phụ
            //var phanLoaiPhu = db.PhanLoaiPhus.ToList();

            //// tạo SelectList
            //SelectList selectPhanLoaiChinh = new SelectList(phanLoaiChinh, "MaPhanLoai", "PhanLoaiChinh");
            //SelectList selectPhanLoaiPhu = new SelectList(phanLoaiPhu, "MaPhanLoaiPhu", "TenPhanLoaiPhu");

            //// sử dụng ViewBag để truyền 2 select list này sang view
            //ViewBag.selectPhanLoaiChinh = selectPhanLoaiChinh;
            //ViewBag.selectPhanLoaiPhu = selectPhanLoaiPhu;

            //return View(sanPham);
            #endregion
        }
    }
}