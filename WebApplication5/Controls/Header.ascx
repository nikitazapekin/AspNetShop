<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebApplication5.Controls.Header" %>

<header style="background: #2c3e50; color: white; padding: 1rem 0; position: sticky; top: 0; z-index: 1000;">
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <div style="display: flex; align-items: center;">
                <h1 style="margin: 0; font-size: 1.8rem;">
                    <span style="color: #007bff;">Pro</span>Fishing
                </h1>
            </div>
            
            <nav>
                <ul style="display: flex; list-style: none; margin: 0; gap: 2rem;">
                    <li><a href="#home" style="color: white; text-decoration: none; font-weight: 500;">Главная</a></li>
                    <li><a href="#products" style="color: white; text-decoration: none; font-weight: 500;">Удочки</a></li>
                    <li><a href="#about" style="color: white; text-decoration: none; font-weight: 500;">О нас</a></li>
                    <li><a href="#contact" style="color: white; text-decoration: none; font-weight: 500;">Контакты</a></li>
                </ul>
            </nav>
            
            <div>
                <asp:HyperLink ID="hlSignIn" runat="server" 
                    NavigateUrl="~/SignIn.aspx" 
                    CssClass="btn btn-outline"
                    Text="Войти" />
                <asp:HyperLink ID="hlSignUp" runat="server" 
                    NavigateUrl="~/SignUp.aspx" 
                    CssClass="btn"
                    Text="Регистрация" 
                    Style="margin-left: 10px;" />
            </div>
        </div>
    </div>
</header>