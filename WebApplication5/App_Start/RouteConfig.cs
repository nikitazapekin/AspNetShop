 
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

            routes.IgnoreRoute("Test.aspx");
            routes.IgnoreRoute("Default.aspx");
            routes.IgnoreRoute("Products.aspx");
            routes.IgnoreRoute("Register.aspx");
            routes.IgnoreRoute("{*allaspx}", new { allaspx = @".*\.aspx(/.*)?" });


         //  routes.MapPageRoute("HomepageRoute", "homepage", "~/Homepage.aspx");
           // routes.MapPageRoute("SignInRoute", "signin", "~/SignIn.aspx");
           // routes.MapPageRoute("SignUp", "signup", "~/SignUp.aspx");
         

            // Сначала определяем конкретные маршруты для MVC
            routes.MapRoute(
                name: "ProductsCard",
                url: "products/card/{id}",
                defaults: new { controller = "Products", action = "Card", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Products",
                url: "products",
                defaults: new { controller = "Products", action = "Index" }
            );

            routes.MapRoute(
                name: "Account",
                url: "account",
                defaults: new { controller = "Account", action = "Index" }
            );

      //   routes.MapRoute(
        //        name: "Default",
          //      url: "{controller}/{action}/{id}",
            //    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
           // );
       
            // И только потом Web Forms маршруты
            routes.MapPageRoute("TestRoute", "test", "~/Test.aspx");
            routes.MapPageRoute("DefaultRoute", "", "~/Default.aspx");
            routes.MapPageRoute("RegisterRoute", "register", "~/Register.aspx");





            routes.MapPageRoute("HomepageRoute", "homepage", "~/Homepage.aspx");
            routes.MapPageRoute("SignInRoute", "signin", "~/SignIn.aspx");
            routes.MapPageRoute("SignUp", "signup", "~/SignUp.aspx");
        }
    }
}

 