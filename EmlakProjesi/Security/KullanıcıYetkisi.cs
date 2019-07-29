using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmlakProjesi.Security
{
    public class KullanıcıYetkisi : ActionFilterAttribute
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            int x = 0;
            x = Convert.ToInt32(filterContext.HttpContext.Session["yetkiId"]);

            if (x == 0 || x == 2)
            {
                filterContext.HttpContext.Response.Redirect("/Login/Index");

            }
        }
    }
}