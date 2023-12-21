using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ThiCuoiKy.Controllers
{
    public class HomeController : Controller
    {
        private readonly QLBanQuanAoEntities2 db = new QLBanQuanAoEntities2();
        public ActionResult Index()
        {
            // lấy phân loại
            var phanLoai = db.PhanLoais.ToList();
            ViewBag.phanLoai = phanLoai;

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
    }
}