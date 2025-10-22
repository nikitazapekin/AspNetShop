<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" 
    Inherits="Sshop.Views.Home.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Главная - Sshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        .btn-register {
            background-color: #28a745;
            border-color: #28a745;
            padding: 12px 30px;
            font-size: 18px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Навигация -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="~/">Sshop</a>
                <div class="navbar-nav ms-auto">
                    <a class="nav-link" href="~/">Главная</a>
                    <a class="nav-link" href="~/register">Регистрация</a>
                </div>
            </div>
        </nav>

        <!-- Герой секция -->
        <div class="hero-section">
            <div class="container">
                <h1 class="display-4">Добро пожаловать в Sshop</h1>
                <p class="lead">Лучший интернет-магазин с простой и удобной регистрацией</p>
                <a href="~/register" class="btn btn-success btn-register">Зарегистрироваться</a>
            </div>
        </div>

        <!-- Контент -->
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4">
                    <h3>Быстрая регистрация</h3>
                    <p>Всего несколько кликов и вы получите полный доступ ко всем возможностям магазина.</p>
                </div>
                <div class="col-md-4">
                    <h3>Удобный интерфейс</h3>
                    <p>Интуитивно понятный дизайн сделает ваше пребывание в магазине комфортным.</p>
                </div>
                <div class="col-md-4">
                    <h3>Безопасность</h3>
                    <p>Ваши данные надежно защищены с использованием современных технологий.</p>
                </div>
            </div>
        </div>

        <!-- Футер -->
        <footer class="bg-dark text-white mt-5 py-4">
            <div class="container text-center">
                <p>&copy; 2024 Sshop. Все права защищены.</p>
            </div>
        </footer>
    </form>
</body>
</html>