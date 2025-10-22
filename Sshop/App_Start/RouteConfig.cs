using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
 
using System.Web.Routing;

namespace Sshop
{
    /* public static class RouteConfig
     {
         public static void RegisterRoutes(RouteCollection routes)
         {
             var settings = new FriendlyUrlSettings();
             settings.AutoRedirectMode = RedirectMode.Permanent;
             routes.EnableFriendlyUrls(settings);
         }
     }
    */
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);

            // Регистрируем кастомные маршруты
            RegisterCustomRoutes(routes);
        }

        private static void RegisterCustomRoutes(RouteCollection routes)
        {
            // Маршрут для регистрации
            routes.MapPageRoute(
                "RegisterRoute",
                "auth/register",
                "~/Views/Auth/Register.aspx"
            );

            // Маршрут для успешной регистрации
            routes.MapPageRoute(
                "RegisterSuccessRoute",
                "auth/success",
                "~/Views/Auth/Success.aspx"
            );

            // Маршрут по умолчанию
            routes.MapPageRoute(
                "DefaultRoute",
                "{page}",
                "~/Default.aspx"
            );
        }
    }


}
