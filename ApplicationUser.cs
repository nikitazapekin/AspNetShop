using Microsoft.AspNetCore.Identity;
using Shop.DataAccess.Models;

namespace Shop.DataAccess
{
    public class ApplicationUser : IdentityUser
    {
        public string FirstName { get; set; }
        public string Surname { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual Admin Admin { get; set; }
    }
}