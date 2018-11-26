using MVCMyWebSite.Models;
using MVCMyWebSite.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace MVCMyWebSite.Controllers
{
    public class AnasayfaController : Controller
    {
        mysiteEntities _db = new mysiteEntities();
        // GET: Anasayfa
        public ActionResult AnasayfaDetay()
        {
            var model = _db.anasayfaSlider.ToList();
            //AnasayfaSliderViewModel model = new AnasayfaSliderViewModel();
            //model.Anasayfa = _db.anasayfaSlider.ToList();

            return View(model);
        }
        public ActionResult AnasayfaProcess(int ?id)
        {
            if (id==null)
            {
                AnasayfaSliderViewModel model = new AnasayfaSliderViewModel();
                {
                    model.Anasayfa = new anasayfaSlider();
                }
                return View("AnasayfaProcess", model);
            }
            else
            {
                var anasayfa1 = _db.anasayfaSlider.Find(id);
                AnasayfaSliderViewModel anasayfaSlidermodel = new AnasayfaSliderViewModel();
                anasayfaSlidermodel.Anasayfa = anasayfa1;
                return View("AnasayfaProcess", anasayfaSlidermodel);
            }
            
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AnasayfaEkleGuncelle(AnasayfaSliderViewModel Item, HttpPostedFileBase uploadFile)
        {
            //var anasayfamodel = Item.Anasayfa;
            if (Item.Anasayfa.ID == 0)
            {
                if (uploadFile != null)
                {
                    string imgName = uploadFile.FileName;
                    var unaccentedText = String.Join("", imgName.Normalize(NormalizationForm.FormD).Where(c => char.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark));
                    unaccentedText = unaccentedText.Replace(' ', '_');
                    uploadFile.SaveAs(Server.MapPath("~/Content/slider/") + unaccentedText);
                    
                    Item.Anasayfa.SliderImage = "slider/" + uploadFile.FileName;
                    
                }
                Item.Anasayfa.Active = true;
                Item.Anasayfa.SliderOlusturmaTarihi = DateTime.Now;
                Item.Anasayfa.SliderGuncellemeTarihi = DateTime.Now;
                if (User.Identity.IsAuthenticated)
                {
                    Item.Anasayfa.UserID = Convert.ToInt32(User.Identity.Name);
                }
                else
                {

                }
                _db.anasayfaSlider.Add(Item.Anasayfa);
            }
            else
            {
                var guncellenecekveri = _db.anasayfaSlider.Find(Item.Anasayfa.ID);
                if (guncellenecekveri == null)
                {
                    return HttpNotFound();
                }
                //Else Dememizin anlamı yok çünkü returne giriyor
                guncellenecekveri.SliderBaslik = Item.Anasayfa.SliderBaslik;
                guncellenecekveri.SliderAciklama = Item.Anasayfa.SliderAciklama;
                guncellenecekveri.SliderGuncellemeTarihi = DateTime.Now;
                guncellenecekveri.SliderSirasi = Item.Anasayfa.SliderSirasi;
                if (uploadFile != null)
                {
                    string imgName = uploadFile.FileName;
                    var unaccentedText = String.Join("", imgName.Normalize(NormalizationForm.FormD).Where(c => char.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark));
                    unaccentedText = unaccentedText.Replace(' ', '_');
                    uploadFile.SaveAs(Server.MapPath("~/Content/slider/") + unaccentedText);

                    guncellenecekveri.SliderImage = "slider/" + uploadFile.FileName;
                }
            }
            _db.SaveChanges();

            return RedirectToAction("AnasayfaDetay");
        }
        public ActionResult DeleteFromTab(int id)
        {
            var sil = _db.anasayfaSlider.Find(id);
            string path = sil.SliderImage;
            string fullPath = Request.MapPath("~/Content/"+ path);
            
            if (sil == null)
            {
                return HttpNotFound();
            }
            else
            {
                if (System.IO.File.Exists(fullPath))
                {
                    System.IO.File.Delete(fullPath);
                }
                _db.anasayfaSlider.Remove(sil);
            }
            _db.SaveChanges();
            return RedirectToAction("AnasayfaDetay","Anasayfa");
        }



        public ActionResult SetDisable(int id)
        {
            //SliderData sd = new SliderData();
            //var model = sd.GetSlider(id);
            var model = _db.anasayfaSlider.FirstOrDefault(s => s.ID == id);
            model.Active = false;
            bool update = false;
            try
            {
                _db.Entry(model).State = EntityState.Modified;
                _db.SaveChanges();

                update = true;
            }
            catch (Exception)
            {
                throw;
            }

            TempData["Message"] = update ? "Başarılı" : "Başarısız";
            return RedirectToAction("AnasayfaDetay");
        }

        public ActionResult SetEnable(int id)
        {
            //SliderData sd = new SliderData();

            //var model = sd.GetSlider(id);
            var model = _db.anasayfaSlider.FirstOrDefault(s => s.ID == id);
            model.Active = true;
            bool update = false;
            try
            {
                _db.Entry(model).State = EntityState.Modified;
                _db.SaveChanges();

                update = true;
            }
            catch (Exception)
            {
                throw;
            }

            TempData["Message"] = update ? "Başarılı" : "Başarısız";
            return RedirectToAction("AnasayfaDetay");
        }
    }
}