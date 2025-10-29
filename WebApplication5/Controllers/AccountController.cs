
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using WebApplication5.Models;

namespace WebApplication5.Controllers
{
    public class AccountController : Controller
    {
        // Временное хранилище корзины в сессии
        private List<CartItem> CartItems
        {
            get
            {
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = GetCartItems();
                }
                return (List<CartItem>)Session["Cart"];
            }
            set { Session["Cart"] = value; }
        }

        private UserProfile GetCurrentUser()
        {
            return new UserProfile
            {
                FirstName = "Иван",
                LastName = "Петров",
                Email = "ivan.petrov@example.com",
                Phone = "+375 29 123-45-67",
                Password = "password123"
            };
        }

        private List<CartItem> GetCartItems()
        {
            return new List<CartItem>
            {
                new CartItem { ProductId = 1, ProductName = "Спиннинг Pro Cast", Price = 2490, Quantity = 1, ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s" },
                new CartItem { ProductId = 2, ProductName = "Морская удочка Ocean Master", Price = 5990, Quantity = 2, ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s" },
                new CartItem { ProductId = 3, ProductName = "Зимняя удочка Frost Line", Price = 1290, Quantity = 1, ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s" }
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
                TempData["SuccessMessage"] = "Данные успешно обновлены!";
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Corzina()
        {
            var cartItems = CartItems;
            return View(cartItems);
        }

        [HttpPost]
        public ActionResult UpdateCart(int productId, int quantity)
        {
            var cartItem = CartItems.FirstOrDefault(item => item.ProductId == productId);
            if (cartItem != null)
            {
                cartItem.Quantity = quantity;
                // Обновляем сессию
                CartItems = CartItems;
            }

            // Возвращаем обновленные данные корзины
            var total = cartItem?.TotalPrice ?? 0;
            var cartTotal = CartItems.Sum(i => i.TotalPrice);
            var itemCount = CartItems.Sum(i => i.Quantity);

            return Json(new
            {
                success = true,
                message = "Количество обновлено",
                itemTotal = total,
                cartTotal = cartTotal,
                itemCount = itemCount
            });
        }

        [HttpPost]
        public ActionResult RemoveFromCart(int productId)
        {
            var cartItem = CartItems.FirstOrDefault(item => item.ProductId == productId);
            if (cartItem != null)
            {
                CartItems.Remove(cartItem);
                // Обновляем сессию
                CartItems = CartItems;
            }

            var cartTotal = CartItems.Sum(i => i.TotalPrice);
            var itemCount = CartItems.Sum(i => i.Quantity);

            return Json(new
            {
                success = true,
                message = "Товар удален из корзины",
                cartTotal = cartTotal,
                itemCount = itemCount
            });
        }
    }
}
/*
using System.Collections.Generic;
using System.Web.Mvc;
using WebApplication5.Models;

namespace WebApplication5.Controllers
{
    public class AccountController : Controller
    {
        
        private UserProfile GetCurrentUser()
        {
            return new UserProfile
            {
                FirstName = "Иван",
                LastName = "Петров",
                Email = "ivan.petrov@example.com",
                Phone = "+375 29 123-45-67",
                Password = "password123"
            };
        }

        private List<CartItem> GetCartItems()
        {
            return new List<CartItem>
            {
                new CartItem { ProductId = 1, ProductName = "Спиннинг Pro Cast", Price = 2490, Quantity = 1, ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s", },
                new CartItem { ProductId = 2, ProductName = "Морская удочка Ocean Master", Price = 5990, Quantity = 2, ImageUrl =  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s", },
                new CartItem { ProductId = 3, ProductName = "Зимняя удочка Frost Line", Price = 1290, Quantity = 1, ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s",}
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
         
            return Json(new { success = true, message = "Количество обновлено" });
        }

        [HttpPost]
        public ActionResult RemoveFromCart(int productId)
        {
         
            return Json(new { success = true, message = "Товар удален из корзины" });
        }
    }
}


*/