using EmlakProjesi.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EmlakProjesi.Models;
using System.Diagnostics;
using Newtonsoft.Json;
using System.Web.Services;
using System.Web.Helpers;
using System.Web.Script.Serialization;

namespace EmlakProjesi.Controllers
{

    public class IlanAraController : Controller
    {
        public ActionResult Index()
        {
            ViewData["SayfaBaslik"] = "TALEP BİLDİR";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            setIlIlceList();
            setKategoriList();
          
            return View();
        }

 

        private void setIlIlceList()
        {
            Model1 m2 = new Model1();
            List<IL> Iller = new List<IL>();
            Iller = m2.IL.ToList();
            List<ILCE> Ilceler = new List<ILCE>();
            Ilceler = m2.ILCE.ToList();
            ViewBag.Iller = new SelectList(Iller, "ID", "ADI"); ;
            ViewBag.Ilceler = new SelectList(Ilceler, "ID", "ADI");
        }

        private MenuModel getMenu(KULLANICI _Kullanici)
        {
            MenuModel menu = new MenuModel();
            menu.MenuList = new List<MenuModel>();

            if (_Kullanici.YETKI_ID == 1)
            {
                ViewData["Kullanici"] = _Kullanici.KULLANICI_ADI;
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "passive"));
                menu.MenuList.Add(new MenuModel("İlan Ver", "place", "../IlanVer/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Talep Bildir", "notifications", "../IlanTakip/Index", "active"));
                menu.MenuList.Add(new MenuModel("Eşleşen Talepler", "place", "../EslesenTalep/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Profil", "person", "../Profil/Index", "passive"));
            }
            else if (_Kullanici.YETKI_ID == 2)
            {
                ViewData["Kullanici"] = _Kullanici.KULLANICI_ADI;
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "active"));
                menu.MenuList.Add(new MenuModel("İlan Onay", "place", "../IlanOnay/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Kullanıcı Listele", "person", "../KullaniciListele/Index", "passive"));
            }
            else
            {
                ViewData["Kullanici"] = "Giriş Yap";
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "active"));
            }

            return menu;
        }

        public ActionResult IlanKonum()
        {
            ViewData["SayfaBaslik"] = "İLAN KONUM";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            ViewBag.Menu = menu.MenuList;
            return View();
        }

        private void setKategoriList()
        {
            Model1 model1 = new Model1();
            List<KATEGORI> Kategori = new List<KATEGORI>();
            Kategori = model1.KATEGORI.ToList();
            ViewBag.Kategoriler = new SelectList(Kategori, "ID", "ADI");
        }

        [HttpPost]
        public JsonResult AktifIlanlar(string[] gelenozellikler)
        {

            Model1 m = new Model1();

            int gelenild = Convert.ToInt32(gelenozellikler[0]);
            int gelenilceid = Convert.ToInt32(gelenozellikler[1]);
            int gelenodasayisi1 = 0, gelenodasayisi2 = 0;
            int gelenbanyosayisi1 = 0, gelenbanyosayisi2 = 0;

            if (gelenozellikler[2].Equals("true"))
                gelenodasayisi1 = 2;

            else
                gelenodasayisi1 = 0;


            if (gelenozellikler[3].Equals("true"))
                gelenodasayisi2 = 3;

            else
                gelenodasayisi2 = 0;


            if (gelenozellikler[4].Equals("true"))
                gelenbanyosayisi1 = 1;

            else
                gelenbanyosayisi1 = 0;


            if (gelenozellikler[5].Equals("true"))
                gelenbanyosayisi2 = 2;

            else
                gelenbanyosayisi2 = 0;


            int gelenminFiyat = Convert.ToInt32(gelenozellikler[6]);
            int gelenmaxfiyat = Convert.ToInt32(gelenozellikler[7]);

            string gelenesya = "";

            if (gelenozellikler[8].Equals("EVET"))
                gelenesya = "EVET";
            else
                gelenesya = "HAYIR";

            int gelenkategoriId = Convert.ToInt32(gelenozellikler[9]);
            Debug.WriteLine("GelenBilgiler--> İl ID: " + gelenild + " Ilce ID: " + gelenilceid + " Oda sayisi1: " + gelenodasayisi1 + " odasayisi2: " + gelenodasayisi2 + " Banyosayisi1: " + gelenbanyosayisi1 + " banyosayisi2: " + gelenbanyosayisi2 + " Minfiyat: " + gelenminFiyat + " Maxfiyat: " + gelenmaxfiyat + " Kategori Id: " + gelenkategoriId + " GelenEsya: " + gelenesya);


            List<IlanDashboard> Ilanlar = new List<IlanDashboard>();
            Ilanlar = (from I in m.ILAN
                       join adres in m.ADRES on I.ADRES_ID equals adres.ID
                       join k in m.KATEGORI on I.KATEGORI_ID equals k.ID
                       join uy in m.UYE on I.UYE_ID equals uy.ID
                       join b in m.BIREYSEL_UYE on uy.UYE_ID equals b.ID
                       join il in m.IL on adres.IL_ID equals il.ID
                       join ilce in m.ILCE on adres.ILCE_ID equals ilce.ID

                       where (I.DURUM_ID == 2)
                       select new IlanDashboard
                       {
                           ID = (I.ID),
                           AD = (b.AD),
                           SOYAD = (b.SOYAD),
                           IL = adres.IL.ADI,
                           ILCE = adres.ILCE.ADI,
                           KATEGORI = k.ADI,
                           BASLIK = I.BASLIK,
                           YAYIN_SURESI = I.YAYIN_SURESI.ToString(),
                           FIYAT = I.FIYAT.ToString(),
                           ACIKLAMA = I.ACIKLAMA

                       }).ToList();

            Debug.WriteLine("gonderilen liste boyutu: " + Ilanlar.Count);

            //ViewBag.x = Ilanlar;
            return Json(Ilanlar, JsonRequestBehavior.AllowGet);



        }

        [HttpPost]
        public JsonResult GetistenenOzellikler(string yenijson)
        {
            Debug.WriteLine("gelen eleman : " + yenijson);
            char[] ayrac = { ','};
            
            string[] parcalar = yenijson.Split(ayrac);
            

            for (int i = 0; i < 10; i++)
            {
                parcalar[i] = parcalar[i].Replace("[", "");
                parcalar[i] = parcalar[i].Replace("]", "");
                parcalar[i] = parcalar[i].Replace("\"", "");
            }


            AktifIlanlar(parcalar);

            return Json(yenijson, JsonRequestBehavior.AllowGet);

           
        }
      

       


    }
}




