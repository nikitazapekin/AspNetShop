using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Shop.DataAccess.Models
{
    public class Product
    {
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        [MaxLength(200)]
        public string Name { get; set; }

        public int Amount { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal Price { get; set; }
 
        public string Tags { get; set; }

        public string Description { get; set; }
 
        public string Image { get; set; }
 
        public string AdminUserId { get; set; }
        public virtual Admin Admin { get; set; }

        public virtual List<CartItem> CartItems { get; set; } = new List<CartItem>();
        public virtual List<OrderItem> OrderItems { get; set; } = new List<OrderItem>();
    }
}