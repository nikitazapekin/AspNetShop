using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebApplication5
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            // Игнорировать маршруты для Web Forms страниц
            routes.IgnoreRoute("Test.aspx");
            routes.IgnoreRoute("Default.aspx");
            routes.IgnoreRoute("Products.aspx");
            routes.IgnoreRoute("Register.aspx");

            // Игнорировать все .aspx файлы
            routes.IgnoreRoute("{*allaspx}", new { allaspx = @".*\.aspx(/.*)?" });

            // Web Forms маршруты ДО MVC маршрутов
            routes.MapPageRoute(
                "TestRoute",
                "test",
                "~/Test.aspx"
            );

            routes.MapPageRoute(
                "DefaultRoute",
                "",
                "~/Default.aspx"
            );

            routes.MapPageRoute(
                "ProductsRoute",
                "products",
                "~/Products.aspx"
            );

            routes.MapPageRoute(
                "RegisterRoute",
                "register",
                "~/Register.aspx"
            );

            // MVC маршруты ПОСЛЕ Web Forms маршрутов
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
/* using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebApplication5
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapPageRoute(
              "TestRoute",
              "test",
              "~/Test.aspx"
          );


        }
    }
}
*/