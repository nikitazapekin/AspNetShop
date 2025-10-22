using Sshop.Controller;
using Sshop.Models;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sshop.Controls
{
    public partial class RegisterCard : UserControl
    {
        private AuthController _controller;

        // Событие для уведомления о успешной регистрации
        public event EventHandler RegistrationCompleted;

        protected void Page_Load(object sender, EventArgs e)
        {
            _controller = new AuthController(this.Page);

            if (!IsPostBack)
            {
                ClearErrors();
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
                // Вызываем событие успешной регистрации
                RegistrationCompleted?.Invoke(this, EventArgs.Empty);

                // Очищаем форму
                ClearForm();
            }
            else
            {
                ShowValidationErrors();
            }
        }

        // Скрытая кнопка для обновления UpdatePanel
        protected void btnHidden_Click(object sender, EventArgs e)
        {
        }

        private void ShowValidationErrors()
        {
            ClearErrors();

            string globalError = _controller.GetTempData<string>("Error_Global");
            if (!string.IsNullOrEmpty(globalError))
            {
                pnlErrors.Visible = true;
                ltlErrors.Text = globalError;
            }

            ShowFieldError("FirstName", lblFirstNameError);
            ShowFieldError("LastName", lblLastNameError);
            ShowFieldError("Email", lblEmailError);
            ShowFieldError("Password", lblPasswordError);
            ShowFieldError("ConfirmPassword", lblConfirmPasswordError);
        }

        private void ShowFieldError(string fieldName, Label errorLabel)
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

        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            ClearErrors();
        }

        // Публичные методы для управления из родительской страницы
        public void ResetForm()
        {
            ClearForm();
        }

        public void ShowSuccessMessage(string message)
        {
            pnlErrors.Visible = true;
            pnlErrors.CssClass = "alert alert-success";
            ltlErrors.Text = message;
        }
    }
}