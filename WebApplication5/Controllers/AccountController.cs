using System.Collections.Generic;
using System.Web.Mvc;
using WebApplication5.Models;

namespace WebApplication5.Controllers
{
    public class AccountController : Controller
    {
        // Временные данные (в реальном приложении - из БД)
        private UserProfile GetCurrentUser()
        {
            return new UserProfile
            {
                FirstName = "Иван",
                LastName = "Петров",
                Email = "ivan.petrov@example.com",
                Phone = "+7 (999) 123-45-67",
                Password = "password123"
            };
        }

        private List<CartItem> GetCartItems()
        {
            return new List<CartItem>
            {
                new CartItem { ProductId = 1, ProductName = "Спиннинг Pro Cast", Price = 2490, Quantity = 1, ImageUrl = "https://via.placeholder.com/100x100/007bff/ffffff?text=Pro+Cast" },
                new CartItem { ProductId = 2, ProductName = "Морская удочка Ocean Master", Price = 5990, Quantity = 2, ImageUrl = "https://via.placeholder.com/100x100/28a745/ffffff?text=Ocean+Master" },
                new CartItem { ProductId = 3, ProductName = "Зимняя удочка Frost Line", Price = 1290, Quantity = 1, ImageUrl = "https://via.placeholder.com/100x100/6c757d/ffffff?text=Frost+Line" }
            };
        }

        public ActionResult Index()
        {
            var user = GetCurrentUser();
            return View(user);
        }

        public ActionResult Edit()
        {
            var user = GetCurrentUser();
            return View(user);
        }

        [HttpPost]
        public ActionResult Edit(UserProfile model)
        {
            if (ModelState.IsValid)
            {
                // Здесь сохраняем изменения в БД
                TempData["SuccessMessage"] = "Данные успешно обновлены!";
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Corzina()
        {
            var cartItems = GetCartItems();
            return View(cartItems);
        }

        [HttpPost]
        public ActionResult UpdateCart(int productId, int quantity)
        {
            // Здесь обновляем количество товара в корзине
            return Json(new { success = true, message = "Количество обновлено" });
        }

        [HttpPost]
        public ActionResult RemoveFromCart(int productId)
        {
            // Здесь удаляем товар из корзины
            return Json(new { success = true, message = "Товар удален из корзины" });
        }
    }
}

/*
 * using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication5.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }



        public ActionResult Edit()
        {

            return View();
        }

        public ActionResult Corzina()
        {

            return View();
        }

    }
}
*/