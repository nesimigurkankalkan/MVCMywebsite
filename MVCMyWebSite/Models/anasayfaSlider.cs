//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MVCMyWebSite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class anasayfaSlider
    {
        public int ID { get; set; }
        public string SliderBaslik { get; set; }
        public string SliderAciklama { get; set; }
        public string SliderImage { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<System.DateTime> SliderOlusturmaTarihi { get; set; }
        public Nullable<System.DateTime> SliderGuncellemeTarihi { get; set; }
        public Nullable<byte> SliderSirasi { get; set; }
        public Nullable<bool> Active { get; set; }
    }
}
