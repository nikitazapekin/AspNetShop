<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ONas.aspx.cs" Inherits="WebApplication5.ONas" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Hero.ascx" TagName="Hero" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Products.ascx" TagName="Products" TagPrefix="uc" %>
<%@ Register Src="~/Controls/About.ascx" TagName="About" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ProFishing - О нашем магазине</title>
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
            font-size: 28px;
            margin-bottom: 50px;
            color: #2c3e50;
        }

        .about-section {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            padding: 100px 0;
        }

        .about-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            align-items: center;
        }

        .about-text h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .about-subtitle {
            font-size: 18px;
            color: #007bff;
            font-weight: 600;
            margin-bottom: 15px;
            display: block;
        }

        .about-description {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
            line-height: 1.8;
        }

        .about-features {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin: 40px 0;
        }

        .feature-item {
            display: flex;
            align-items: flex-start;
            gap: 15px;
        }

        .feature-icon {
            width: 50px;
            height: 50px;
            background: #007bff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            flex-shrink: 0;
        }

        .feature-text h4 {
            font-size: 16px;
            color: #2c3e50;
            margin-bottom: 5px;
        }

        .feature-text p {
            color: #666;
            font-size: 14px;
        }

        .about-image {
            position: relative;
        }

        .about-img {
            width: 100%;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
            margin-top: 50px;
            text-align: center;
        }

        .stat-item {
            padding: 30px 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: transform 0.3s;
        }

        .stat-item:hover {
            transform: translateY(-5px);
        }

        .stat-number {
            font-size: 28px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 10px;
        }

        .stat-label {
            color: #666;
            font-size: 14px;
        }

        .about-cta {
            text-align: center;
            margin-top: 50px;
        }

        .btn-margin-right {
            margin-right: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header ID="Header1" runat="server" />
        
        <section class="about-section">
            <div class="container">
                <div class="about-content">
                    <div class="about-text">
                        <span class="about-subtitle">О НАШЕМ МАГАЗИНЕ</span>
                        <h2>ProFishing - Ваш надежный партнер в мире рыбалки</h2>
                        <p class="about-description">
                            Более 10 лет мы помогаем рыболовам-любителям и профессионалам находить идеальные снасти 
                            для успешной рыбалки. Наша миссия - сделать рыбалку доступной, комфортной и продуктивной 
                            для каждого.
                        </p>
                        
                        <div class="about-cta">
                            <button class="btn btn-margin-right">Написать нам</button>
                            <button class="btn btn-outline">Посмотреть ассортимент</button>
                        </div>
                    </div>
                    
                    <div class="about-image">
                         <img src="assets/ribak.png" alt="Магазин ProFishing" class="about-img" />
                    </div>
                </div>
                
                <div class="stats-container">
                    <div class="stat-item">
                        <div class="stat-number">10+</div>
                        <div class="stat-label">Лет на рынке</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">5000+</div>
                        <div class="stat-label">Довольных клиентов</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">100+</div>
                        <div class="stat-label">Брендов</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">24/7</div>
                        <div class="stat-label">Поддержка</div>
                    </div>
                </div>
            </div>
        </section>
       
        <uc:Footer ID="Footer1" runat="server" />
    </form>
</body>
</html>