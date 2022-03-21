using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCMyWebSite.Models.DTO.CurrencyApiModel
{
    public class CryptoCurrency
    {
        public string symbol { get; set; }
        public string price { get; set; }
    }
}