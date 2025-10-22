<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Success.aspx.cs" 
    Inherits="Sshop.Views.Auth.Success" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Успешная регистрация</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="alert alert-success text-center">
                        <h4>Регистрация успешна!</h4>
                        <p><%= ViewState["SuccessMessage"] %></p>
                        <div class="mt-3">
                            <a href="~/auth/register" class="btn btn-primary" runat="server">
                                Вернуться к регистрации
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>