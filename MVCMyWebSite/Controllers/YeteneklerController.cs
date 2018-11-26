using MVCMyWebSite.Models;
using MVCMyWebSite.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCMyWebSite.Controllers
{
    public class YeteneklerController : Controller
    {
        mysiteEntities _db = new mysiteEntities(); 
        public ActionResult YeteneklerDetay()
        {
            var model = _db.yetenekler.ToList();
            return View(model);
        }
        public ActionResult YeteneklerProcess(int ?id)
        {
            if (id == null)
                return View();
            else
            {
                var yetenekler1 = _db.yetenekler.Find(id);
                YeteneklerViewModel yeteneklermodel = new YeteneklerViewModel();
                yeteneklermodel.yetenekler = yetenekler1;
                return View("YeteneklerProcess", yeteneklermodel);
            }
            
        }
        [HttpPost]
        public ActionResult YeteneklerEkleGuncelle(YeteneklerViewModel Item)
        {
            if (Item.yetenekler.id == 0)
            {
                //BenKimimViewModel benkimimmodel = new BenKimimViewModel();
                //benkimimmodel.benkimim = Items.benkimim;
                _db.yetenekler.Add(Item.yetenekler);
            }
            else
            {
                var guncellenecekveri = _db.yetenekler.Find(Item.yetenekler.id);
                if (guncellenecekveri == null)
                {
                    return HttpNotFound();
                }
                //Else Dememizin anlamı yok çünkü returne giriyor
                guncellenecekveri.baslik = Item.yetenekler.baslik;
                guncellenecekveri.deger = Item.yetenekler.deger;
            }
            _db.SaveChanges();
            return RedirectToAction("YeteneklerDetay", "Yetenekler");
        }
        public ActionResult DeleteFromTab(int id)
        {
            var sil = _db.yetenekler.Find(id);
            if (sil == null)
                return HttpNotFound();
            else
            {
                _db.yetenekler.Remove(sil);
            }
            _db.SaveChanges();
            return RedirectToAction("YeteneklerDetay","Yetenekler");
        }

    }
}