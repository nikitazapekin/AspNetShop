 
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




            routes.MapRoute(
           name: "UpdateCart",
           url: "account/updatecart",
           defaults: new { controller = "Account", action = "UpdateCart" }
       );


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
     name: "AccountCorzina",
     url: "account/corzina",
     defaults: new { controller = "Account", action = "Corzina" }
 );


            routes.MapRoute(
                name: "Account",
                url: "account",
                defaults: new { controller = "Account", action = "Index" }
            );

 
            routes.MapPageRoute("TestRoute", "test", "~/Test.aspx");
            routes.MapPageRoute("DefaultRoute", "", "~/Default.aspx");
            routes.MapPageRoute("RegisterRoute", "register", "~/Register.aspx");



            routes.MapPageRoute("ONasRoute", "onas", "~/ONas.aspx");
            routes.MapPageRoute("AboutRoute", "about", "~/About.aspx");
            routes.MapPageRoute("HomepageRoute", "homepage", "~/Homepage.aspx");
            routes.MapPageRoute("SignInRoute", "signin", "~/SignIn.aspx");
            routes.MapPageRoute("SignUp", "signup", "~/SignUp.aspx");
            routes.MapPageRoute("Contacts", "contacts", "~/Contacts.aspx");
            routes.MapPageRoute("NotFound", "notfound", "~/404.aspx");
        }
    }
}

 