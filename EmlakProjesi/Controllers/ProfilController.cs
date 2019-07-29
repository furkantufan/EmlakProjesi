using EmlakProjesi.Database;
using EmlakProjesi.Models;
using EmlakProjesi.ModelView;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Emlak.Controllers
{
    
    public class ProfilController : Controller
    {
        // GET: Profil
        public ActionResult Index()
        {
            ProfilModel profil = new ProfilModel();
            profil.Kullanici = KULLANICI.GetKullanici();
            getBireyselUye();
            setIlIlceList();
            ViewData["SayfaBaslik"] = "PROFİL";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            ViewBag.Menu = menu.MenuList;
            return View(profil);
        }

        public ActionResult ProfilGuncelle(ProfilModel _UyeModel)
        {
            DbBaglanti dbBaglanti = new DbBaglanti();
            DataTable dtResult = dbBaglanti.DataTableGetir("UYE_GUNCELLE " + KULLANICI.GetKullanici().UYE_ID + ",'" + _UyeModel.BireyselUye.AD + "','" + _UyeModel.BireyselUye.SOYAD + "','"
                + _UyeModel.BireyselUye.CINSIYET + "','" + _UyeModel.BireyselUye.TEL_NO + "'," + "'" + _UyeModel.BireyselUye.EMAIL + "','" +
                _UyeModel.BireyselUye.ADRES + "','" + _UyeModel.BireyselUye.IL_ID + "','" + _UyeModel.BireyselUye.ILCE_ID + "','" +
                _UyeModel.Kullanici.KULLANICI_ADI + "','" + _UyeModel.Kullanici.SIFRE + "'");
            if (dtResult.Rows[0]["RESULT"].ToString() == "KAYIT BAŞARILI")
            {
                ViewData["result"] = dtResult.Rows[0]["RESULT"].ToString();
                return View("Index");
            }
            else
            {
                ViewData["result"] = dtResult.Rows[0]["RESULT"].ToString();
                return View("UyeKayit");
            }
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
                menu.MenuList.Add(new MenuModel("Talep Bildir", "notifications", "../IlanTakip/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Eşleşen Talepler", "place", "../EslesenTalep/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Profil", "person", "../Profil/Index", "active"));
            }
            else if (_Kullanici.YETKI_ID == 2)
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

        private void setIlIlceList()
        {
            Model1 model1 = new Model1();
            List<IL> Iller = new List<IL>();
            List<ILCE> Ilceler = new List<ILCE>();

            Iller = model1.IL.ToList();
            Ilceler = model1.ILCE.ToList();

            ViewBag.Iller = new SelectList(Iller, "ID", "ADI");
            ViewBag.Ilceler = new SelectList(Ilceler, "ID", "ADI");
        }

        DbBaglanti dbEmlak = new DbBaglanti();
        private void getBireyselUye()
        {
            Model1 m = new Model1();

            List<BIREYSEL_UYE> BireyselUye = new List<BIREYSEL_UYE>();

            BireyselUye = (from uy in m.UYE
                           join b in m.BIREYSEL_UYE on uy.UYE_ID equals b.ID
                           from k in m.KULLANICI
                           where uy.ID ==  k.UYE_ID
                           select new { uy, b }).ToList().Select(c => new BIREYSEL_UYE(c.b.ID, c.b.AD, c.b.SOYAD, c.b.CINSIYET, c.b.TEL_NO, c.b.EMAIL, c.b.ADRES)
                           {
                               ID = c.b.ID,
                               AD = c.b.AD, 
                               SOYAD = c.b.SOYAD,
                               CINSIYET = c.b.CINSIYET,
                               TEL_NO = c.b.TEL_NO,
                               EMAIL = c.b.EMAIL,
                               ADRES = c.b.ADRES

                           }).ToList();

            
            ViewBag.BireyselUye = BireyselUye[0];
            
        }
    }
}