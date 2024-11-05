using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HeThongQuanLySieuXe.Models;

namespace HeThongQuanLySieuXe.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        CuaHangXeEntities1 db = new CuaHangXeEntities1();
        public ActionResult Index(string HangXe= "Lamborghini",string DongXe= "Hypercar")
        {
            // Lọc theo hãng xe
            List<Xe> dsXeTheoHang = db.Xes.Where(x => x.HangXe == HangXe).Take(4).ToList();
            ViewBag.dsXeTheoHang = dsXeTheoHang;
            // Lọc theo dòng xe
            List<Xe> dsXeTheoDong = db.Xes.Where(x => x.DongXe == DongXe).Take(4).ToList();
            ViewBag.dsXeTheoDong = dsXeTheoDong;
            return View();
        }
    }
}