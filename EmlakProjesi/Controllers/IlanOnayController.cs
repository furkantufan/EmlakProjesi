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
//22.07.2019 düzeltildi.
namespace Emlak.Controllers
{
    [AdminYetkisi]
    public class IlanOnayController : Controller
    {
       
        public ActionResult Index()
        {
            ViewData["SayfaBaslik"] = "İLAN ONAY";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            ViewBag.Menu = menu.MenuList;
            setIlanTalepleri();
            setOnaylananIlanlar();
            return View();
        }

       
        public ActionResult IlanOnay(string id, string islem)
        {
            db.DataTableGetir("UPDATE [EMLAK].[dbo].[ILAN] SET DURUM_ID='" + islem + "' WHERE ID='" + id + "'");
            return RedirectToAction("Index", "IlanOnay");
        }

        private MenuModel getMenu(KULLANICI _Kullanici)
        {
            MenuModel menu = new MenuModel();
            menu.MenuList = new List<MenuModel>();

            if (_Kullanici.YETKI_ID == 1)
            {
                ViewData["Kullanici"] = _Kullanici.KULLANICI_ADI;
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "active"));
                menu.MenuList.Add(new MenuModel("İlan Ver", "place", "../IlanVer/Index", "passive"));
                menu.MenuList.Add(new MenuModel("İlan Ara", "place", "../IlanAra/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Talep Bildir", "notifications", "../IlanTakip/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Eşleşen Talepler", "place", "../EslesenTalep/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Profil", "person", "../Profil/Index", "passive"));
             
            }
            else if (_Kullanici.YETKI_ID == 2)
            {
                ViewData["Kullanici"] = _Kullanici.KULLANICI_ADI;
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "passive"));
                menu.MenuList.Add(new MenuModel("İlan Onay", "place", "../IlanOnay/Index", "active"));
                menu.MenuList.Add(new MenuModel("Kullanıcı Listele", "person", "../KullaniciListele/Index", "passive"));
               
            }
            else
            {
                ViewData["Kullanici"] = "Giriş Yap";
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "active"));
                menu.MenuList.Add(new MenuModel("İlan Ara", "place", "../IlanAra/Index", "passive"));
            }

            return menu;
        }

        DbBaglanti db = new DbBaglanti();
        private void setIlanTalepleri()
        {
            Model1 m = new Model1();

            List<IlanTalepModel> TalepEdilenIlanlar = new List<IlanTalepModel>();
            TalepEdilenIlanlar = (from I in m.ILAN
                            join adres in m.ADRES on I.ADRES_ID equals adres.ID
                            join ilce in m.ILCE on adres.ILCE_ID equals ilce.ID
                            where I.DURUM_ID == 1
                            select new IlanTalepModel
                            {
                                ID = I.ID,
                                BASLIK = I.BASLIK,
                                IL = adres.IL.ADI,
                                ILCE = adres.ILCE.ADI,
                                DETAY = adres.DETAY,
                                YAYIN_SURESI = I.YAYIN_SURESI.ToString(),
                                FIYAT = I.FIYAT.ToString(),
                                KOORDINAT_X =I.KOORDINAT_X.ToString(),
                                KOORDINAT_Y = I.KOORDINAT_Y.ToString()

                            }).ToList();

            ViewBag.TalepEdilenIlanlar = TalepEdilenIlanlar;
        }

        private void setOnaylananIlanlar()
        {
            Model1 m = new Model1();
            List<IlanTalepModel> OnaylananIlanlar = new List<IlanTalepModel>();
            OnaylananIlanlar = (from I in m.ILAN
                                join adres in m.ADRES on I.ADRES_ID equals adres.ID
                                join ilce in m.ILCE on adres.ILCE_ID equals ilce.ID
                                where I.DURUM_ID == 2
                                select new IlanTalepModel
                                {
                                    ID = I.ID,
                                    BASLIK = I.BASLIK,
                                    IL = adres.IL.ADI,
                                    ILCE = adres.ILCE.ADI,
                                    DETAY = adres.DETAY,
                                    YAYIN_SURESI = I.YAYIN_SURESI.ToString(),
                                    FIYAT = I.FIYAT.ToString(),
                                    KOORDINAT_X = I.KOORDINAT_X.ToString(),
                                    KOORDINAT_Y = I.KOORDINAT_Y.ToString()

                                }).ToList();
            ViewBag.OnaylananIlanlar = OnaylananIlanlar;
        }

    }
}