using EmlakProjesi.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EmlakProjesi.Models;
using System.Data;
using EmlakProjesi.Database;
using EmlakProjesi.Security;

namespace EmlakProjesi.Controllers
{
    [KullanıcıYetkisi]
    public class IlanTakipController : Controller
    {
        DbBaglanti db = new DbBaglanti();
        public ActionResult Index(string lat, string lon)
        {
            ViewData["SayfaBaslik"] = "TALEP BİLDİR";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            ViewBag.Menu = menu.MenuList;
            setIlIlceList();
            getTakipListesi();
            if (lat != null && lon != null)
            {
                ILAN.LATITUDE = lat;
                ILAN.LONGITUDE = lon;
            }
            return View(new IlanTakipModel());
        }

        public ActionResult IlanKonum()
        {
            ViewData["SayfaBaslik"] = "TALEP KONUM";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            ViewBag.Menu = menu.MenuList;
            return View();
        }

        private void getTakipListesi()
        {
            //-------------------Entitiy framework------------------------
            Model1 m = new Model1();
            Boolean x = true;
            List<TakipListesiModel> TakipListesi = new List<TakipListesiModel>();
            TakipListesi = (from t in m.TAKIP
                                 join il in m.IL on t.IL_ID equals il.ID
                                 join ilce in m.ILCE on t.ILCE_ID equals ilce.ID
                                 where t.AKTIF == x
                                 select new TakipListesiModel
                                 {
                                     ID = (t.ID),
                                     IL = il.ADI,
                                     ILCE = ilce.ADI,
                                     DETAY =t.DETAY,
                                     KOORDINAT_X = t.KOORDINAT_X,
                                     KOORDINAT_Y = t.KOORDINAT_Y,

                                 }).ToList();

            ViewBag.TakipListesi = TakipListesi;

                       
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
                menu.MenuList.Add(new MenuModel("İlan Ara", "place", "../IlanAra/Index", "passive"));
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
                menu.MenuList.Add(new MenuModel("İlan Ara", "place", "../IlanAra/Index", "passive"));
            }

            return menu;
        }

        [HttpPost]
        public ActionResult TakipKayit(IlanTakipModel _IlanTakipModel)
        {
            DataTable dt = db.DataTableGetir("TAKIP_KAYIT @UYE_ID=" + KULLANICI.GetKullanici().UYE_ID + ",@IL_ID=" + _IlanTakipModel.Adres.IL_ID + ",@ILCE_ID=" +
                _IlanTakipModel.Adres.ILCE_ID + ",@DETAY ='" + _IlanTakipModel.Adres.DETAY + "',@KOORDINAT_X='" +
                ILAN.LATITUDE + "',@KOORDINAT_Y='" + ILAN.LONGITUDE + "'");
            return RedirectToAction("Index", "Home");
        }

       
        [HttpPost]
        public ActionResult TakipIslem(string id, string islem)
        {
            DataTable dt = db.DataTableGetir("UPDATE TAKIP SET AKTIF='" + islem + "' WHERE ID='" + id + "'");
            return RedirectToAction("Index", "IlanTakip");
        }


    }
}