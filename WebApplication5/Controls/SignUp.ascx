<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignUp.ascx.cs" Inherits="WebApplication5.Controls.SignUp" %>

<div class="signup-form">
    <h2>Регистрация</h2>
    
    <div id="message" class="message" style="display: none;"></div>
    
    <div class="form-group">
        <label for="txtFirstName">Имя:</label>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Введите ваше имя"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtLastName">Фамилия:</label>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Введите вашу фамилию"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtEmail">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="example@email.com"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtPhone">Телефон:</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+375 (XX) XXX-XX-XX"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtPassword">Пароль:</label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Не менее 6 символов"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtConfirmPassword">Подтвердите пароль:</label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Повторите пароль"></asp:TextBox>
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
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('btnSignUp').addEventListener('click', function () {
            const userData = {
                FirstName: document.getElementById('<%= txtFirstName.ClientID %>').value,
            LastName: document.getElementById('<%= txtLastName.ClientID %>').value,
            Email: document.getElementById('<%= txtEmail.ClientID %>').value,
            Phone: document.getElementById('<%= txtPhone.ClientID %>').value,
            Password: document.getElementById('<%= txtPassword.ClientID %>').value
        };
         
        // Валидация полей
        if (!userData.FirstName || !userData.LastName || !userData.Email || !userData.Password) {
            showMessage('Заполните все обязательные поля', 'error');
            return;
        }

        // Проверка email
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(userData.Email)) {
            showMessage('Введите корректный email адрес', 'error');
            return;
        }

        // Проверка пароля
        if (userData.Password.length < 6) {
            showMessage('Пароль должен содержать не менее 6 символов', 'error');
            return;
        }

        if (userData.Password !== document.getElementById('<%= txtConfirmPassword.ClientID %>').value) {
            showMessage('Пароли не совпадают', 'error');
            return;
        }

        // Показываем индикатор загрузки
        const button = document.getElementById('btnSignUp');
        const originalText = button.textContent;
        button.textContent = 'Регистрация...';
        button.disabled = true;

        // ИЗМЕНЕНИЕ: Отправляем запрос на новый бэкенд
        fetch('https://localhost:7276/api/Account/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            'Accept': 'application/json'
            },
            body: JSON.stringify(userData)
        })
        .then(response => {
            if (!response.ok) {
                // Если ответ не OK, пытаемся прочитать ошибку
                return response.json().then(errorData => {
                    throw new Error(errorData.message || 'Ошибка регистрации');
                });
            }
            return response.json();
        })
        .then(data => {
            console.log("Register response:", data);
            if (data.success) {
                showMessage('Регистрация успешна! Перенаправление на страницу входа...', 'success');
                setTimeout(() => {
                    window.location.href = '/SignIn';
                }, 2000);
            } else {
                showMessage(data.message || 'Ошибка регистрации', 'error');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showMessage(error.message || 'Ошибка сети или сервера', 'error');
        })
        .finally(() => {
            // Восстанавливаем кнопку
            button.textContent = originalText;
            button.disabled = false;
        });
    });

    function showMessage(message, type) {
        const messageDiv = document.getElementById('message');
        messageDiv.textContent = message;
        messageDiv.className = `message ${type}`;
        messageDiv.style.display = 'block';
        
        // Автоматически скрываем сообщение через 5 секунд
        setTimeout(() => {
            messageDiv.style.display = 'none';
        }, 5000);
    }

    // Добавляем валидацию в реальном времени
    const emailField = document.getElementById('<%= txtEmail.ClientID %>');
    const passwordField = document.getElementById('<%= txtPassword.ClientID %>');
    const confirmPasswordField = document.getElementById('<%= txtConfirmPassword.ClientID %>');

    if (confirmPasswordField) {
        confirmPasswordField.addEventListener('input', function () {
            const password = passwordField.value;
            const confirmPassword = this.value;

            if (confirmPassword && password !== confirmPassword) {
                this.style.borderColor = 'red';
            } else {
                this.style.borderColor = '';
            }
        });
    }
});
</script>

<style>
.message {
    padding: 12px;
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
.form-control {
    border: 1px solid #ced4da;
    border-radius: 4px;
    padding: 8px 12px;
    margin-bottom: 10px;
}
.form-control:focus {
    border-color: #80bdff;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
}
.btn {
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.3s ease;
}
.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    color: white;
}
.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}
.btn-primary:disabled {
    background-color: #6c757d;
    border-color: #6c757d;
    cursor: not-allowed;
}
</style>