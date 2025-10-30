<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication5.About" %>
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

        .rods-section {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 80px 0;
        }

        .rods-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }

        .rod-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .rod-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }

        .rod-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
        }

        .rod-icon {
            font-size: 36px;
            color: #007bff;
            margin-bottom: 20px;
        }

        .rod-title {
            font-size: 18px;
            color: #2c3e50;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .rod-features {
            list-style: none;
            margin: 20px 0;
            text-align: left;
        }

        .rod-features li {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
            position: relative;
            padding-left: 25px;
        }

        .rod-features li::before {
            content: '✓';
            position: absolute;
            left: 0;
            color: #28a745;
            font-weight: bold;
        }

        .rod-price {
            font-size: 20px;
            color: #007bff;
            font-weight: bold;
            margin: 20px 0;
        }

        .rod-badge {
            position: absolute;
            top: 20px;
            right: -30px;
            background: #dc3545;
            color: white;
            padding: 5px 40px;
            transform: rotate(45deg);
            font-size: 12px;
            font-weight: bold;
        }

        .rods-cta {
            text-align: center;
            margin-top: 50px;
        }

        .rods-description {
            text-align: center;
            font-size: 16px;
            color: #666;
            max-width: 800px;
            margin: 0 auto 30px;
            line-height: 1.8;
        }

        .btn-margin-right {
            margin-right: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header ID="Header1" runat="server" />
 
        <section class="rods-section">
            <div class="container">
                <h2 class="section-title">Профессиональные удочки</h2>
                <p class="rods-description">
                    Откройте для себя мир качественных рыболовных снастей. Наши удочки созданы для настоящих профессионалов 
                    и любителей, которые ценят надежность и комфорт на рыбалке.
                </p>
                
                <div class="rods-grid">
                    <div class="rod-card">
                        <h3 class="rod-title">Спиннинг Pro Cast</h3>
                        <ul class="rod-features">
                            <li>Длина: 2.4 метра</li>
                            <li>Тест: 10-30 грамм</li>
                            <li>Углепластиковый бланк</li>
                            <li>Силиконовые рукоятки</li>
                            <li>Пропускные кольца SIC</li>
                        </ul>
                        <div class="rod-price">100 руб</div>
                        <button class="btn">В корзину</button>
                    </div>
 
                    <div class="rod-card">
                       <h3 class="rod-title">Маховая удочка</h3>
                        <ul class="rod-features">
                            <li>Длина: 3.6 метра</li>
                            <li>Тест: 60-120 грамм</li>
                            <li>Карбоновое удилище</li>
                            <li>Сменные вершинки</li>
                            <li>Неопреновая рукоять</li>
                        </ul>
                        <div class="rod-price">100 руб</div>
                        <button class="btn">В корзину</button>
                    </div> 

                    <div class="rod-card">
                        <h3 class="rod-title">Маховая удочка</h3>
                        <ul class="rod-features">
                            <li>Длина: 5 метров</li>
                            <li>Вес: 280 грамм</li>
                            <li>Композитный материал</li>
                            <li>Телескопическая система</li>
                            <li>Простота в использовании</li>
                        </ul>
                        <div class="rod-price">100 руб</div>
                        <button class="btn">В корзину</button>
                    </div>
                </div>

                <div class="rods-cta">
                    <button class="btn btn-outline btn-margin-right">Смотреть все удочки</button>
                    <button class="btn">Получить консультацию</button>
                </div>
            </div>
        </section>
       
        <uc:Footer ID="Footer1" runat="server" />
    </form>
</body>
</html>