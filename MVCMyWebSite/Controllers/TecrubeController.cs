using MVCMyWebSite.Models;
using MVCMyWebSite.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCMyWebSite.Controllers
{
    public class TecrubeController : Controller
    {
        mysiteEntities _db = new mysiteEntities();
        public ActionResult TecrubeDetay()
        {
            var model = _db.tecrube.ToList();
            return View(model);
        }
        public ActionResult TecrubeProcess(int ?id)
        {
            if (id == null)
            {
                return View();
            }
            else
            {
                var tecrube1 = _db.tecrube.Find(id);
                TecrubeViewModel tecrubemodel = new TecrubeViewModel();
                tecrubemodel.tecrube = tecrube1;
                return View("TecrubeProcess", tecrubemodel);
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult TecrubeEkleGuncelle(TecrubeViewModel Item)
        {
            if (Item.tecrube.id == 0)
            {
                _db.tecrube.Add(Item.tecrube);
            }
            else
            {
                var guncellenecekveri = _db.tecrube.Find(Item.tecrube.id);
                if (guncellenecekveri == null)
                {
                    return HttpNotFound();
                }
                guncellenecekveri.baslik = Item.tecrube.baslik;
                guncellenecekveri.tarih = Item.tecrube.tarih;
                guncellenecekveri.uzunyazi = Item.tecrube.uzunyazi;
            }
            _db.SaveChanges();
            return RedirectToAction("TecrubeDetay", "Tecrube");
        }
        public ActionResult DeleteFromTab(int id)
        {
            var sil = _db.tecrube.Find(id);
            if (sil == null)
                return HttpNotFound();
            else
            {
                _db.tecrube.Remove(sil);
            }
            _db.SaveChanges();
            return RedirectToAction("TecrubeDetay", "Tecrube");
        }
    }
}