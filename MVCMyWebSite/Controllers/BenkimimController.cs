using MVCMyWebSite.Models;
using MVCMyWebSite.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCMyWebSite.Controllers
{
    public class BenkimimController : Controller
    { 
        mysiteEntities _db = new mysiteEntities();

        // GET: Benkimim
        public ActionResult BenkimimDetay()
        {
         //   AdminMainViewModel model = new AdminMainViewModel();
            BenKimimViewModel benkimimmodel = new BenKimimViewModel();
          //  var benkimimliste = _db.benkimim.ToList();
            var benkimim = _db.benkimim.FirstOrDefault();
            //if(benkimim != null)
            //{
            //    benkimimmodel.benkimim.id = benkimim.id;
            //    benkimimmodel.benkimim.baslik = benkimim.baslik;
            //    benkimimmodel.benkimim.uzunyazi = benkimim.uzunyazi;
            //}

            benkimimmodel.benkimim = benkimim;
            //  model.GetAllBenKimim = benkimimmodel;

            var model = _db.benkimim.ToList();

            return View(model);
        }
        public ActionResult BenkimimProcess(int ?id)
        {
            if (id==null)
            {
                return View();
            }
            else
            {
            var benkimim1 = _db.benkimim.Find(id);
            BenKimimViewModel benkimimmodel = new BenKimimViewModel();
            benkimimmodel.benkimim = benkimim1;
            return View("BenkimimProcess", benkimimmodel);
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult BenkimimEkleGuncelle(BenKimimViewModel Items)
        {
            if (Items.benkimim.id == 0)
            {
                //BenKimimViewModel benkimimmodel = new BenKimimViewModel();
                //benkimimmodel.benkimim = Items.benkimim;
               _db.benkimim.Add(Items.benkimim);
            }
            else
            {
                var guncellenecekveri = _db.benkimim.Find(Items.benkimim.id);
                if (guncellenecekveri == null)
                {
                    return HttpNotFound();
                }
                //Else Dememizin anlamı yok çünkü returne giriyor
                    guncellenecekveri.baslik = Items.benkimim.baslik;
                    guncellenecekveri.uzunyazi = Items.benkimim.uzunyazi;
            }
            _db.SaveChanges();
            return RedirectToAction("BenkimimDetay", "Benkimim");
        }
        public ActionResult DeleteFromTab(int id)
        {
            var sil = _db.benkimim.Find(id);
            if (sil == null)
                return HttpNotFound();
            else
            {
                _db.benkimim.Remove(sil);
            }
            _db.SaveChanges();
            return RedirectToAction("BenkimimDetay", "Benkimim");
        }

    }
}