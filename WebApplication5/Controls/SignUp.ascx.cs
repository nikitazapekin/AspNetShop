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

      

        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
   
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
         
        }

        private void ShowMessage(string message, string type)
        {
           
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