using MVCMyWebSite.Models;
using MVCMyWebSite.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCMyWebSite.Controllers
{
    public class HizmetlerController : Controller
    {
        mysiteEntities _db = new mysiteEntities();
        public ActionResult HizmetlerDetay()
        {
            //HizmetlerViewModel hizmetlermodel = new HizmetlerViewModel();
            var model = _db.hizmetler.ToList();

            return View(model);
        }
        public ActionResult HizmetlerProcess(int ?id)
        {
            if (id==null)
            {
                return View();
            }
            else
            {
                var hizmetler1 = _db.hizmetler.Find(id);
                HizmetlerViewModel hizmetlermodel = new HizmetlerViewModel();
                hizmetlermodel.hizmetler = hizmetler1;
                return View("HizmetlerProcess", hizmetlermodel);
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult HizmetlerEkleGuncelle(HizmetlerViewModel Items)
        {
            if (Items.hizmetler.id==0)
            {
                _db.hizmetler.Add(Items.hizmetler);
            }
            else
            {
                var guncellenecekveri = _db.hizmetler.Find(Items.hizmetler.id);
                if (guncellenecekveri == null)
                {
                    return HttpNotFound();
                }
                //Else Dememizin anlamı yok çünkü returne giriyor
                guncellenecekveri.baslik = Items.hizmetler.baslik;
                guncellenecekveri.uzunyazi = Items.hizmetler.uzunyazi;
            }
            _db.SaveChanges();
            return RedirectToAction("HizmetlerDetay", "Hizmetler");
        }
        public ActionResult DeleteFromTab(int id)
        {
            var sil = _db.hizmetler.Find(id);
            if (sil == null)
                return HttpNotFound();
            else
            {
                _db.hizmetler.Remove(sil);
            }
            _db.SaveChanges();
            return RedirectToAction("HizmetlerDetay", "Hizmetler");
        }
    }
}