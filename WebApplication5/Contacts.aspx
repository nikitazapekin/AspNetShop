<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="WebApplication5.Contacts" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Hero.ascx" TagName="Hero" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Products.ascx" TagName="Products" TagPrefix="uc" %>
<%@ Register Src="~/Controls/About.ascx" TagName="About" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ProFishing - Контакты</title>
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
            transition: all 0.3s;
        }
        
        .btn:hover {
            background: #0056b3;
            transform: translateY(-2px);
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
            font-size: 2.5rem;
            margin-bottom: 50px;
            color: #2c3e50;
        }

        .contacts-section {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            padding: 100px 0;
        }

        .contacts-content {
          display: flex; 
          justify-content: center
        }

        .contacts-info h2 {
            font-size: 2.5rem;
            color: #2c3e50;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .contacts-subtitle {
            font-size: 1.2rem;
            color: #007bff;
            font-weight: 600;
            margin-bottom: 15px;
            display: block;
        }

        .contacts-description {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 30px;
            line-height: 1.8;
        }

        .contact-details {
            margin: 40px 0;
        }

        .contact-item {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            margin-bottom: 25px;
        }

        .contact-icon {
            width: 50px;
            height: 50px;
            background: #007bff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
            flex-shrink: 0;
        }

        .contact-text h4 {
            font-size: 1.1rem;
            color: #2c3e50;
            margin-bottom: 5px;
        }

        .contact-text p {
            color: #666;
            font-size: 1rem;
        }

        .contact-form {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            max-width: 600px; 
            width: 100%

          
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .form-control:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 0 3px rgba(0,123,255,0.1);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
        }

        .form-submit {
            text-align: center;
            margin-top: 30px;
        }

        .map-container {
            margin-top: 60px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }

        .map-placeholder {
            background: #e9ecef;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            font-size: 1.1rem;
        }

        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .social-link {
            width: 45px;
            height: 45px;
            background: #007bff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-decoration: none;
            transition: all 0.3s;
        }

        .social-link:hover {
            background: #0056b3;
            transform: translateY(-3px);
        }

        @media (max-width: 768px) {
            .contacts-content {
                grid-template-columns: 1fr;
                gap: 40px;
            }
            
            .contacts-section {
                padding: 60px 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header ID="Header1" runat="server" />
        
        <section class="contacts-section">
            <div class="container">





                <div class="contacts-content">
                   







                    <div class="contact-form">
                        <h3 style="margin-bottom: 30px; color: #2c3e50;">Форма обратной связи</h3>
                        
                        <div class="form-group">
                            <label class="form-label" for="txtName">Ваше имя *</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Введите ваше имя" required="true"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="txtEmail">Email *</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Введите ваш email" 
                                TextMode="Email" required="true"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="txtPhone">Телефон</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Введите ваш телефон" 
                                TextMode="Phone"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="ddlSubject">Тема сообщения</label>
                            <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Выберите тему" Value=""></asp:ListItem>
                                <asp:ListItem Text="Консультация по товарам" Value="consultation"></asp:ListItem>
                                <asp:ListItem Text="Вопрос по заказу" Value="order"></asp:ListItem>
                                <asp:ListItem Text="Сотрудничество" Value="cooperation"></asp:ListItem>
                                <asp:ListItem Text="Жалоба" Value="complaint"></asp:ListItem>
                                <asp:ListItem Text="Другое" Value="other"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="txtMessage">Сообщение *</label>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" 
                                TextMode="MultiLine" Rows="5" placeholder="Опишите ваш вопрос или проблему..." required="true"></asp:TextBox>
                        </div>
                        
                        <div class="form-submit">
                            <asp:Button ID="btnSubmit" runat="server" Text="Отправить сообщение" 
                                CssClass="btn" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
                
               
            </div>
        </section>
       
        <uc:Footer ID="Footer1" runat="server" />
    </form>
</body>
</html>