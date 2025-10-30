// Models/SimpleToken.cs
using System;
using System.Text;
using System.Web.Script.Serialization;

namespace WebApplication5.Models
{
    public class SimpleToken
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public long Expires { get; set; }
        public long IssuedAt { get; set; }

        public string ToTokenString()
        {
            var json = new JavaScriptSerializer().Serialize(this);
            var bytes = Encoding.UTF8.GetBytes(json);
            return Convert.ToBase64String(bytes);
        }

        public static SimpleToken FromTokenString(string token)
        {
            try
            {
                var bytes = Convert.FromBase64String(token);
                var json = Encoding.UTF8.GetString(bytes);
                return new JavaScriptSerializer().Deserialize<SimpleToken>(json);
            }
            catch
            {
                return null;
            }
        }

        public bool IsValid()
        {
            var expiryTime = UnixTimestampToDateTime(Expires);
            return expiryTime > DateTime.UtcNow;
        }

        private DateTime UnixTimestampToDateTime(long unixTimestamp)
        {
            var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            return epoch.AddSeconds(unixTimestamp);
        }
    }
}