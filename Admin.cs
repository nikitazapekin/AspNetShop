using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Shop.DataAccess.Models
{
    public class Admin
    {
        [Key]
        public string UserId { get; set; }
        public ApplicationUser User { get; set; }

        [Required]
        [MaxLength(100)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(100)]
        public string SecondName { get; set; }

        [MaxLength(20)]
        public string Tel { get; set; }

        public virtual ICollection<Product> Products { get; set; } = new List<Product>();
    }
}