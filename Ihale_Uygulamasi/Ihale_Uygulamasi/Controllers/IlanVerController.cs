using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Ihale_Uygulamasi.Models;

namespace Ihale_Uygulamasi.Controllers
{
    public class IlanVerController : Controller
    {
        [HttpGet]
        public ActionResult IlanVer()
        {
            using (ihale_uygulamasiEntities ihale = new ihale_uygulamasiEntities())
            {
                List<SelectListItem> degerler = (from i in ihale.kategori_tablosu.ToList()
                                                 select new SelectListItem
                                                 {
                                                     Text = i.kategori_ad,
                                                     Value = i.kategori_id.ToString()
                                                 }).ToList();
                ViewBag.dgr = degerler;
                return View();
            }
        }

        [HttpPost]
        public ActionResult IlanVer(ihale_tablosu model)
        {
            string fileName = Path.GetFileNameWithoutExtension(model.ImageFile.FileName);
            string extension = Path.GetExtension(model.ImageFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
            model.urun_fotografi = "~/Image/" + fileName;
            fileName = Path.Combine(Server.MapPath("~/Image"), fileName);
            model.ImageFile.SaveAs(fileName);
            using (ihale_uygulamasiEntities ihale = new ihale_uygulamasiEntities())
            {
                ihale.ihale_tablosu.Add(model);
                ihale.SaveChanges();
            }

            ModelState.Clear();
            return RedirectToAction("../Default/Ilanlarim");
        }
    }
}