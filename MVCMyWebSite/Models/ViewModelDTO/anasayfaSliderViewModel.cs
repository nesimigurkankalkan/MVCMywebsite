using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCMyWebSite.Models.ViewModelDTO
{
    public class anasayfaSliderViewModel
    {
        [Key]
        public int ID { get; set; }
        [StringLength(250)]
        public string SliderBaslik { get; set; }
        [StringLength(500)]
        public string SliderAciklama { get; set; }
        [StringLength(50)]
        public string SliderImage { get; set; }
        public int? UserID { get; set; }
        public DateTime? SliderOlusturmaTarihi { get; set; }
        public DateTime? SliderGuncellemeTarihi { get; set; }
        public byte? SliderSirasi { get; set; }
        public bool? Active { get; set; }
    }
}