using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ihale_Uygulamasi.Areas.admin.Controllers
{
    [Authorize]
    public class UrunlerController : Controller
    {
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }
    }
}