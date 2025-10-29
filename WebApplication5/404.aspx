<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="WebApplication5._404" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/Controls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ProFishing - Страница не найдена</title>
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
        
        .error-section {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            padding: 100px 0;
            min-height: 80vh;
            display: flex;
            align-items: center;
        }

        .error-content {
            text-align: center;
            max-width: 800px;
            margin: 0 auto;
        }

        .error-code {
            font-size: 8rem;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 20px;
            line-height: 1;
            text-shadow: 3px 3px 0 rgba(0,123,255,0.1);
        }

        .error-title {
            font-size: 2.5rem;
            color: #2c3e50;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .error-subtitle {
            font-size: 1.2rem;
            color: #007bff;
            font-weight: 600;
            margin-bottom: 15px;
            display: block;
        }

        .error-description {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 40px;
            line-height: 1.8;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .error-image {
            max-width: 400px;
            margin: 0 auto 40px;
        }

        .error-img {
            width: 100%;
            height: auto;
            border-radius: 15px;
        }

        .error-actions {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 50px;
        }

        .error-features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }

        .feature-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: transform 0.3s;
            text-align: center;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            width: 70px;
            height: 70px;
            background: #007bff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            margin: 0 auto 20px;
        }

        .feature-title {
            font-size: 1.3rem;
            color: #2c3e50;
            margin-bottom: 15px;
        }

        .feature-description {
            color: #666;
            font-size: 1rem;
            line-height: 1.6;
        }

        .search-box {
            max-width: 500px;
            margin: 40px auto;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e9ecef;
            border-radius: 50px;
            font-size: 1rem;
            transition: all 0.3s;
            padding-right: 120px;
        }

        .search-input:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 0 3px rgba(0,123,255,0.1);
        }

        .search-button {
            position: absolute;
            right: 5px;
            top: 5px;
            bottom: 5px;
            padding: 0 25px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .search-button:hover {
            background: #0056b3;
        }

     
     

      
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header ID="Header1" runat="server" />
        
        <section class="error-section">
            <div class="container">
                <div class="error-content">
                    <div class="error-image">
                      
                     
                        <div class="fishing-rod" style="top: 50%; left: 50%; transform: rotate(15deg);"></div>
                    </div>
                    
                    <div class="error-code">404</div>
                    
                    <span class="error-subtitle">ОЙ! СТРАНИЦА НЕ НАЙДЕНА</span>
                    <h1 class="error-title">Кажется, эта страница уплыла</h1>
                    
                    
                    
                   
                    
                   
                    
                
                </div>
            </div>
        </section>
       
        <uc:Footer ID="Footer1" runat="server" />
    </form>
</body>
</html>