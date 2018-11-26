using MVCMyWebSite.Models;
using MVCMyWebSite.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCMyWebSite.Controllers
{
    public class IletisimController : Controller
    {
        mysiteEntities _db = new mysiteEntities();
        // GET: Iletisim
        public ActionResult IletisimDetay()
        {
            AdminMainViewModel iletisimlistesi = new AdminMainViewModel();
            iletisimlistesi.GetAlliletisim = _db.iletisim.OrderByDescending(i => i.id).ToList();
            return View(iletisimlistesi);
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
            return RedirectToAction("IletisimDetay", "Iletisim");
        }
        public ActionResult IletisimProcess()
        {
            return View();
        }
    }
}