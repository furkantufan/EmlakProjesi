using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmlakProjesi.ModelView
{
    public class ozellikler
    {
        public string ilId { get; set; }
        public string ilceId { get; set; }
        public bool odasayisi1 { get; set; }
        public bool odasayisi2 { get; set; }
        public bool banyosayisi1 { get; set; }
        public bool banyosayisi2 { get; set; }
        public string minfiyat { get; set; }
        public string maxfiyat { get; set; }
        public string esyaId { get; set; }
        public string kategoriId { get; set; }

    }


    public class RootObject
    {
        public List<ozellikler> gelenOzellikler { get; set; }
    }
}