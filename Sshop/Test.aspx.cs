using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sshop
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RegisterCard1_RegistrationCompleted(object sender, EventArgs e)
        {
            // Обработка успешной регистрации
            // Можно показать сообщение или перенаправить
            Response.Write("<script>alert('Регистрация завершена!');</script>");
        }
    }
}