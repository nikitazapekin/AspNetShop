<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegisterCard.ascx.cs" 
    Inherits="Sshop.Controls.RegisterCard" %>

<div class="card">
    <div class="card-header">
        <h5 class="card-title">Регистрация</h5>
    </div>
    <div class="card-body">
        <h1>Some test</h1>
      <!--
        <asp:Panel ID="pnlErrors" runat="server" Visible="false" CssClass="alert alert-danger">
            <asp:Literal ID="ltlErrors" runat="server"></asp:Literal>
        </asp:Panel>
 
        <div class="mb-3">
            <label for="txtFirstName" class="form-label">Имя</label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Введите имя"></asp:TextBox>
            <asp:Label ID="lblFirstNameError" runat="server" CssClass="text-danger small" Visible="false"></asp:Label>
        </div>

        <div class="mb-3">
            <label for="txtLastName" class="form-label">Фамилия</label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Введите фамилию"></asp:TextBox>
            <asp:Label ID="lblLastNameError" runat="server" CssClass="text-danger small" Visible="false"></asp:Label>
        </div>

        <div class="mb-3">
            <label for="txtEmail" class="form-label">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="email@example.com"></asp:TextBox>
            <asp:Label ID="lblEmailError" runat="server" CssClass="text-danger small" Visible="false"></asp:Label>
        </div>

        <div class="mb-3">
            <label for="txtPassword" class="form-label">Пароль</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Не менее 6 символов"></asp:TextBox>
            <asp:Label ID="lblPasswordError" runat="server" CssClass="text-danger small" Visible="false"></asp:Label>
        </div>

        <div class="mb-3">
            <label for="txtConfirmPassword" class="form-label">Подтверждение пароля</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Повторите пароль"></asp:TextBox>
            <asp:Label ID="lblConfirmPasswordError" runat="server" CssClass="text-danger small" Visible="false"></asp:Label>
        </div>

        <div class="d-grid">
            <asp:Button ID="btnRegister" runat="server" Text="Зарегистрироваться" 
                CssClass="btn btn-primary" OnClick="btnRegister_Click" />
        </div>
 -->
        <asp:Button ID="btnHidden" runat="server" Style="display:none" OnClick="btnHidden_Click" />
    </div>
</div>