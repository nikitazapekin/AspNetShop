using System.Collections.Generic;
using System.Web.Mvc;
using WebApplication5.Models;

namespace WebApplication5.Controllers
{
    public class ProductsController : Controller
    {
  
        public ActionResult Index()
        {
          
            return View();
        }
 
        public ActionResult Card(int id)
        {
           

            return View();
        }
 
    }
}