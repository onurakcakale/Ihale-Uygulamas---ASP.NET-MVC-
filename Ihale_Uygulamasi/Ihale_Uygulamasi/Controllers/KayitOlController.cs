using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ihale_Uygulamasi.Models;

namespace Ihale_Uygulamasi.Controllers
{
    public class KayitOlController : Controller
    {
        public ActionResult KayitOl()
        {
            return View(new musteri_tablosu());
        }

        [HttpPost]
        public ActionResult KayitOl(musteri_tablosu musteriModel)
        {
            using (ihale_uygulamasiEntities ihale = new ihale_uygulamasiEntities())
            {
                if (musteriModel.musteri_adi == null || musteriModel.musteri_soyadi == null || 
                    musteriModel.adres == null || musteriModel.e_posta == null || 
                    musteriModel.kullanici_adi == null || musteriModel.sifre == null)
                {
                    musteriModel.KayitOlError = "Lütfen gerekli tüm alanları doldurun.";
                    return View("KayitOl", musteriModel);
                }

                else
                {
                    ihale.musteri_tablosu.Add(musteriModel);
                    ihale.SaveChanges();
                    return RedirectToAction("../GirisYap/GirisYap");
                }
            }
        }
    }
}