using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ihale_Uygulamasi.Models;
using PagedList;

namespace Ihale_Uygulamasi.Controllers
{
    public class DefaultController : Controller
    {
        public ActionResult Index()
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                var model = db.ihale_tablosu_view.Where(x => (x.aktif == 1 || x.aktif == 0) && x.bitis_tarihi >= System.DateTime.Today).ToList();
                return View(model);
            }
        }

        [Route("hakkimizda")]
        public ActionResult Hakkimizda()
        {
            return View();
        }

        [Route("urun/{id}/{baslik}")]
        public ActionResult UrunDetay(int id)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                var model = db.ihale_tablosu.Where(x => x.id == id).FirstOrDefault();
                db.SaveChanges();
                if (model == null)
                {
                    return HttpNotFound();
                }

                return View(model);
            }
        }

        public ActionResult TeklifVer()
        {
            using (ihale_uygulamasiEntities ihale = new ihale_uygulamasiEntities())
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult TeklifVer(ihale_hareket_tablosu model, int id)
        {
            model.ihale_id = id;
            using (ihale_uygulamasiEntities ihale = new ihale_uygulamasiEntities())
            {
                ihale.ihale_hareket_tablosu.Add(model);
                ihale.SaveChanges();
            }

            return RedirectToAction("Tekliflerim");
        }

        public ActionResult MesajGonder()
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult MesajGonder(mesaj_tablosu model, int id, int id2, int id3)
        {
            model.alici_id = id;
            model.ihale_id = id2;
            model.mesaj_cevap_id = id3;
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                db.mesaj_tablosu.Add(model);
                db.SaveChanges();
            }

            return RedirectToAction("Mesajlar");
        }

        public ActionResult Mesajlar(int sayfa = 1)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                int id2 = (int)Session["id"];
                var degerler = db.mesajlar_view.Where(x => x.alici_id == id2).ToList().ToPagedList(sayfa, 3);
                return View(degerler);
            }
        }

        public ActionResult MesajYanitla()
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult MesajYanitla(mesaj_tablosu model, int id, int id2, int id3, int id4)
        {
            model.alici_id = id;
            model.ihale_id = id2;
            model.mesaj_cevap_id = id3;
            model.yanit = id4;
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                db.mesaj_tablosu.Add(model);
                db.SaveChanges();
            }

            return RedirectToAction("YonlendirmeMesaj", new { id2 = model.mesaj_cevap_id});
        }

        public ActionResult YonlendirmeMesaj(int id2)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                return View(db.mesaj_tablosu.Where(x => x.mesaj_id == id2).ToList());
            }
        }

        [HttpPost]
        public ActionResult YonlendirmeMesaj(FormCollection c)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                int i = 0;
                if (ModelState.IsValid)
                {
                    var idArray = c.GetValues("x.mesaj_id");
                    var gonderen_idArray = c.GetValues("x.gonderen_id");
                    var alici_idArray = c.GetValues("x.alici_id");
                    var ihale_idArray = c.GetValues("x.ihale_id");
                    var mesajArray = c.GetValues("x.mesaj");
                    var mesaj_cevap_idArray = c.GetValues("x.mesaj_cevap_id");
                    var yanitArray = c.GetValues("x.yanit");

                    for (i = 0; i < idArray.Count(); i++)
                    {
                        mesaj_tablosu hareket = db.mesaj_tablosu.Find(Convert.ToInt32(idArray[i]));
                        hareket.gonderen_id = Convert.ToInt32(gonderen_idArray[i]);
                        hareket.alici_id = Convert.ToInt32(alici_idArray[i]);
                        hareket.ihale_id = Convert.ToInt32(ihale_idArray[i]);
                        hareket.mesaj = mesajArray[i].ToString();
                        hareket.mesaj_cevap_id = Convert.ToInt32(mesaj_cevap_idArray[i]);
                        hareket.yanit = Convert.ToInt32(yanitArray[i]);
                    }

                    db.SaveChanges();
                }
            }

            return RedirectToAction("Mesajlar");
        }

        public ActionResult _YanitlananMesajlar(int id)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                int id2 = (int)Session["id"];
                var degerler = db.mesajlar_view.Where(x => x.gonderen_id == id2 && x.mesaj_cevap_id == id).ToList();
                return View(degerler);
            }
        }

        public ActionResult MesajDetay(int id, int id2)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                int id3 = (int)Session["id"];
                var degerler = db.mesajlar_view.Where(x => x.gonderen_id == id && x.alici_id == id3 && x.mesaj_id == id2).ToList();
                return View(degerler);
            }
        }

        public ActionResult Ilanlarim(int sayfa = 1)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                if (Session["id"] == null)
                {
                    return RedirectToAction("../GirisYap/GirisYap", "GirisYapController");
                }

                int id2 = (int)Session["id"];
                var degerler = db.ilanlarim_tablosu_view.Where(x => x.musteri_id == id2).ToList().ToPagedList(sayfa, 3);
                return View(degerler);
            }
        }

        public ActionResult Tekliflerim(int sayfa = 1)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                if (Session["id"] == null)
                {
                    return RedirectToAction("../GirisYap/GirisYap", "GirisYapController");
                }

                int id2 = (int)Session["id"];
                var degerler = db.ihale_hareket_view.Where(x => x.musteri_id == id2).ToList().ToPagedList(sayfa, 3);
                return View(degerler);
            }
        }

        public ActionResult TeklifVerenler(int id)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                var degerler = db.teklif_verenler_view.Where(x => x.ihale_id == id).ToList();
                return View(degerler);
            }
        }

        public ActionResult IlaniSil(int id)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                return View(db.ihale_tablosu.Where(x => x.id == id).FirstOrDefault());
            }
        }

        [HttpPost]
        public ActionResult IlaniSil(int id, FormCollection collection)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                ihale_tablosu ihale = db.ihale_tablosu.Where(x => x.id == id).FirstOrDefault();
                db.ihale_tablosu.Remove(ihale);
                db.SaveChanges();
            }

            return RedirectToAction("Ilanlarim");
        }

        public ActionResult IlaniDuzenle(int id)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                return View(db.ihale_tablosu.Where(x => x.id == id).FirstOrDefault());
            }
        }

        [HttpPost]
        public ActionResult IlaniDuzenle(ihale_tablosu model)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();
            }

            return RedirectToAction("Ilanlarim");
        }

        public ActionResult Detaylar(int id)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                var degerler = db.ihale_hareket_view.Where(x => x.ihale_id == id).ToList();
                return View(degerler);
            }
        }

        public ActionResult IhaleyiVer(int id1, int id2)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                return View(db.ihale_hareket_tablosu.Where(x => x.ihale_id == id2 && x.musteri_id == id1).FirstOrDefault());
            }
        }

        [HttpPost]
        public ActionResult IhaleyiVer(ihale_hareket_tablosu model)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                int id_ihale = model.ihale_id;
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();
            }

            return RedirectToAction("Yonlendirme", new { id2 = model.ihale_id });
        }

        public ActionResult Yonlendirme(int id2)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                return View( db.ihale_hareket_tablosu.Where(x => x.ihale_id == id2 && x.aktif != 2).ToList());
            }
        }

        [HttpPost]
        public ActionResult Yonlendirme(FormCollection c)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                int i = 0;
                if (ModelState.IsValid)
                {
                    var idArray = c.GetValues("x.id");
                    var ihale_idArray = c.GetValues("x.ihale_id");
                    var musteri_idArray = c.GetValues("x.musteri_id");
                    var teklifArray = c.GetValues("x.teklif_fiyati");
                    var aktifArray = c.GetValues("x.aktif");

                    if (idArray != null)
                    {
                        for (i = 0; i < idArray.Count(); i++)
                        {
                            ihale_hareket_tablosu hareket = db.ihale_hareket_tablosu.Find(Convert.ToInt32(idArray[i]));
                            hareket.ihale_id = Convert.ToInt32(ihale_idArray[i]);
                            hareket.musteri_id = Convert.ToInt32(musteri_idArray[i]);
                            hareket.teklif_fiyati = Convert.ToInt32(teklifArray[i]);
                            hareket.aktif = Convert.ToInt32(aktifArray[i]);
                        }
                    }

                    db.SaveChanges();
                }
            }

            return RedirectToAction("Ilanlarim");
        }

        public ActionResult Puanlama()
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                List<SelectListItem> deger = (from i in db.puan_tablosu.ToList()
                                              select new SelectListItem
                                              {
                                                  Text = i.puan.ToString(),
                                                  Value = i.id.ToString()
                                              }).ToList();
                ViewBag.dgr = deger;
                return View();
            }
        }

        [HttpPost]
        public ActionResult Puanlama(int id2, string adi, string soyadi, musteri_puan_tablosu model)
        {
            using (ihale_uygulamasiEntities db = new ihale_uygulamasiEntities())
            {
                model.musteri_id = id2;
                model.musteri_adi = adi;
                model.musteri_soyadi = soyadi;
                model.puan_veren_id = (int)Session["id"];
                model.puan_veren_kullanici = (string)Session["kullaniciadi"];
                db.musteri_puan_tablosu.Add(model);
                db.SaveChanges();
            }

            return RedirectToAction("Ilanlarim");
        }
    }
}