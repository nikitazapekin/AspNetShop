using Microsoft.EntityFrameworkCore;
using Shop.DataAccess.Models;

namespace Shop.DataAccess
{
    public class ShopContext : DbContext
    {
        public DbSet<Product> Products { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Admin> Admins { get; set; }

        public ShopContext(DbContextOptions<ShopContext> options)
            : base(options) { }

        protected override void OnModelCreating(ModelBuilder builder)
        {
          
            builder.Entity<CartItem>()
                .HasKey(ci => ci.Id);

            builder.Entity<CartItem>()
                .HasOne(ci => ci.Product)
                .WithMany(p => p.CartItems)
                .HasForeignKey(ci => ci.ProductId);

            builder.Entity<CartItem>()
                .HasOne(ci => ci.Cart)
                .WithMany(c => c.CartItems)
                .HasForeignKey(ci => ci.CartId);

            builder.Entity<OrderItem>()
                .HasKey(oi => oi.Id);

            builder.Entity<OrderItem>()
                .HasOne(oi => oi.Product)
                .WithMany(p => p.OrderItems)
                .HasForeignKey(oi => oi.ProductId);

            builder.Entity<OrderItem>()
                .HasOne(oi => oi.Order)
                .WithMany(o => o.OrderItems)
                .HasForeignKey(oi => oi.OrderId);
             
            builder.Entity<Cart>()
                .HasOne(c => c.Customer)
                .WithOne(cust => cust.Cart)
                .HasForeignKey<Cart>(c => c.CustomerUserId)
                .OnDelete(DeleteBehavior.Cascade);
 
            builder.Entity<Product>()
                .HasOne(p => p.Admin)
                .WithMany(a => a.Products)
                .HasForeignKey(p => p.AdminUserId)
                .OnDelete(DeleteBehavior.Restrict);
             
            builder.Entity<Order>()
                .HasOne(o => o.Customer)
                .WithMany(c => c.Orders)
                .HasForeignKey(o => o.CustomerUserId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}