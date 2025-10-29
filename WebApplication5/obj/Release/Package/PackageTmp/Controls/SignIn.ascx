<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignIn.ascx.cs" Inherits="WebApplication5.Controls.SignIn" %>

<div class="signin-form">
    <h2>Вход в систему</h2>
    
    <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
    
    <div class="form-group">
        <asp:Label ID="lblLogin" runat="server" Text="Логин:" AssociatedControlID="txtLogin"></asp:Label>
        <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control" placeholder="Введите email или логин"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvLogin" runat="server" 
            ControlToValidate="txtLogin" ErrorMessage="Введите логин или email" 
            Display="Dynamic" CssClass="validator" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <asp:Label ID="lblPassword" runat="server" Text="Пароль:" AssociatedControlID="txtPassword"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
            ControlToValidate="txtPassword" ErrorMessage="Введите пароль" 
            Display="Dynamic" CssClass="validator" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <asp:CheckBox ID="chkRememberMe" runat="server" Text="Запомнить меня" />
    </div>

    <div class="form-actions">
        <asp:Button ID="btnSignIn" runat="server" Text="Войти" 
            CssClass="btn btn-primary" ValidationGroup="SignIn" OnClick="btnSignIn_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Очистить" 
            CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnReset_Click" />
    </div>

    <div class="signup-redirect" style="margin-top: 20px; text-align: center; padding: 15px; border-top: 1px solid #ddd;">
        <p style="margin: 0 0 10px 0;">Еще нет аккаунта?</p>
        <asp:HyperLink ID="hlSignUp" runat="server" 
            NavigateUrl="~/SignUp.aspx" 
            CssClass="btn btn-outline-primary"
            Text="Зарегистрироваться" />
    </div>
</div>

 