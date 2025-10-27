using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5.Controls
{
    public partial class SignIn : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string login = Login;
                    string password = Password;

                    // Здесь должна быть ваша логика проверки учетных данных
                    // Например, проверка в базе данных
                    bool isAuthenticated = AuthenticateUser(login, password);

                    if (isAuthenticated)
                    {
                        // Успешная авторизация
                        // Сохранение в сессии, установка cookies и т.д.

                        ShowMessage("Авторизация прошла успешно!", "success");

                        // Перенаправление на главную страницу или другую защищенную страницу
                        // Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        ShowMessage("Неверный логин или пароль", "error");
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage($"Ошибка при авторизации: {ex.Message}", "error");
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private bool AuthenticateUser(string login, string password)
        {
            // TODO: Реализовать проверку учетных данных
            // Это может быть проверка в базе данных, Active Directory и т.д.

            // Временная заглушка для демонстрации
            // Замените на реальную логику аутентификации
            return (login == "demo" && password == "demo123");
        }

        private void ClearForm()
        {
            txtLogin.Text = "";
            txtPassword.Text = "";
            chkRememberMe.Checked = false;
            lblMessage.Visible = false;
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = $"message message-{type}";
            lblMessage.Visible = true;
        }

        // Свойства для доступа к данным извне
        public string Login => txtLogin.Text.Trim();
        public string Password => txtPassword.Text;
        public bool RememberMe => chkRememberMe.Checked;

        public void ResetForm()
        {
            ClearForm();
        }
    }
}

/* using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5.Controls
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

     
    }
}
*/