<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignIn.ascx.cs" Inherits="WebApplication5.Controls.SignIn" %>

<div class="signin-form">
    <h2>Вход в систему</h2>
    
    <div id="message" class="message" style="display: none;"></div>
    
    <div class="form-group">
        <label for="txtLogin">Логин или Email:</label>
        <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control" placeholder="Введите email или логин"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtPassword">Пароль:</label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
    </div>

    <div class="form-actions">
        <button type="button" id="btnSignIn" class="btn btn-primary">Войти</button>
    </div>

    <div class="signup-redirect" style="margin-top: 20px; text-align: center; padding: 15px; border-top: 1px solid #ddd;">
        <p style="margin: 0 0 10px 0;">Еще нет аккаунта?</p>
        <a href="/SignUp" class="btn btn-outline-primary">Зарегистрироваться</a>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('btnSignIn').addEventListener('click', function() {
        const loginData = {
            Login: document.getElementById('<%= txtLogin.ClientID %>').value,
            Password: document.getElementById('<%= txtPassword.ClientID %>').value
        };

        if (!loginData.Login || !loginData.Password) {
            showMessage('Заполните все поля', 'error');
            return;
        }
        
        fetch('/auth/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(loginData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                localStorage.setItem('accessToken', data.accessToken);
                window.location.href = data.redirectUrl;
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
    }
});
</script>