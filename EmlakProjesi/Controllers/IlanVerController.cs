using EmlakProjesi.Database;
using EmlakProjesi.Models;
using EmlakProjesi.ModelView;
using EmlakProjesi.Security;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Emlak.Controllers
{
  
    [KullanıcıYetkisi]
    public class IlanVerController : Controller
    {
       
        public ActionResult Index(string lat, string lon)
        {
            ViewData["SayfaBaslik"] = "İLAN TALEP";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            ViewBag.Menu = menu.MenuList;
            setIlIlceList();
            setKategoriList();
            setKonutTipList();
            setCepheList();
            setIsinmaTipList();
            if (lat != null && lon != null)
            {
                ILAN.LATITUDE = lat;
                ILAN.LONGITUDE = lon;
            }
            return View(IlanKayitModel.GetIlanKayit());
        }

        public ActionResult IlanKonum()
        {
            ViewData["SayfaBaslik"] = "İLAN KONUM";
            MenuModel menu = getMenu(KULLANICI.GetKullanici());
            ViewBag.Menu = menu.MenuList;
            ViewBag.Menu = menu.MenuList;
            return View();
        }


        [HttpPost]
        public ActionResult IlanTalep(IlanKayitModel _IlanKayitModel, string txtYayinSuresi, HttpPostedFileBase file)
        {
            string FileName = "Default_Emlak.png";
            if (file != null)
            {
                string pic = System.IO.Path.GetFileName(file.FileName);
                string path = System.IO.Path.Combine(
                Server.MapPath("~/Resources/Images"), pic);
                file.SaveAs(path);
                using (MemoryStream ms = new MemoryStream())
                {
                    file.InputStream.CopyTo(ms);
                    byte[] array = ms.GetBuffer();
                }
                FileName = file.FileName;
            }

            _IlanKayitModel.Ilan.YAYIN_SURESI = Convert.ToDateTime(txtYayinSuresi);
        
            int uye_id = KULLANICI.GetKullanici().UYE_ID;

            SqlParameter param1 = new SqlParameter("@UYE_ID", uye_id);
            SqlParameter param2 = new SqlParameter("@IL_ID", _IlanKayitModel.Adres.IL_ID);
            SqlParameter param3 = new SqlParameter("@ILCE_ID", _IlanKayitModel.Adres.ILCE_ID);
            SqlParameter param4 = new SqlParameter("@MAHALLE", "");
            SqlParameter param5 = new SqlParameter("@DETAY ", _IlanKayitModel.Adres.DETAY);
            SqlParameter param6 = new SqlParameter("@CEPHE_ID", _IlanKayitModel.Ilan.CEPHE_ID);
            SqlParameter param7 = new SqlParameter("@KATEGORI_ID", _IlanKayitModel.Ilan.KATEGORI_ID);
            SqlParameter param8 = new SqlParameter("@KONUT_TIP_ID", _IlanKayitModel.Ilan.KONUT_TIP_ID);
            SqlParameter param9 = new SqlParameter("@ISINMA_TIP_ID", _IlanKayitModel.Ilan.ISINMA_TIP_ID);
            SqlParameter param10 = new SqlParameter("@BASLIK", _IlanKayitModel.Ilan.BASLIK);
            SqlParameter param11 = new SqlParameter("@YAYIN_SURESI", _IlanKayitModel.Ilan.YAYIN_SURESI);
            SqlParameter param12 = new SqlParameter("@FIYAT", _IlanKayitModel.Ilan.FIYAT);
            SqlParameter param13 = new SqlParameter("@BINA_YASI", _IlanKayitModel.Ilan.BINA_YASI);
            SqlParameter param14 = new SqlParameter("@ODA_SAYISI", _IlanKayitModel.Ilan.ODA_SAYISI);
            SqlParameter param15 = new SqlParameter("@SALON_SAYISI", _IlanKayitModel.Ilan.SALON_SAYISI);
            SqlParameter param16 = new SqlParameter("@BANYO_SAYISI", _IlanKayitModel.Ilan.BANYO_SAYISI);
            SqlParameter param17 = new SqlParameter("@M2", _IlanKayitModel.Ilan.M2);
            SqlParameter param18 = new SqlParameter("@ESYALI", _IlanKayitModel.Ilan.ESYALI);
            SqlParameter param19 = new SqlParameter("@ACIKLAMA", _IlanKayitModel.Ilan.ACIKLAMA);
            SqlParameter param20 = new SqlParameter("@KOORDINAT_X", ILAN.LATITUDE);
            SqlParameter param21 = new SqlParameter("@KOORDINAT_Y", ILAN.LONGITUDE);
            SqlParameter param22 = new SqlParameter("@RESIM", FileName);

            try
            {
                Model1 m = new Model1();
                int result = m.Database.ExecuteSqlCommand("ILAN_TALEP  @UYE_ID, @IL_ID, @ILCE_ID,@MAHALLE,@DETAY,@CEPHE_ID,@KATEGORI_ID,@KONUT_TIP_ID,@ISINMA_TIP_ID,@BASLIK,@YAYIN_SURESI,@FIYAT,@BINA_YASI,@ODA_SAYISI,@SALON_SAYISI,@BANYO_SAYISI,@M2,@ESYALI,@ACIKLAMA,@KOORDINAT_X,@KOORDINAT_Y,@RESIM", param1,
                param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,
                param15,param16,param17,param18,param19,param20,param21,param22);

                if (result > 0)
                    return RedirectToAction("Index", "Home");

                else
                    return RedirectToAction("Index", "IlanVer");
            }
            catch(Exception)
            {
                return RedirectToAction("Index", "Error");
            }
   
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

        private void setKategoriList()
        {
            Model1 model1 = new Model1();
            List<KATEGORI> Kategori = new List<KATEGORI>();
            Kategori = model1.KATEGORI.ToList();
            ViewBag.Kategoriler = new SelectList(Kategori, "ID", "ADI");
        }

        private void setKonutTipList()
        {
            Model1 model1 = new Model1();
            List<KONUT_TIP> KonutTipleri = new List<KONUT_TIP>();
            KonutTipleri = model1.KONUT_TIP.ToList();
            ViewBag.KonutTipleri = new SelectList(KonutTipleri, "ID", "TIPI");
        }

        private void setCepheList()
        {
            Model1 model1 = new Model1();
            List<CEPHE> Cepheler = new List<CEPHE>();
            Cepheler = model1.CEPHE.ToList();
            ViewBag.Cepheler = new SelectList(Cepheler, "ID", "ADI");
        }

        private void setIsinmaTipList()
        {
            Model1 model1 = new Model1();
            List<ISINMA_TIP> IsinmaTipleri = new List<ISINMA_TIP>();
            IsinmaTipleri = model1.ISINMA_TIP.ToList();
            ViewBag.IsinmaTipleri = new SelectList(IsinmaTipleri, "ID", "TIPI");
        }

        private MenuModel getMenu(KULLANICI _Kullanici)
        {
            MenuModel menu = new MenuModel();
            menu.MenuList = new List<MenuModel>();

            if (_Kullanici.YETKI_ID == 1)
            {
                ViewData["Kullanici"] = _Kullanici.KULLANICI_ADI;
                menu.MenuList.Add(new MenuModel("Ana Sayfa", "home", "../Home/Index", "passive"));
                menu.MenuList.Add(new MenuModel("İlan Ver", "place", "../IlanVer/Index", "active"));
                menu.MenuList.Add(new MenuModel("İlan Ara", "place", "../IlanAra/Index", "passive"));
                menu.MenuList.Add(new MenuModel("Talep Bildir", "notifications", "../IlanTakip/Index", "passive"));
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

    }
}