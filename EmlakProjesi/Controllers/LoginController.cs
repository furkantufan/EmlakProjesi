using EmlakProjesi.Models;
using EmlakProjesi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Mvc; 
using EmlakProjesi.ModelView;
using EmlakProjesi.Database;
using Newtonsoft.Json;
using System.Diagnostics;
using System.Configuration;
using System.Web.Security;
using System.Web;

namespace Emlak.Controllers
{
    public class LoginController : Controller
    {
        Model1 m1 = new Model1();
        // GET: Home
        public ActionResult Index()
        {
            Session.Abandon();
            setIlIlceList();
            return View();
        }

        public ActionResult UyeKayit()
        {
            UyeKayitModel UyeModel = new UyeKayitModel();
            setIlIlceList();
            return View(UyeModel);
        }

        private void setIlIlceList()
        {

            List<IL> Iller = new List<IL>();
            Iller = m1.IL.ToList();
            
            List<ILCE> Ilceler = new List<ILCE>();
            Ilceler = m1.ILCE.ToList();

            ViewBag.Iller = new SelectList(Iller, "ID", "ADI");
            ViewBag.Ilceler = new SelectList(Ilceler, "ID", "ADI");
        }

        [HttpPost]
        public JsonResult GetCityAreas(int cityId)
        {
            List<ILCE> Ilceler = new List<ILCE>();
            
            Ilceler = m1.ILCE.Where(x => x.IL_ID == cityId).ToList();
            Debug.WriteLine("sayisayi:" + Ilceler.Count);

            string json = JsonConvert.SerializeObject(Ilceler, Formatting.None,
                        new JsonSerializerSettings()
                        {
                            ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                        });
           
            return Json(json, JsonRequestBehavior.AllowGet);

            

        }


        public ActionResult UyeKayitAction(UyeKayitModel _UyeModel)
        {
            DbBaglanti dbBaglanti = new DbBaglanti();
            // store procedure
            DataTable dtResult = dbBaglanti.DataTableGetir("UYE_EKLE '" + _UyeModel.BireyselUye.AD + "','" + _UyeModel.BireyselUye.SOYAD + "','"
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

        /*** Kullanıcı Giriş Kontrolü ***/
        DbBaglanti dbEmlak = new DbBaglanti();

       [HttpPost]
        public ActionResult LoginAction(KULLANICI kullanici)
        {
            if (kullanici != null)
            {
                DataTable dt = dbEmlak.DataTableGetir("KULLANICI_KONTROL '" + kullanici.KULLANICI_ADI + "','" + kullanici.SIFRE + "'");

                Model1 m = new Model1();
                Boolean x = false;
             

                if (dt.Rows.Count > 0)
                {
                    string ka = dt.Rows[0]["KULLANICI_ADI"].ToString();
                    Session["yetkiId"] = dt.Rows[0]["YETKI_ID"];
                    KULLANICI Kullanici = KULLANICI.GetKullanici();
                    Kullanici.UYE_ID = Convert.ToInt32(dt.Rows[0]["UYE_ID"].ToString());
                    Kullanici.KULLANICI_ADI = dt.Rows[0]["KULLANICI_ADI"].ToString();
                    Kullanici.SIFRE = dt.Rows[0]["SIFRE"].ToString();
                    Kullanici.YETKI_ID = Convert.ToInt32(dt.Rows[0]["YETKI_ID"].ToString());
                    
                    return RedirectToAction("Index", "Home");

                }
                else
                {
                    ViewData["result"] = "Kullanıcı Bulunamadı";
                }
            }
            return View("Index");
        }



       



    }
}