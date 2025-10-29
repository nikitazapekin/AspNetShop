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

              
                    bool isAuthenticated = AuthenticateUser(login, password);

                    if (isAuthenticated)
                    {
                      

                        ShowMessage("Авторизация прошла успешно!", "success");

                   
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

            return false;
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

      
        public string Login => txtLogin.Text.Trim();
        public string Password => txtPassword.Text;
        public bool RememberMe => chkRememberMe.Checked;

        public void ResetForm()
        {
            ClearForm();
        }
    }
}
 