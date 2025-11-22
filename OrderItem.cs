using System;

namespace Shop.DataAccess.Models
{
    public class OrderItem
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public int Amount { get; set; }

        public Guid ProductId { get; set; }
        public virtual Product Product { get; set; }

        public Guid OrderId { get; set; }
        public virtual Order Order { get; set; }
    }
}