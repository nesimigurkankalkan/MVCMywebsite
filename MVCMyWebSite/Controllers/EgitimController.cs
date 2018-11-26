using MVCMyWebSite.Models;
using MVCMyWebSite.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCMyWebSite.Controllers
{
    public class EgitimController : Controller
    {
        mysiteEntities _db = new mysiteEntities();
        public ActionResult EgitimDetay()
        {
            var model = _db.egitim.ToList();
            return View(model);
        }
        public ActionResult EgitimProcess(int ?id)
        {
            if (id==null)
            {
                return View();
            }
            else
            {
                var egitim1 = _db.egitim.Find(id);
                EgitimViewModel egitimmodel = new EgitimViewModel();
                egitimmodel.egitim = egitim1;
                return View("EgitimProcess", egitimmodel);
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EgitimEkleGuncelle(EgitimViewModel Item)
        {
            if (Item.egitim.id == 0)
            {
                _db.egitim.Add(Item.egitim);
            }
            else
            {
                var guncellenecekveri = _db.egitim.Find(Item.egitim.id);
                if (guncellenecekveri == null)
                {
                    return HttpNotFound();
                }
                guncellenecekveri.baslik = Item.egitim.baslik;
                guncellenecekveri.uzunyazi = Item.egitim.uzunyazi;
            }
            _db.SaveChanges();
            return RedirectToAction("EgitimDetay", "Egitim");
        }
        public ActionResult DeleteFromTab(int id)
        {
            var sil = _db.egitim.Find(id);
            if (sil == null)
                return HttpNotFound();
            else
            {
                _db.egitim.Remove(sil);
            }
            _db.SaveChanges();
            return RedirectToAction("EgitimDetay", "Egitim");
        }
    }
}