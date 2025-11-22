using Microsoft.AspNetCore.Mvc;
using Shop.DataAccess;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using System;

namespace Shop.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TestController : ControllerBase
    {
        private readonly ShopContext _context;

        public TestController(ShopContext context)
        {
            _context = context;
        }

        [HttpGet("test")]
        public IActionResult Test()
        {
            return Ok(new { message = "API is working!", timestamp = DateTime.UtcNow });
        }

        [HttpGet("products")]
        public async Task<IActionResult> GetProducts()
        {
            try
            {
                var products = await _context.Products.ToListAsync();
                return Ok(new { count = products.Count, products });
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpGet("check-db")]
        public async Task<IActionResult> CheckDatabase()
        {
            try
            {
                var productCount = await _context.Products.CountAsync();
                var userCount = await _context.Customers.CountAsync();
                var adminCount = await _context.Admins.CountAsync();

                return Ok(new
                {
                    message = "Database is working!",
                    products = productCount,
                    customers = userCount,
                    admins = adminCount
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message, details = ex.InnerException?.Message });
            }
        }
    }
}