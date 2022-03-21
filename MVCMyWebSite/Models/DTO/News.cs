using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCMyWebSite.Models.DTO
{
    public class News
    {
        public News()
        {

        }

        public string title { get; set; }
        public string description { get; set; }
        public List<Files> Files { get; set; }

    }
}