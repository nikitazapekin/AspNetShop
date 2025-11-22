using Shop.DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop.DataAccess.Seeders
{
    public class ShopContextSeeder
    {
        public static async Task SeedAsync(ShopContext context)
        {
            if (!context.Products.Any())
            {
                var admin = context.Admins.FirstOrDefault();
                if (admin != null)
                {
                    var products = new List<Product>();
                    var random = new Random();

                    for (int i = 1; i <= 20; i++)
                    {
                        products.Add(new Product
                        {
                            Name = $"Product {i}",
                            Price = random.Next(10, 1000),
                            Amount = random.Next(1, 100),
                            Description = $"This is a description for product {i}. Lorem ipsum dolor sit amet.",
                            Tags = $"[\\\"electronics\\\", \\\"gadget\\\", \\\"tech\\\"]",
                            Image = "/images/products/default.png",
                            AdminUserId = admin.UserId
                        });
                    }

                    await context.Products.AddRangeAsync(products);
                    await context.SaveChangesAsync();
                }
            }
        }
    }
}