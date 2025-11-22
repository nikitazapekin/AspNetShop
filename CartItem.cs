using System;

namespace Shop.DataAccess.Models
{
    public class CartItem
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public int Amount { get; set; }

        public Guid ProductId { get; set; }
        public virtual Product Product { get; set; }

        public Guid CartId { get; set; }
        public virtual Cart Cart { get; set; }
    }
}