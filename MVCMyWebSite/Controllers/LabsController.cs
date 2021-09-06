using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCMyWebSite.Controllers
{
    public class LabsController : Controller
    {
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
	}
}