using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5.Controls
{
    public partial class SignUp : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                  
                    ClearForm();

                    ShowMessage("Регистрация прошла успешно!", "success");
                }
                catch (Exception ex)
                {
                    ShowMessage($"Ошибка при регистрации: {ex.Message}", "error");
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void cvAgreement_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = chkAgreement.Checked;
        }

        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
   
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            chkAgreement.Checked = false;
 
            lblMessage.Visible = false;
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = $"message message-{type}";
            lblMessage.Visible = true;
        }
 
        public string FirstName => txtFirstName.Text.Trim();
        public string LastName => txtLastName.Text.Trim();
        public string Email => txtEmail.Text.Trim();
 
        public string Password => txtPassword.Text;
 
        public void ResetForm()
        {
            ClearForm();
        }
    }
} 