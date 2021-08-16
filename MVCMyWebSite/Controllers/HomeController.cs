using MVCMyWebSite.Models;
using MVCMyWebSite.Models.ViewModelDTO;
using MVCMyWebSite.ViewModel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml;
using MVCMyWebSite.Models.DTO;
namespace MVCMyWebSite.Controllers
{
    [AllowAnonymous]
    public class CaptchaResult
    {
        [JsonProperty("success")]
        public bool Success { get; set; }
        [JsonProperty("error-codes")]
        public List<string> ErrorCodes { get; set; }
    }
    [AllowAnonymous]
    public class HomeController : Controller
    {
        mysiteEntities _db = new mysiteEntities();
        public ActionResult Index()
        {
            MainViewModel model = new MainViewModel();

            model.SectionOneAnsayfa = _db.anasayfaSlider.Where(r => r.Active == true).Select(x=> new Models.ViewModelDTO.anasayfaSliderViewModel 
            { 
                SliderBaslik = x.SliderBaslik,
                SliderAciklama = x.SliderAciklama,
                SliderImage = x.SliderImage,
                UserID = x.UserID,
                SliderOlusturmaTarihi = x.SliderOlusturmaTarihi,
                SliderGuncellemeTarihi = x.SliderGuncellemeTarihi,
                SliderSirasi = x.SliderSirasi,
                Active = x.Active
            
            }) .ToList();
            model.SectionTwoBenKimim = _db.benkimim.ToList();
            model.SectionThreeBenKimim = _db.hizmetler.ToList();
            model.SectionFourYetenekBilgileri = _db.yetenekler.ToList();
            model.SectionFiveEgitimBilgileri = _db.egitim.ToList();
            model.SectionSixTecrubeBilgileri = _db.tecrube.ToList();

            IletisimKisiselViewModel iletisimKisiselViewModel = new IletisimKisiselViewModel();
            var kisisel = _db.kisisel.FirstOrDefault();
            if (kisisel != null)
            {
                iletisimKisiselViewModel.email = kisisel.email;
                iletisimKisiselViewModel.il = kisisel.il;
                iletisimKisiselViewModel.ilce = kisisel.ilce;
                iletisimKisiselViewModel.telefon = kisisel.telefon;
            }
            model.SectionEightIletisimveKisisel = iletisimKisiselViewModel;

            model.News = GetApiData();

            //Bu kod sadece Sessionı goturuyor ama istenildiği takdirde modelide gonderip çalıştırabılıyorsun Tek tablo olması halinde
            var anasayfaModel = _db.anasayfaSlider.FirstOrDefault();
            if (anasayfaModel != null)
                Session["Myname"] = anasayfaModel.SliderBaslik;

            //string today = "http://www.tcmb.gov.tr/kurlar/today.xml";

            //var xmlDoc = new XmlDocument();
            //xmlDoc.Load(today);

            //string USD_Alis = xmlDoc.SelectSingleNode("Tarih_Date/Currency[@Kod='USD']/BanknoteBuying").InnerXml;
            //string USD_Satis = xmlDoc.SelectSingleNode("Tarih_Date/Currency[@Kod='USD']/BanknoteSelling").InnerXml;

            //string EURO_Alis = xmlDoc.SelectSingleNode("Tarih_Date/Currency[@Kod='EUR']/BanknoteBuying").InnerXml;
            //string EURO_Satis = xmlDoc.SelectSingleNode("Tarih_Date/Currency[@Kod='EUR']/BanknoteSelling").InnerXml;

            //ViewBag.usdalis = USD_Alis;
            //ViewBag.usdsatis = USD_Satis;

            //ViewBag.euroalis = EURO_Alis;
            //ViewBag.eurosatis = EURO_Satis;
            //örnek


            //ViewData["ansayfa"] = anasayfaModel;
            //ViewData["bnkimim"] = _db.benkimim.ToList();
            //ViewData["hzmetlerim"] = _db.hizmetler.ToList();
            //ViewData["yteneklerim"] = _db.yetenekler.ToList();
            //ViewData["eitimilerim"] = _db.egitim.ToList();
            //ViewData["tcrubelerim"] = _db.tecrube.ToList();
            //ViewData["ksisel"] = iletisimKisiselViewModel;


            ViewBag.Data = GetApiData();


            return View(model);
        }

