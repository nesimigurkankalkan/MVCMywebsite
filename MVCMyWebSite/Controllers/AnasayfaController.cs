using MVCMyWebSite.Models;
using MVCMyWebSite.Models.ViewModelDTO;
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
                    model.Anasayfa = new Models.ViewModelDTO.anasayfaSliderViewModel();
                }
                return View("AnasayfaProcess", model);
            }
            else
            {
                //var anasayfa1 = _db.anasayfaSlider.Find(id);
                var anasayfa1 = _db.anasayfaSlider.Where(x => x.ID == id).Select(x => new Models.ViewModelDTO.anasayfaSliderViewModel
                {
                    ID = x.ID, 
                    SliderBaslik = x.SliderBaslik,
                    SliderAciklama = x.SliderAciklama,
                    SliderImage = x.SliderImage,
                    UserID = x.UserID,
                    SliderOlusturmaTarihi = x.SliderOlusturmaTarihi,
                    SliderGuncellemeTarihi = x.SliderGuncellemeTarihi,
                    SliderSirasi = x.SliderSirasi,
                    Active = x.Active
                }).FirstOrDefault();
                AnasayfaSliderViewModel anasayfaSlidermodel = new AnasayfaSliderViewModel();
                anasayfaSlidermodel.Anasayfa = anasayfa1;
                //anasayfaSlidermodel.Anasayfa.SliderBaslik = anasayfa1.SliderBaslik;
                //anasayfaSlidermodel.Anasayfa.SliderAciklama = anasayfa1.SliderAciklama;
                //anasayfaSlidermodel.Anasayfa.SliderSirasi = anasayfa1.SliderSirasi;
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
                    int kullaniciID = _db.KULLANICILAR.Where(x => x.KULLANICIADI == User.Identity.Name).Select(x=> x.ID).FirstOrDefault();
                    Item.Anasayfa.UserID = kullaniciID;
                }
                else
                {

                }
                //_db.anasayfaSlider.Add(Item.Anasayfa);
                _db.anasayfaSlider.Add(new Models.anasayfaSlider() {SliderBaslik = Item.Anasayfa.SliderBaslik , SliderAciklama = Item.Anasayfa.SliderAciklama, SliderImage = Item.Anasayfa.SliderImage, SliderOlusturmaTarihi = Item.Anasayfa.SliderOlusturmaTarihi, SliderGuncellemeTarihi = Item.Anasayfa.SliderGuncellemeTarihi, SliderSirasi = Convert.ToByte(Item.Anasayfa.SliderSirasi), Active = Item.Anasayfa.Active } );
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
                guncellenecekveri.SliderSirasi = Convert.ToByte(Item.Anasayfa.SliderSirasi);
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