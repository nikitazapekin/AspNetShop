using System.Collections.Generic;
using System.Web.Mvc;
using WebApplication5.Models;

namespace WebApplication5.Controllers
{
    public class ProductsController : Controller
    {
 
        private List<Card> GetFishingRods()
        {
            return new List<Card>
            {
                new Card {
                    Id = 1,
                    Name = "Спиннинг Pro Cast",
                    Description = "Профессиональный спиннинг для дальних забросов. Идеален для ловли щуки и окуня.",
                    Price = 2490m,
                    StockQuantity = 15,
                   ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s",
                    Category = "Спиннинги"
                },
                new Card {
                    Id = 2,
                    Name = "Морская удочка Ocean Master",
                    Description = "Мощная удочка для морской рыбалки. Устойчива к соленой воде и большим нагрузкам.",
                    Price = 5990m,
                    StockQuantity = 8,
               ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s",
                    Category = "Морские удочки"
                },
                new Card {
                    Id = 3,
                    Name = "Зимняя удочка Frost Line",
                    Description = "Компактная и чувствительная удочка для зимней рыбалки. Отлично подходит для ловли окуня.",
                    Price = 1290m,
                    StockQuantity = 25,
                ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s",
                    Category = "Зимние удочки"
                },
                new Card {
                    Id = 4,
                    Name = "Карповая удочка Big Catch",
                    Description = "Специализированная удочка для ловли карпа. Прочная и надежная конструкция.",
                    Price = 3890m,
                    StockQuantity = 12,
                   ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s",
                    Category = "Карповые удочки"
                },
                new Card {
                    Id = 5,
                    Name = "Ультралайт спиннинг Light Pro",
                    Description = "Легкий спиннинг для ультралайтовой ловли. Чувствительность и контроль на высшем уровне.",
                    Price = 3190m,
                    StockQuantity = 18,
                   ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s",
                    Category = "Ультралайт"
                },
                new Card {
                    Id = 6,
                    Name = "Телескопическая удочка Travel",
                    Description = "Компактная телескопическая удочка для путешествий. Удобна в транспортировке.",
                    Price = 1890m,
                    StockQuantity = 30,
                    ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlYn61blgUFcPH9sE6OZDzZ60KGjHgmUFwrw&s",
                    Category = "Телескопические"
                }
            };
        }

        public ActionResult Index()
        {
            var rods = GetFishingRods();
            return View(rods);
        }
 
        public ActionResult Card(int id)
        {
            var rods = GetFishingRods();
            var card = rods.Find(r => r.Id == id);

            if (card == null)
            {
                return HttpNotFound();
            }

            return View(card);
        }
 
    }
}