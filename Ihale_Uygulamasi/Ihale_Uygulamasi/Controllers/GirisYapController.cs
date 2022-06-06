using Ihale_Uygulamasi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ihale_Uygulamasi.Controllers
{
    public class GirisYapController : Controller
    {
        public ActionResult GirisYap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Authorize(musteri_tablosu musteriModel)
        {
            using (ihale_uygulamasiEntities ihale = new ihale_uygulamasiEntities())
            {
                var musteriDetails = ihale.musteri_tablosu.Where(x => x.kullanici_adi == musteriModel.kullanici_adi && x.sifre == musteriModel.sifre).FirstOrDefault();

                if (musteriDetails == null)
                {
                    musteriModel.GirisYapError = "Kullanıcı adı veya şifre yanlış";
                    return View("GirisYap", musteriModel);
                }

                else
                {
                    Session["id"] = musteriDetails.id;
                    Session["kullaniciadi"] = musteriDetails.kullanici_adi;
                    return RedirectToAction("../Default/Index", "Default");
                }
            }
        }

        public ActionResult CikisYap()
        {
            int id = (int)Session["id"];
            Session.Abandon();
            return RedirectToAction("../Default/Index", "Default");
        }
    }
}