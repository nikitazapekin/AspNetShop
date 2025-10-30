<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WebApplication5.Homepage" %>
<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Hero.ascx" TagName="Hero" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Products.ascx" TagName="Products" TagPrefix="uc" %>
<%@ Register Src="~/Controls/About.ascx" TagName="About" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ProFishing - Магазин рыбацких удочек</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }
        
        .btn:hover {
            background: #0056b3;
        }
        
        .btn-outline {
            background: transparent;
            border: 2px solid #007bff;
            color: #007bff;
        }
        
        .btn-outline:hover {
            background: #007bff;
            color: white;
        }
        
        .section {
            padding: 80px 0;
        }
        
        .section-title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 50px;
            color: #2c3e50;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header ID="Header1" runat="server" />
        <uc:Hero ID="Hero1" runat="server" />
        <uc:About ID="About1" runat="server" />
        <uc:Footer ID="Footer1" runat="server" />
    </form>
</body>
</html>