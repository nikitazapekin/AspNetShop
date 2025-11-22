using System;
using System.Collections.Generic;

namespace Shop.DataAccess.Models
{
    public class Cart
    {
        public Guid Id { get; set; } = Guid.NewGuid();

         public string CustomerUserId { get; set; }
        public virtual Customer Customer { get; set; }

        public virtual List<CartItem> CartItems { get; set; } = new List<CartItem>();
    }
}