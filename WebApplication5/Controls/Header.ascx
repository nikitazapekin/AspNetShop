<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebApplication5.Controls.Header" %>

<style>
.header {
    background: #2c3e50;
    color: white;
    padding: 10px 0;
    position: sticky;
    top: 0;
    z-index: 1000;
}

.header-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header-brand {
    display: flex;
    align-items: center;
}

.header-title {
    margin: 0;
    font-size: 20px;
}

.header-accent {
    color: #007bff;
}

.header-nav ul {
    display: flex;
    list-style: none;
    margin: 0;
    gap: 20px;
}

.header-nav-link {
    color: white;
    text-decoration: none;
    font-weight: 500;
}

.header-auth {
    display: flex;
    align-items: center;
}

.btn-margin-left {
    margin-left: 10px;
}
</style>

<header class="header">
    <div class="container">
        <div class="header-container">
            <div class="header-brand">
                <h1 class="header-title">
                    <span class="header-accent">Pro</span>Fishing
                </h1>
            </div>
            
            <nav class="header-nav">
                <ul>
                    <li><a href="/homepage" class="header-nav-link">Главная</a></li>
                    <li><a href="/about" class="header-nav-link">Удочки</a></li>
                    <li><a href="/onas" class="header-nav-link">О нас</a></li>
                    <li><a href="/contacts" class="header-nav-link">Контакты</a></li>
                </ul>
            </nav>
            
            <div class="header-auth">
                <asp:HyperLink ID="hlSignIn" runat="server" 
                    NavigateUrl="~/SignIn.aspx" 
                    CssClass="btn btn-outline"
                    Text="Войти" />
                <asp:HyperLink ID="hlSignUp" runat="server" 
                    NavigateUrl="~/SignUp.aspx" 
                    CssClass="btn btn-margin-left"
                    Text="Регистрация" />
            </div>
        </div>
    </div>
</header>