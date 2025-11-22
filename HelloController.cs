using Microsoft.AspNetCore.Mvc;
using System;

namespace Shop.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HelloController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { message = "Hello from Controller!", timestamp = DateTime.Now });
        }

        [HttpGet("test")]
        public IActionResult Test()
        {
            return Ok(new { message = "Test endpoint works!" });
        }
    }
}