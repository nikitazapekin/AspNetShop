<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignUp.ascx.cs" Inherits="WebApplication5.Controls.SignUp" %>

<div class="signup-form">
    <h2>Регистрация</h2>
    
    <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
    
    <div class="form-group">
        <asp:Label ID="lblFirstName" runat="server" Text="Имя:" AssociatedControlID="txtFirstName"></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
            ControlToValidate="txtFirstName" ErrorMessage="Введите имя" 
            Display="Dynamic" CssClass="validator" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revFirstName" runat="server"
            ControlToValidate="txtFirstName" ErrorMessage="Имя должно содержать только буквы"
            ValidationExpression="^[a-zA-Zа-яА-ЯёЁ\s]{2,50}$" Display="Dynamic" CssClass="validator"
            ValidationGroup="SignUp"></asp:RegularExpressionValidator>
    </div>

    <div class="form-group">
        <asp:Label ID="lblLastName" runat="server" Text="Фамилия:" AssociatedControlID="txtLastName"></asp:Label>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
            ControlToValidate="txtLastName" ErrorMessage="Введите фамилию" 
            Display="Dynamic" CssClass="validator" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revLastName" runat="server"
            ControlToValidate="txtLastName" ErrorMessage="Фамилия должна содержать только буквы"
            ValidationExpression="^[a-zA-Zа-яА-ЯёЁ\s]{2,50}$" Display="Dynamic" CssClass="validator"
            ValidationGroup="SignUp"></asp:RegularExpressionValidator>
    </div>

    <div class="form-group">
        <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
            ControlToValidate="txtEmail" ErrorMessage="Введите email" 
            Display="Dynamic" CssClass="validator" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmail" runat="server"
            ControlToValidate="txtEmail" ErrorMessage="Введите корректный email"
            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
            Display="Dynamic" CssClass="validator" ValidationGroup="SignUp"></asp:RegularExpressionValidator>
    </div>

    <div class="form-group">
        <asp:Label ID="lblPhone" runat="server" Text="Телефон:" AssociatedControlID="txtPhone"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+7 (XXX) XXX-XX-XX"></asp:TextBox>
        <asp:RegularExpressionValidator ID="revPhone" runat="server"
            ControlToValidate="txtPhone" ErrorMessage="Введите корректный номер телефона"
            ValidationExpression="^(\+375|8)?[\s\-]?\(?[0-9]{3}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$"
            Display="Dynamic" CssClass="validator" ValidationGroup="SignUp"></asp:RegularExpressionValidator>
    </div>

    <div class="form-group">
        <asp:Label ID="lblPassword" runat="server" Text="Пароль:" AssociatedControlID="txtPassword"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
            ControlToValidate="txtPassword" ErrorMessage="Введите пароль" 
            Display="Dynamic" CssClass="validator" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revPassword" runat="server"
            ControlToValidate="txtPassword" ErrorMessage="Пароль должен содержать минимум 8 символов, включая цифры и буквы"
            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$"
            Display="Dynamic" CssClass="validator" ValidationGroup="SignUp"></asp:RegularExpressionValidator>
    </div>

    <div class="form-group">
        <asp:Label ID="lblConfirmPassword" runat="server" Text="Подтвердите пароль:" AssociatedControlID="txtConfirmPassword"></asp:Label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
            ControlToValidate="txtConfirmPassword" ErrorMessage="Подтвердите пароль" 
            Display="Dynamic" CssClass="validator" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvConfirmPassword" runat="server"
            ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword"
            ErrorMessage="Пароли не совпадают" Display="Dynamic" CssClass="validator"
            ValidationGroup="SignUp"></asp:CompareValidator>
    </div>

    <div class="form-group">
        <asp:CheckBox ID="chkAgreement" runat="server" Text="Я согласен с условиями пользовательского соглашения" />
        <asp:CustomValidator ID="cvAgreement" runat="server"
            ErrorMessage="Необходимо принять условия соглашения"
            Display="Dynamic" CssClass="validator" ValidationGroup="SignUp"
            OnServerValidate="cvAgreement_ServerValidate"></asp:CustomValidator>
    </div>

    <div class="form-actions">
        <asp:Button ID="btnSignUp" runat="server" Text="Зарегистрироваться" 
            CssClass="btn btn-primary" ValidationGroup="SignUp" OnClick="btnSignUp_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Очистить" 
            CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnReset_Click" />
    </div>

      <div class="login-redirect" style="margin-top: 20px; text-align: center; padding: 15px; border-top: 1px solid #ddd;">
        <p style="margin: 0 0 10px 0;">Уже есть аккаунт?</p>
        <asp:HyperLink ID="hlSignIn" runat="server" 
            NavigateUrl="https://localhost:44394/signin" 
            CssClass="btn btn-outline-primary"
            Text="Войти в аккаунт" />
    </div>


</div>