        [HttpPost]
        public ActionResult Ekle(IletisimKisiselViewModel viewModel)
        {



            string bilgisayarAdi = Dns.GetHostName();
            string internalip = Dns.GetHostByName(bilgisayarAdi).AddressList[0].ToString();
            string externalip = new WebClient().DownloadString("http://icanhazip.com");
            string mac = "";
            foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
            {
                if (nic.OperationalStatus == OperationalStatus.Up && (!nic.Description.Contains("Virtual") && !nic.Description.Contains("Pseudo")))
                {
                    if (nic.GetPhysicalAddress().ToString() != "")
                    {
                        mac = nic.GetPhysicalAddress().ToString();
                    }
                }
            }

            char[] karakterler = mac.ToCharArray();
            if (karakterler.Length == 12)
            {
                mac = karakterler[0].ToString() + karakterler[1].ToString() + ":" +
                karakterler[2].ToString() + karakterler[3].ToString() + ":" + karakterler[4].ToString() +
                karakterler[5].ToString() + ":" + karakterler[6].ToString() + karakterler[7].ToString() + ":" + karakterler[8].ToString() +
                karakterler[9].ToString() + ":" + karakterler[10].ToString() + karakterler[11].ToString();
            }

            //ReCaptcha Baslangıç

            var captcha = Request.Form["g-recaptcha-response"];

            const string secret = "6LeJkpcUAAAAAPY1qQGhwLJIWJ78zmcfZpHcZVG7";

            var restUrl = string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secret, captcha);

            WebRequest req = WebRequest.Create(restUrl);
            HttpWebResponse resp = req.GetResponse() as HttpWebResponse;

            JsonSerializer serializer = new JsonSerializer();

            CaptchaResult result = null;

            using (var reader = new StreamReader(resp.GetResponseStream()))
            {
                string resultObject = reader.ReadToEnd();
                result = JsonConvert.DeserializeObject<CaptchaResult>(resultObject);
            }
            int success = 0; string resultMessage = "";
            try
            {
                if (!result.Success)
                {
                    ModelState.AddModelError("", "captcha mesajınız hatalı");
                    if (result.ErrorCodes != null)
                    {
                        ModelState.AddModelError("", result.ErrorCodes[0]);
                    }
                    TempData["Message"] = "Mesajınız Gönderilemedi! Lütfen Onay Kutusunu İşaretleyiniz.";
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.Message = "Kayıt Başarılı.";
                    resultMessage = "Kayıt Başarılı";
                    var all = new iletisim
                    {
                        name = viewModel.iName,
                        email = viewModel.iEmail,
                        topic = viewModel.iSubject,
                        message = viewModel.iMsg,
                        pcname = bilgisayarAdi,
                        lanip = internalip,
                        wanip = externalip,
                        macadress = mac
                    };

                    _db.iletisim.Add(all);
                    _db.SaveChanges();

                    success = 1; resultMessage = "Kayıt Başarılı";
                    TempData["Message"] = "Mesajınız Gönderildi.";
                    return RedirectToAction("Index", "Home");
                }
            }
            catch (Exception exp)
            {
                resultMessage = exp.Message;
            }
            return View();
        }
        //[System.Web.Services.WebMethod]
        [HttpPost]
        public JsonResult kurgetir()
        {
            string USD_Alis = "",
                   USD_Satis = "",
                   EURO_Alis = "",
                   EURO_Satis = "";
            int success = 0;
            try
            {
                string today = "http://www.tcmb.gov.tr/kurlar/today.xml";

                var xmlDoc = new XmlDocument();
                xmlDoc.Load(today);

                USD_Alis = xmlDoc.SelectSingleNode("Tarih_Date/Currency[@Kod='USD']/ForexBuying").InnerXml;
                USD_Satis = xmlDoc.SelectSingleNode("Tarih_Date/Currency[@Kod='USD']/ForexSelling").InnerXml;

                EURO_Alis = xmlDoc.SelectSingleNode("Tarih_Date/Currency[@Kod='EUR']/ForexBuying").InnerXml;
                EURO_Satis = xmlDoc.SelectSingleNode("Tarih_Date/Currency[@Kod='EUR']/ForexSelling").InnerXml;

                if (xmlDoc != null)
                    success = 1;
            }
            catch (Exception)
            {
            }

            return Json(new
            {
                succeed = success,
                usal = USD_Alis,
                ussat = USD_Satis,
                eual = EURO_Alis,
                eusat = EURO_Satis
            });
        }
        private List<News> GetApiData()
        {
            var apiUrl = "https://api.hurriyet.com.tr/v1/articles?apikey=4e31e7f09adc48e1acdf7962f3d88ef0";
            string json;
            List<News> jsonList = new List<News>();
            try
            {
                //ConnectApi
                Uri url = new Uri(apiUrl);
                WebClient client = new WebClient();
                client.Encoding = System.Text.Encoding.UTF8;
                json = client.DownloadString(url);
                //END
                //JSON Parse START
                JavaScriptSerializer ser = new JavaScriptSerializer();
                jsonList = ser.Deserialize<List<News>>(json);
            }
            catch (Exception)
            {

            }

            
            return jsonList;
        }

    }
}