using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCMyWebSite.ViewModel.User
{
    public class LoginVM
    {
        public int ID { get; set; }
        public string KullaniciAdi { get; set; }
        public string KullaniciMail { get; set; }
    }
}