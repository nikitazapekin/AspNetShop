using System.Text;
using System.Web.Script.Serialization;
using System;

public class Token
{
    public int UserId { get; set; }
    public string Email { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public long Expires { get; set; }
    public long IssuedAt { get; set; }
    public bool IsRefreshToken { get; set; }

    public string ToTokenString()
    {
        var serializer = new JavaScriptSerializer();
        var payload = serializer.Serialize(this);
        var payloadBytes = Encoding.UTF8.GetBytes(payload);
        return Convert.ToBase64String(payloadBytes);
    }

    public static Token FromTokenString(string tokenString)
    {
        try
        {
            var payloadBytes = Convert.FromBase64String(tokenString);
            var payload = Encoding.UTF8.GetString(payloadBytes);
            var serializer = new JavaScriptSerializer();
            return serializer.Deserialize<Token>(payload);
        }
        catch
        {
            return null;
        }
    }

    public bool IsValid()
    {
        var now = DateTimeToUnixTimestamp(DateTime.UtcNow);
        return now < Expires;
    }

    private long DateTimeToUnixTimestamp(DateTime dateTime)
    {
        var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
        return (long)(dateTime - epoch).TotalSeconds;
    }
}