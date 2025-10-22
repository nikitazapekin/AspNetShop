using Sshop.Controller;
using Sshop.Models;
using System;
using System.Web.UI;
using System.Web.UI.WebControls; // Добавляем для WebControls

namespace Sshop
{
    public partial class Register : Page
    {
        private AuthController _controller;

        protected void Page_Load(object sender, EventArgs e)
        {
            _controller = new AuthController(this);

            if (!IsPostBack)
            {
                _controller.Register();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var model = new RegisterModel
            {
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                Email = txtEmail.Text,
                Password = txtPassword.Text,
                ConfirmPassword = txtConfirmPassword.Text
            };

            if (_controller.ProcessRegistration(model))
            {
                Response.Redirect("~/Success.aspx");
            }
            else
            {
                // Показываем ошибки валидации
                ShowValidationErrors();
            }
        }

        private void ShowValidationErrors()
        {
            // Очищаем предыдущие ошибки
            ClearErrors();

            // Показываем общие ошибки
            string globalError = _controller.GetTempData<string>("Error_Global");
            if (!string.IsNullOrEmpty(globalError))
            {
                pnlErrors.Visible = true;
                ltlErrors.Text = globalError;
            }

            // Показываем ошибки для каждого поля
            ShowFieldError("FirstName", lblFirstNameError);
            ShowFieldError("LastName", lblLastNameError);
            ShowFieldError("Email", lblEmailError);
            ShowFieldError("Password", lblPasswordError);
            ShowFieldError("ConfirmPassword", lblConfirmPasswordError);
        }

        private void ShowFieldError(string fieldName, System.Web.UI.WebControls.Label errorLabel) // Указываем полное имя
        {
            string error = _controller.GetTempData<string>($"Error_{fieldName}");
            if (!string.IsNullOrEmpty(error))
            {
                errorLabel.Text = error;
                errorLabel.Visible = true;
            }
        }

        private void ClearErrors()
        {
            pnlErrors.Visible = false;
            ltlErrors.Text = string.Empty;
            lblFirstNameError.Visible = false;
            lblLastNameError.Visible = false;
            lblEmailError.Visible = false;
            lblPasswordError.Visible = false;
            lblConfirmPasswordError.Visible = false;
        }
    }
}