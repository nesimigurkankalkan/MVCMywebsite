using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCMyWebSite.Models;
using MVCMyWebSite.ViewModel;

namespace MVCMyWebSite.Controllers
{
    public class AdminController : Controller
    {
        mysiteEntities _db = new mysiteEntities();
        // GET: Admin
        public ActionResult AdminPanel()
        {
            //AdminMainViewModel genelmodel = new AdminMainViewModel();
            //genelmodel.GetAlliletisim = _db.iletisim.OrderByDescending(i => i.id).ToList();

            //var adminpanelmodel = _db.anasayfa.FirstOrDefault();
            //if (adminpanelmodel != null)
            //{
            //    Session["KULLANICIADI"] = adminpanelmodel.firstpicturetext;
            //}



            //return View("AdminPanel", genelmodel);
            return View();


        }
        public ActionResult GetNavBar()
        {
            AdminMainViewModel iletisimodel = new AdminMainViewModel();
            iletisimodel.GetAlliletisim = _db.iletisim.OrderByDescending(i => i.id).ToList();
            return PartialView("_PartialAdminNavBar", iletisimodel);
        }
        public ActionResult AnasayfaDetay()
        {
            var model = _db.anasayfaSlider.ToList();
            return View(model);
        }

        

        public ActionResult DeleteFromTab(int id)
        {
            var sil = _db.iletisim.Find(id);
            if (sil == null)
                return HttpNotFound();
            else
            {
                _db.iletisim.Remove(sil);
            }
            _db.SaveChanges();
            return RedirectToAction("IletisimDetay", "Admin");
        }
    }
}