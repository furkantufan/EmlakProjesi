 using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace EmlakProjesi.Security
{
    public class AdminYetkisi :ActionFilterAttribute
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
         int x = 0;
         x = Convert.ToInt32(filterContext.HttpContext.Session["yetkiId"]);

          if (x==0 || x==1)
            {
                filterContext.HttpContext.Response.Redirect("/Login/Index");
              
            }
        }
    }
}