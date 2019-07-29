using EmlakProjesi.Database;
using EmlakProjesi.Models;
using EmlakProjesi.ModelView;
using EmlakProjesi.Security;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace EmlakProjesi.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewData["SayfaBaslik"] = "Ana Sayfa";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            getAktifIlanlar();
            return View();

        }


        DbBaglanti db = new DbBaglanti();
       
        private void getAktifIlanlar()
        {
            //22.07.2019
            Model1 m = new Model1();
            
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
                          YAYIN_SURESI =I.YAYIN_SURESI.ToString(),
                          FIYAT = I.FIYAT.ToString(),
                          ACIKLAMA = I.ACIKLAMA

                      }).ToList();

            ViewBag.Ilanlar = Ilanlar;
        }
       
        private MenuModel getMenu(KULLANICI _Kullanici)
        {
            MenuModel menu = new MenuModel();
            menu.MenuList = new List<MenuModel>();

            if (_Kullanici.YETKI_ID == 1)// kullanıcı yetki
            {
                ViewData["Kullanici"] = _Kullanici.KULLANICI_ADI;
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "active"));
                menu.MenuList.Add(new MenuModel("İlan Ver", "place", "../IlanVer/Index", "passive"));
                menu.MenuList.Add(new MenuModel("İlan Ara", "place", "../IlanAra/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Talep Bildir", "notifications", "../IlanTakip/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Eşleşen Talepler", "place", "../EslesenTalep/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Profil", "person", "../Profil/Index", "passive"));
                
            }
            else if (_Kullanici.YETKI_ID == 2)// yonetici yetki
            {
               ViewData["Kullanici"] = _Kullanici.KULLANICI_ADI;
               menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "active"));
               menu.MenuList.Add(new MenuModel("İlan Onay", "place", "../IlanOnay/Index", "passive"));
               menu.MenuList.Add(new MenuModel("Kullanıcı Listele", "person", "../KullaniciListele/Index", "passive"));
            }
            else
            {
                ViewData["Kullanici"] = "Giriş Yap";
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "./Home/Index", "active"));
                menu.MenuList.Add(new MenuModel("İlan Ara", "place", "../IlanAra/Index", "passive"));
            }

            return menu;
        }
    }
}