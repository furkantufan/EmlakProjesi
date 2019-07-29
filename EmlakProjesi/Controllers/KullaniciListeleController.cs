using EmlakProjesi.Database;
using EmlakProjesi.Models;
using EmlakProjesi.ModelView;
using EmlakProjesi.Security;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmlakProjesi.Controllers
{
    [AdminYetkisi]
    public class KullaniciListeleController : Controller
    {
        DbBaglanti db = new DbBaglanti();
        public ActionResult Index()
        {
            ViewData["SayfaBaslik"] = "KULLANICI LİSTESİ";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            ViewBag.Menu = menu.MenuList;
            setAktifKullanici();
            setPasifKullanici();
            return View();
        }
        public ActionResult KullaniciIslem(string id, string islem)
        {
            db.DataTableGetir("UPDATE [EMLAK].[dbo].[UYE] SET UYE_DURUMU='" + islem + "' WHERE ID='" + id + "'");

            return RedirectToAction("Index", "KullaniciListele");
        }

        private MenuModel getMenu(KULLANICI _Kullanici)
        {
            MenuModel menu = new MenuModel();
            menu.MenuList = new List<MenuModel>();

            if (_Kullanici.YETKI_ID == 1)// kullanıcı
            {
                ViewData["Kullanici"] = _Kullanici.KULLANICI_ADI;
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "active"));
                menu.MenuList.Add(new MenuModel("İlan Ver", "place", "../IlanVer/Index", "passive"));
                menu.MenuList.Add(new MenuModel("İlan Ara", "place", "../IlanAra/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Talep Bildir", "notifications", "../IlanTakip/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Eşleşen Talepler", "place", "../EslesenTalep/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Profil", "person", "../Profil/Index", "passive"));
            }
            else if (_Kullanici.YETKI_ID == 2)//yonetici
            {
                ViewData["Kullanici"] = _Kullanici.KULLANICI_ADI;
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "passive"));
                menu.MenuList.Add(new MenuModel("İlan Onay", "place", "../IlanOnay/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Kullanıcı Listele", "person", "../KullaniciListele/Index", "active"));
            }
            else
            {
                ViewData["Kullanici"] = "Giriş Yap";
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "active"));
                menu.MenuList.Add(new MenuModel("İlan Ara", "place", "../IlanAra/Index", "passive"));
            }

            return menu;
        }

        private void setPasifKullanici()
        {
            //bu metod aktif kullanıcı bilgilerini çeker.
            // kullanici, uye, bireysel uye  ve yetki tablosunda join işlemi yapılmaktadır.
           
            Model1 m = new Model1();
            Boolean x = false;
            List<KullaniciListeModel> PasifKullanicilar = new List<KullaniciListeModel>();
            PasifKullanicilar = (from k in m.KULLANICI
                                 join u in m.UYE on k.UYE_ID equals u.UYE_ID
                                 join b in m.BIREYSEL_UYE on u.UYE_ID equals b.ID
                                 join y in m.YETKI on k.YETKI_ID equals y.ID
                                 where u.UYE_DURUMU == x
                                 select new KullaniciListeModel
                                 {
                                     ID = (u.ID),
                                     AD = (b.AD),
                                     SOYAD = (b.SOYAD),
                                     YETKI = (k.YETKI_ID).ToString(),
                                     KULLANICI_ADI = (k.KULLANICI_ADI),

                                 }).ToList();

            ViewBag.PasifKullanicilar = PasifKullanicilar;


           
        }

        private void setAktifKullanici()           
        {
            //bu metod aktif kullanıcı bilgilerini çeker.
            // kullanici, uye, bireysel uye  ve yetki tablosunda join işlemi yapılmaktadır.
           
            Model1 m = new Model1();
            Boolean x = true;
            List<KullaniciListeModel> AktifKullanicilar = new List<KullaniciListeModel>();
            AktifKullanicilar = (from k in m.KULLANICI
                        join u in m.UYE on k.UYE_ID equals u.UYE_ID
                        join b in m.BIREYSEL_UYE on u.UYE_ID equals b.ID
                        join y in m.YETKI on k.YETKI_ID equals y.ID
                        where u.UYE_DURUMU == x
                        select new KullaniciListeModel
                        {
                            ID =(u.ID),
                            AD = (b.AD),
                            SOYAD = (b.SOYAD),
                            YETKI = (k.YETKI_ID).ToString(),
                            KULLANICI_ADI = (k.KULLANICI_ADI),

                        }).ToList();

            ViewBag.AktifKullanicilar = AktifKullanicilar;
          
        }
    }
}