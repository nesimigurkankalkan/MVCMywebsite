using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MVCMyWebSite.Models;
using System.Web.Security;
using System.Web.Script.Serialization;
using MVCMyWebSite.ViewModel.User;

namespace MVCMyWebSite.Controllers
{
    public class KULLANICILARController : Controller
    {
        private mysiteEntities db = new mysiteEntities();
        [AllowAnonymous]
        public ActionResult GIRIS()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public ActionResult GIRIS(KULLANICILAR Model)
        {
            if (ModelState.IsValid)
            {

            
                    var User = db.KULLANICILAR.FirstOrDefault(x => x.KULLANICIADI == Model.KULLANICIADI && x.SIFRE == Model.SIFRE);
                    
                    if (User != null)
                    {
                    //Http Cookie ile Session Aç
                    //JavaScriptSerializer js = new JavaScriptSerializer();
                    //LoginVM usr = new LoginVM
                    //{
                    //    ID = User.ID,
                    //    KullaniciAdi = User.KULLANICIADI,
                    //    KullaniciMail = User.EMAIL
                    //};
                    //var data = js.Serialize(usr);
                    //FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, User.EMAIL, DateTime.Now, DateTime.Now.AddMinutes(60), false, data);
                    //string encToken = FormsAuthentication.Encrypt(ticket);
                    //HttpCookie authoCookies = new HttpCookie(FormsAuthentication.FormsCookieName, encToken);
                    //HttpContext.Response.Cookies.Add(authoCookies);
                        //Session["KULLANICIADI"] = User.KULLANICIADI.ToUpper();
                        FormsAuthentication.SetAuthCookie(Model.KULLANICIADI, false);
                        if (User.KTURU_ID == 1)
                        {
                            return RedirectToAction("AdminPanel", "Admin", new { Area = "Administrator" });
                        }
                        else
                        {
                            return RedirectToAction("AdminPanel", "Admin");
                        }
                    }
                    else {
                        ViewBag.HATA = "KULLANICI ADI VEYA SIFRE YANLIS";
                        return View();
                    }
            }
            return View();

        }
        // GET: KULLANICILAR
        public ActionResult Index()
        {
            return View(db.KULLANICILAR.ToList());
        }

        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index","Home");
        }










        // GET: KULLANICILAR/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KULLANICILAR kULLANICILAR = db.KULLANICILAR.Find(id);
            if (kULLANICILAR == null)
            {
                return HttpNotFound();
            }
            return View(kULLANICILAR);
        }

        // GET: KULLANICILAR/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: KULLANICILAR/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,KULLANICIADI,SIFRE,EMAIL,TARIH")] KULLANICILAR kULLANICILAR)
        {
            if (ModelState.IsValid)
            {
                db.KULLANICILAR.Add(kULLANICILAR);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(kULLANICILAR);
        }

        // GET: KULLANICILAR/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KULLANICILAR kULLANICILAR = db.KULLANICILAR.Find(id);
            if (kULLANICILAR == null)
            {
                return HttpNotFound();
            }
            return View(kULLANICILAR);
        }

        // POST: KULLANICILAR/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,KULLANICIADI,SIFRE,EMAIL,TARIH")] KULLANICILAR kULLANICILAR)
        {
            if (ModelState.IsValid)
            {
                db.Entry(kULLANICILAR).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(kULLANICILAR);
        }

        // GET: KULLANICILAR/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KULLANICILAR kULLANICILAR = db.KULLANICILAR.Find(id);
            if (kULLANICILAR == null)
            {
                return HttpNotFound();
            }
            return View(kULLANICILAR);
        }

        // POST: KULLANICILAR/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            KULLANICILAR kULLANICILAR = db.KULLANICILAR.Find(id);
            db.KULLANICILAR.Remove(kULLANICILAR);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
