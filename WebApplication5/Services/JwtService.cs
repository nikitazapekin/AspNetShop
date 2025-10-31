using System;
using System.Security.Cryptography;
using System.Text;
using System.Web.Script.Serialization;
using WebApplication5.Models;

namespace WebApplication5.Services
{
    public class JwtService
    {
        private readonly string _secretKey;

        public JwtService()
        {
            _secretKey = "secret";
        }

        public string GenerateAccessToken(UserProfile user)
        {
            var token = new Token
            {
                UserId = user.Id,
                Email = user.Email,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Expires = DateTimeToUnixTimestamp(DateTime.UtcNow.AddMinutes(1)),
                IssuedAt = DateTimeToUnixTimestamp(DateTime.UtcNow)
            };

            return token.ToTokenString();
        }

        public string GenerateRefreshToken(UserProfile user)
        {
            var refreshToken = new Token
            {
                UserId = user.Id,
                Email = user.Email,
                Expires = DateTimeToUnixTimestamp(DateTime.UtcNow.AddMinutes(2)), 
                IssuedAt = DateTimeToUnixTimestamp(DateTime.UtcNow),
                IsRefreshToken = true  
            };

            return refreshToken.ToTokenString();
        }

        public Token ValidateToken(string tokenString)
        {
            var token = Token.FromTokenString(tokenString);
            return token?.IsValid() == true ? token : null;
        }

        private long DateTimeToUnixTimestamp(DateTime dateTime)
        {
            var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            return (long)(dateTime - epoch).TotalSeconds;
        }
    }
}