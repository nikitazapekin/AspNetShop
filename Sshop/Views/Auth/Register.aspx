<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" 
    Inherits="Sshop.Views.Auth.Register" %>
<%@ Import Namespace="Sshop.Models" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Регистрация</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="text-center">Регистрация</h3>
                        </div>
                        <div class="card-body">
                        
                            <asp:Panel ID="pnlErrors" runat="server" Visible="false" CssClass="alert alert-danger">
                                <asp:Literal ID="ltlErrors" runat="server"></asp:Literal>
                            </asp:Panel>

                         
                            <div class="mb-3">
                                <label for="txtFirstName" class="form-label">Имя</label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="lblFirstNameError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                            </div>

                            <div class="mb-3">
                                <label for="txtLastName" class="form-label">Фамилия</label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="lblLastNameError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                            </div>

                            <div class="mb-3">
                                <label for="txtEmail" class="form-label">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                <asp:Label ID="lblEmailError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                            </div>

                            <div class="mb-3">
                                <label for="txtPassword" class="form-label">Пароль</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:Label ID="lblPasswordError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                            </div>

                            <div class="mb-3">
                                <label for="txtConfirmPassword" class="form-label">Подтверждение пароля</label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:Label ID="lblConfirmPasswordError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                            </div>

                            <div class="d-grid">
                                <asp:Button ID="btnRegister" runat="server" 
                                    Text="Зарегистрироваться" 
                                    CssClass="btn btn-primary" 
                                    OnClick="btnRegister_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>