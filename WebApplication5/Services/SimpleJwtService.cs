// Services/SimpleJwtService.cs
using System;
using System.Security.Cryptography;
using System.Text;
using System.Web.Script.Serialization;
using WebApplication5.Models;

namespace WebApplication5.Services
{
    public class SimpleJwtService
    {
        private readonly string _secretKey;

        public SimpleJwtService()
        {
            _secretKey = "your_super_secret_key_here_that_is_at_least_32_chars_long_123!";
        }

        public string GenerateAccessToken(UserProfile user)
        {
            var token = new SimpleToken
            {
                UserId = user.Id,
                Email = user.Email,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Expires = DateTimeToUnixTimestamp(DateTime.UtcNow.AddMinutes(15)),
                IssuedAt = DateTimeToUnixTimestamp(DateTime.UtcNow)
            };

            return token.ToTokenString();
        }

        public string GenerateRefreshToken()
        {
            var randomNumber = new byte[32];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(randomNumber);
                return Convert.ToBase64String(randomNumber);
            }
        }

        public SimpleToken ValidateToken(string tokenString)
        {
            var token = SimpleToken.FromTokenString(tokenString);
            return token?.IsValid() == true ? token : null;
        }

        private long DateTimeToUnixTimestamp(DateTime dateTime)
        {
            var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            return (long)(dateTime - epoch).TotalSeconds;
        }

        private DateTime UnixTimestampToDateTime(long unixTimestamp)
        {
            var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            return epoch.AddSeconds(unixTimestamp);
        }
    }
}