using Ihale_Uygulamasi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Ihale_Uygulamasi.Areas.admin.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Alogin(admin_tablosu adminler)
        {
            if (!ModelState.IsValid)
            {
                return View("index", adminler);
            }

            string sifre1 = Sifrele.MD5Olustur(Sifrele.MD5Olustur(adminler.sifre) + "gsasdxacds");

            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                var adminKontrol = db.admin_tablosu.FirstOrDefault(x => x.kullanici_adi == adminler.kullanici_adi && x.sifre == sifre1);

                if (adminKontrol != null)
                {
                    FormsAuthentication.SetAuthCookie(adminKontrol.kullanici_adi, adminler.BeniHatirla);
                    return RedirectToAction("/index", "urunler");
                }

                ViewBag.Hata = "Kullanıcı adı veya şifre hatalı.";
                return View("index");
            }
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("index");
        }
    }
}