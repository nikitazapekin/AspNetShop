using Microsoft.AspNetCore.Identity;
using Shop.DataAccess.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Shop.DataAccess.Seeders
{
    public class AppIdentityDbContextSeeder
    {
        public static async Task SeedAsync(UserManager<ApplicationUser> userManager,
                                         RoleManager<IdentityRole> roleManager,
                                         ShopContext shopContext)
        { 
            string[] roleNames = { "Admin", "Customer" };
            foreach (var roleName in roleNames)
            {
                if (!await roleManager.RoleExistsAsync(roleName))
                {
                    await roleManager.CreateAsync(new IdentityRole(roleName));
                }
            }
 
            var adminUser = new ApplicationUser
            {
                UserName = "admin@shop.com",
                Email = "admin@shop.com",
                FirstName = "Admin",
                Surname = "System",
                EmailConfirmed = true
            };

            if (await userManager.FindByEmailAsync(adminUser.Email) == null)
            {
                var result = await userManager.CreateAsync(adminUser, "Admin123!");
                if (result.Succeeded)
                {
                    await userManager.AddToRoleAsync(adminUser, "Admin");
 
                    var admin = new Admin
                    {
                        UserId = adminUser.Id,
                        FirstName = "System",
                        SecondName = "Administrator",
                        Tel = "+1234567890"
                    };

                    shopContext.Admins.Add(admin);
                    await shopContext.SaveChangesAsync();
                }
            }
             
            var testUser = new ApplicationUser
            {
                UserName = "customer@shop.com",
                Email = "customer@shop.com",
                FirstName = "John",
                Surname = "Doe",
                EmailConfirmed = true
            };

            if (await userManager.FindByEmailAsync(testUser.Email) == null)
            {
                var result = await userManager.CreateAsync(testUser, "Customer123!");
                if (result.Succeeded)
                {
                    await userManager.AddToRoleAsync(testUser, "Customer");

                   
                    var customer = new Customer
                    {
                        UserId = testUser.Id,
                        FirstName = "John",
                        SecondName = "Doe",
                        Tel = "+0987654321"
                    };

                    shopContext.Customers.Add(customer);
                    await shopContext.SaveChangesAsync();
 
                    var cart = new Cart
                    {
                        CustomerUserId = testUser.Id
                    };
                    shopContext.Carts.Add(cart);
                    await shopContext.SaveChangesAsync();
                }
            }
        }
    }
}