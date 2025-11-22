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
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('btnSignIn').addEventListener('click', function () {
            const loginData = {
                Login: document.getElementById('<%= txtLogin.ClientID %>').value,
            Password: document.getElementById('<%= txtPassword.ClientID %>').value
        };

        if (!loginData.Login || !loginData.Password) {
            showMessage('Заполните все поля', 'error');
            return;
        }

        // ИЗМЕНЕНИЕ: Отправляем запрос на новый бэкенд
        fetch('https://localhost:7276/api/Account/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(loginData)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log("Login response:", data);
                if (data.success) {
                    // Сохраняем access token в localStorage
                    localStorage.setItem('accessToken', data.accessToken);

                    // Устанавливаем заголовок Authorization для будущих запросов
                    localStorage.setItem('authHeader', 'Bearer ' + data.accessToken);

                    showMessage('Вход успешен! Перенаправление...', 'success');

                    // Перенаправляем через 1 секунду
                    setTimeout(() => {
                        window.location.href = data.redirectUrl || '/account';
                    }, 1000);
                } else {
                    showMessage(data.message || 'Ошибка входа', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showMessage('Ошибка сети или сервера', 'error');
            });
    });

    function showMessage(message, type) {
        const messageDiv = document.getElementById('message');
        messageDiv.textContent = message;
        messageDiv.className = `message ${type}`;
        messageDiv.style.display = 'block';

        // Автоматически скрываем сообщение через 5 секунд
        if (type === 'success') {
            setTimeout(() => {
                messageDiv.style.display = 'none';
            }, 5000);
        }
    }

    // Проверяем, есть ли уже токен (автоматический вход)
    const existingToken = localStorage.getItem('accessToken');
    if (existingToken) {
        console.log('Found existing token, user might be already logged in');
    }
});
</script>

<style>
.message {
    padding: 10px;
    margin: 10px 0;
    border-radius: 4px;
    font-weight: bold;
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