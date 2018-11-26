using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCMyWebSite.Models;
using MVCMyWebSite.Models.DTO;

namespace MVCMyWebSite.ViewModel
{
    public class MainViewModel
    {
        public List<anasayfaSlider> SectionOneAnsayfa { get; set; }
        public List<benkimim> SectionTwoBenKimim { get; set; }
        public List<hizmetler> SectionThreeBenKimim { get; set; }
        public List<yetenekler> SectionFourYetenekBilgileri { get; set; }
        public List<egitim> SectionFiveEgitimBilgileri { get; set; }
        public List<tecrube> SectionSixTecrubeBilgileri { get; set; }
        public IletisimKisiselViewModel SectionEightIletisimveKisisel { get; set; }
        public List<News> News { get; set; }
    }
}