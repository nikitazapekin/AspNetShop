using Microsoft.EntityFrameworkCore;
using Shop.DataAccess.Interfaces;
using Shop.DataAccess.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Shop.DataAccess.Repositories
{
    public class CartDbRepository : ICartRepository
    {
        private readonly ShopContext _context;

        public CartDbRepository(ShopContext context)
        {
            _context = context;
        }

        public async Task<Cart> GetByUserIdAsync(string userId)
        {
            return await _context.Carts
                .Include(c => c.CartItems)
                .ThenInclude(ci => ci.Product)
                .FirstOrDefaultAsync(c => c.CustomerUserId == userId);
        }

        public async Task<Cart> CreateAsync(string userId)
        {
            var cart = new Cart { CustomerUserId = userId };
            _context.Carts.Add(cart);
            await _context.SaveChangesAsync();
            return cart;
        }

        public async Task<Cart> AddProductAsync(string userId, Guid productId, int quantity = 1)
        {
            var cart = await GetByUserIdAsync(userId) ?? await CreateAsync(userId);
            var product = await _context.Products.FindAsync(productId);

            if (product == null)
                throw new ArgumentException("Product not found");

            var existingItem = cart.CartItems.FirstOrDefault(ci => ci.ProductId == productId);

            if (existingItem != null)
            {
                existingItem.Amount += quantity;
            }
            else
            {
                cart.CartItems.Add(new CartItem
                {
                    ProductId = productId,
                    Amount = quantity,
                    CartId = cart.Id
                });
            }

            await _context.SaveChangesAsync();
            return cart;
        }

        public async Task<Cart> UpdateProductQuantityAsync(string userId, Guid productId, int quantity)
        {
            var cart = await GetByUserIdAsync(userId);
            if (cart == null) return null;

            var cartItem = cart.CartItems.FirstOrDefault(ci => ci.ProductId == productId);
            if (cartItem != null)
            {
                if (quantity <= 0)
                {
                    cart.CartItems.Remove(cartItem);
                }
                else
                {
                    cartItem.Amount = quantity;
                }
            }

            await _context.SaveChangesAsync();
            return cart;
        }

        public async Task<bool> RemoveProductAsync(string userId, Guid productId)
        {
            var cart = await GetByUserIdAsync(userId);
            if (cart == null) return false;

            var cartItem = cart.CartItems.FirstOrDefault(ci => ci.ProductId == productId);
            if (cartItem != null)
            {
                cart.CartItems.Remove(cartItem);
                await _context.SaveChangesAsync();
                return true;
            }

            return false;
        }

        public async Task<bool> ClearCartAsync(string userId)
        {
            var cart = await GetByUserIdAsync(userId);
            if (cart == null) return false;

            cart.CartItems.Clear();
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteCartAsync(string userId)
        {
            var cart = await GetByUserIdAsync(userId);
            if (cart == null) return false;

            _context.Carts.Remove(cart);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}