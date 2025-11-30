
namespace WebApplication5.Models
{
    public class UserProfile
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Password { get; set; }
        public string Login { get; set; }
    }

    public class RefreshToken
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Token { get; set; }
        public System.DateTime Expires { get; set; }
        public System.DateTime Created { get; set; }
    }

    public class LoginRequest
    {
        public string Login { get; set; }
        public string Password { get; set; }
    }

    public class RegisterRequest
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Password { get; set; }
    }

    public class ValidateResponse
    {
        public bool Authenticated { get; set; }
        public UserProfile User { get; set; }
    }

    public class JwtTokens
    {
        public string AccessToken { get; set; }
        public string RefreshToken { get; set; }
    }
}