<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Sshop.Test" %>
<%@ Register TagPrefix="uc" TagName="RegisterCard" Src="~/Controller/RegisterCard.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1>Test Page</h1>
            <p>Testing RegisterCard User Control:</p>
            
            <uc:RegisterCard ID="RegisterCard1" runat="server" OnRegistrationCompleted="RegisterCard1_RegistrationCompleted" />
        </div>
    </form>
</body>
</html>