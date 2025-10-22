using System;
using System.Web.UI;
using Sshop.Models;

namespace Sshop.Controller
{
    public class AuthController : BaseController
    {
        public AuthController(Page page) : base(page) { }

        public void Register()
        {
            // Инициализация формы регистрации
            var model = new RegisterModel();
            SetViewData("RegisterModel", model);
        }

        public bool ProcessRegistration(RegisterModel model)
        {
            // Очищаем предыдущие ошибки
            ClearErrors();

            if (ValidateModel(model))
            {
                // Сохранение пользователя
                if (SaveUser(model))
                {
                    SetTempData("SuccessMessage", $"Регистрация успешна! Добро пожаловать, {model.FirstName}!");
                    SetTempData("UserName", $"{model.FirstName} {model.LastName}");
                    return true;
                }
                else
                {
                    AddModelError("Global", "Ошибка при сохранении пользователя");
                }
            }
            return false;
        }

        private bool ValidateModel(RegisterModel model)
        {
            bool isValid = true;

            if (string.IsNullOrEmpty(model.FirstName))
            {
                AddModelError("FirstName", "Имя обязательно");
                isValid = false;
            }

            if (string.IsNullOrEmpty(model.LastName))
            {
                AddModelError("LastName", "Фамилия обязательна");
                isValid = false;
            }

            if (string.IsNullOrEmpty(model.Email) || !model.Email.Contains("@"))
            {
                AddModelError("Email", "Некорректный email");
                isValid = false;
            }

            if (string.IsNullOrEmpty(model.Password) || model.Password.Length < 6)
            {
                AddModelError("Password", "Пароль должен быть не менее 6 символов");
                isValid = false;
            }

            if (model.Password != model.ConfirmPassword)
            {
                AddModelError("ConfirmPassword", "Пароли не совпадают");
                isValid = false;
            }

            return isValid;
        }

        private void ClearErrors()
        {
            // Очищаем все ошибки
            var keys = new[] { "Global", "FirstName", "LastName", "Email", "Password", "ConfirmPassword" };
            foreach (var key in keys)
            {
                Context.Session.Remove($"TempData_Error_{key}");
            }
        }

        private bool SaveUser(RegisterModel model)
        {
            // Здесь реальная логика сохранения в базу данных
            // Для демонстрации всегда возвращаем true
            return true;
        }
    }
}