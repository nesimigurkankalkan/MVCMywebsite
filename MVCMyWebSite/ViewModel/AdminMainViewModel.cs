using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCMyWebSite.Models;

namespace MVCMyWebSite.ViewModel
{
    public class AdminMainViewModel
    {
        public BenKimimViewModel GetAllBenKimim { get; set; }
        public List<iletisim> GetAlliletisim { get; set; }
    }
}