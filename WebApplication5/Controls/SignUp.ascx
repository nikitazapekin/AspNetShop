<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignUp.ascx.cs" Inherits="WebApplication5.Controls.SignUp" %>

<div class="signup-form">
    <h2>Регистрация</h2>
    
    <div id="message" class="message" style="display: none;"></div>
    
    <div class="form-group">
        <label for="txtFirstName">Имя:</label>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtLastName">Фамилия:</label>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtEmail">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtPhone">Телефон:</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+375 (XX) XXX-XX-XX"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtPassword">Пароль:</label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtConfirmPassword">Подтвердите пароль:</label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
    </div>

    <div class="form-actions">
        <button type="button" id="btnSignUp" class="btn btn-primary">Зарегистрироваться</button>
    </div>

    <div class="login-redirect" style="margin-top: 20px; text-align: center; padding: 15px; border-top: 1px solid #ddd;">
        <p style="margin: 0 0 10px 0;">Уже есть аккаунт?</p>
        <a href="/SignIn" class="btn btn-outline-primary">Войти в аккаунт</a>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('btnSignUp').addEventListener('click', function() {
        const userData = {
            FirstName: document.getElementById('<%= txtFirstName.ClientID %>').value,
            LastName: document.getElementById('<%= txtLastName.ClientID %>').value,
            Email: document.getElementById('<%= txtEmail.ClientID %>').value,
            Phone: document.getElementById('<%= txtPhone.ClientID %>').value,
            Password: document.getElementById('<%= txtPassword.ClientID %>').value
        };
         
        if (!userData.FirstName || !userData.LastName || !userData.Email || !userData.Password) {
            showMessage('Заполните все обязательные поля', 'error');
            return;
        }

        if (userData.Password !== document.getElementById('<%= txtConfirmPassword.ClientID %>').value) {
            showMessage('Пароли не совпадают', 'error');
            return;
        }

        fetch('/auth/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(userData)
        })
        .then(response => response.json())
            .then(data => {
            console.log("resp", data)
            if (data.success) {
                showMessage('Регистрация успешна! Перенаправление...', 'success');
                setTimeout(() => {
                    window.location.href = '/SignIn';
                }, 2000);
            } else {
                showMessage(data.message, 'error');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showMessage('Ошибка сети', 'error');
        });
    });

    function showMessage(message, type) {
        const messageDiv = document.getElementById('message');
        messageDiv.textContent = message;
        messageDiv.className = `message ${type}`;
        messageDiv.style.display = 'block';
        
        setTimeout(() => {
            messageDiv.style.display = 'none';
        }, 5000);
    }
});
</script>

<style>
.message {
    padding: 10px;
    margin: 10px 0;
    border-radius: 4px;
}
.message.success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}
.message.error {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}
</style>