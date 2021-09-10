using MVCMyWebSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCMyWebSite.Controllers
{
    public class LabsController : Controller
    {
        mysiteEntities _db = new mysiteEntities();
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult Content(int? id)
        {
            if (id == null)
            {
                return View();
            }
            else
            {
                var model = _db.BlogYazilari.Find(id);
                return View("Content", model);
            }
            
        }
        [AllowAnonymous]
        public ActionResult Example()
        {
            //https://www.pvladov.com/p/syntax-highlighter.html
            return View();
        }
	}
}