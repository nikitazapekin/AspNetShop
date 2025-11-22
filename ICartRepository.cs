using Shop.DataAccess.Models;
using System;
using System.Threading.Tasks;

namespace Shop.DataAccess.Interfaces
{
    public interface ICartRepository
    {
        Task<Cart> GetByUserIdAsync(string userId);
        Task<Cart> CreateAsync(string userId);
        Task<Cart> AddProductAsync(string userId, Guid productId, int quantity = 1);
        Task<Cart> UpdateProductQuantityAsync(string userId, Guid productId, int quantity);
        Task<bool> RemoveProductAsync(string userId, Guid productId);
        Task<bool> ClearCartAsync(string userId);
        Task<bool> DeleteCartAsync(string userId);
    }
}