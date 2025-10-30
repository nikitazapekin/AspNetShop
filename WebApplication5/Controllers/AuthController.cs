using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication5.Models;
using WebApplication5.Services;

namespace WebApplication5.Controllers
{
    public class AuthController : Controller
    {
        private static List<UserProfile> _users = new List<UserProfile>
        {
            new UserProfile
            {
                Id = 1,
                FirstName = "Иван",
                LastName = "Петров",
                Email = "ivan.petrov@example.com",
                Phone = "+375 29 123-45-67",
                Password = "password123",
                Login = "ivan"
            }
        };

        private static List<RefreshToken> _refreshTokens = new List<RefreshToken>();
        private readonly JwtService _jwtService;

        public AuthController()
        {
            _jwtService = new JwtService();
        }

        [HttpPost]
        public ActionResult Register(RegisterRequest request)
        {
            try
            {
                if (_users.Any(u => u.Email == request.Email))
                {
                    return Json(new { success = false, message = "Пользователь с таким email уже существует" });
                }

                var newUser = new UserProfile
                {
                    Id = _users.Count + 1,
                    FirstName = request.FirstName,
                    LastName = request.LastName,
                    Email = request.Email,
                    Phone = request.Phone,
                    Password = request.Password,
                    Login = request.Email
                };

                _users.Add(newUser);

                return Json(new { success = true, message = "Регистрация успешна" });
            }
            catch
            {
                return Json(new { success = false, message = "Ошибка при регистрации" });
            }
        }

        [HttpPost]
        public ActionResult Login(LoginRequest request)
        {
            try
            {
                var user = _users.FirstOrDefault(u =>
                    (u.Email == request.Login || u.Login == request.Login) &&
                    u.Password == request.Password);

                if (user == null)
                {
                    return Json(new { success = false, message = "Неверный логин или пароль" });
                }

                var accessToken = _jwtService.GenerateAccessToken(user);
                var refreshToken = _jwtService.GenerateRefreshToken(user);  

                _refreshTokens.RemoveAll(rt => rt.UserId == user.Id);
                _refreshTokens.Add(new RefreshToken
                {
                    Id = _refreshTokens.Count + 1,
                    UserId = user.Id,
                    Token = refreshToken,
                    Expires = DateTime.UtcNow.AddHours(1),  
                    Created = DateTime.UtcNow
                });

                Response.Cookies.Add(new HttpCookie("refreshToken", refreshToken)
                {
                    HttpOnly = true,
                    Secure = false,
                    Expires = DateTime.UtcNow.AddHours(1) 
                });

                return Json(new
                {
                    success = true,
                    accessToken = accessToken,
                    redirectUrl = "/account"
                });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Ошибка при входе" });
            }
        }

        [HttpPost]
        public ActionResult Logout()
        {
            try
            {
                var refreshToken = Request.Cookies["refreshToken"]?.Value;
                if (!string.IsNullOrEmpty(refreshToken))
                {
                    _refreshTokens.RemoveAll(rt => rt.Token == refreshToken);
                }

                if (Request.Cookies["refreshToken"] != null)
                {
                    var cookie = new HttpCookie("refreshToken")
                    {
                        Expires = DateTime.UtcNow.AddDays(-1),
                        HttpOnly = true
                    };
                    Response.Cookies.Add(cookie);
                }

                return Json(new { success = true, redirectUrl = "/signin" });
            }
            catch
            {
                return Json(new { success = false, message = "Ошибка при выходе" });
            }
        }

        [HttpGet]
        public ActionResult Validate()
        {
            try
            {
                var accessToken = Request.Headers["Authorization"]?.Replace("Bearer ", "");
                var refreshToken = Request.Cookies["refreshToken"]?.Value;

                if (string.IsNullOrEmpty(accessToken) || string.IsNullOrEmpty(refreshToken))
                {
                    return Json(new ValidateResponse { Authenticated = false }, JsonRequestBehavior.AllowGet);
                }

                var storedToken = _refreshTokens.FirstOrDefault(rt => rt.Token == refreshToken);
                if (storedToken == null || storedToken.Expires <= DateTime.UtcNow)
                {
                    return Json(new ValidateResponse { Authenticated = false }, JsonRequestBehavior.AllowGet);
                }

                var token = _jwtService.ValidateToken(accessToken);
                if (token == null)
                {
                    return Json(new ValidateResponse { Authenticated = false }, JsonRequestBehavior.AllowGet);
                }

                var user = _users.FirstOrDefault(u => u.Id == token.UserId);

                if (user != null)
                {
                    return Json(new ValidateResponse
                    {
                        Authenticated = true,
                        User = new UserProfile
                        {
                            FirstName = user.FirstName,
                            LastName = user.LastName,
                            Email = user.Email,
                            Phone = user.Phone
                        }
                    }, JsonRequestBehavior.AllowGet);
                }

                return Json(new ValidateResponse { Authenticated = false }, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(new ValidateResponse { Authenticated = false }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult Refresh()
        {
            try
            {
                var refreshToken = Request.Cookies["refreshToken"]?.Value;

                if (string.IsNullOrEmpty(refreshToken))
                {
                    return Json(new { success = false, message = "Refresh token не найден" });
                }
 
                var validatedToken = _jwtService.ValidateToken(refreshToken);
                if (validatedToken == null || !validatedToken.IsRefreshToken)
                {
                    return Json(new { success = false, message = "Невалидный refresh token" });
                }

             
                var storedToken = _refreshTokens.FirstOrDefault(rt => rt.Token == refreshToken);
                if (storedToken == null || storedToken.Expires <= DateTime.UtcNow)
                {
                    return Json(new { success = false, message = "Refresh token истек или не найден" });
                }

                var user = _users.FirstOrDefault(u => u.Id == validatedToken.UserId);
                if (user == null)
                {
                    return Json(new { success = false, message = "Пользователь не найден" });
                }
 
                var newAccessToken = _jwtService.GenerateAccessToken(user);
                var newRefreshToken = _jwtService.GenerateRefreshToken(user);
 
                _refreshTokens.RemoveAll(rt => rt.Token == refreshToken);
                _refreshTokens.Add(new RefreshToken
                {
                    Id = _refreshTokens.Count + 1,
                    UserId = user.Id,
                    Token = newRefreshToken,
                    Expires = DateTime.UtcNow.AddHours(1),
                    Created = DateTime.UtcNow
                });
 
                Response.Cookies.Add(new HttpCookie("refreshToken", newRefreshToken)
                {
                    HttpOnly = true,
                    Secure = false,
                    Expires = DateTime.UtcNow.AddHours(1)
                });

                return Json(new
                {
                    success = true,
                    accessToken = newAccessToken
                });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Ошибка при обновлении токенов" });
            }
        }
    }
}