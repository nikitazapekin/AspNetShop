// Controllers/AuthController.cs
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
        private readonly SimpleJwtService _jwtService;

        public AuthController()
        {
            _jwtService = new SimpleJwtService();
        }

        // POST: /auth/register
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
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Ошибка при регистрации" });
            }
        }

        // POST: /auth/login
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
                var refreshToken = _jwtService.GenerateRefreshToken();

                // Сохраняем refresh token
                _refreshTokens.RemoveAll(rt => rt.UserId == user.Id);
                _refreshTokens.Add(new RefreshToken
                {
                    Id = _refreshTokens.Count + 1,
                    UserId = user.Id,
                    Token = refreshToken,
                    Expires = DateTime.UtcNow.AddDays(7),
                    Created = DateTime.UtcNow
                });

                // Устанавливаем refresh token в httpOnly cookie
                Response.Cookies.Add(new HttpCookie("refreshToken", refreshToken)
                {
                    HttpOnly = true,
                    Secure = false, // установите true в production с HTTPS
                    Expires = DateTime.UtcNow.AddDays(7)
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

        // POST: /auth/logout
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

                // Удаляем cookie
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
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Ошибка при выходе" });
            }
        }

        // GET: /auth/validate
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

                // Проверяем refresh token
                var storedToken = _refreshTokens.FirstOrDefault(rt => rt.Token == refreshToken);
                if (storedToken == null || storedToken.Expires <= DateTime.UtcNow)
                {
                    return Json(new ValidateResponse { Authenticated = false }, JsonRequestBehavior.AllowGet);
                }

                // Проверяем access token
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
    }
}