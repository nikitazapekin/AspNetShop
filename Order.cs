using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Shop.DataAccess.Models
{
    public class Order
    {
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public string Address { get; set; }

        public string CustomerUserId { get; set; }
        public virtual Customer Customer { get; set; }

        [MaxLength(50)]
        public string Status { get; set; } = "Pending";

        public DateTime DateTime { get; set; } = DateTime.UtcNow;

        public string UserComment { get; set; }
        public string UserPhone { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }
        public string UserEmail { get; set; }

        public virtual List<OrderItem> OrderItems { get; set; } = new List<OrderItem>();
    }
}