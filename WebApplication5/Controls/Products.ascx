<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Products.ascx.cs" Inherits="WebApplication5.Controls.Products" %>

<section id="products" class="section" style="background: white;">
    <div class="container">
        <h2 class="section-title">Наши удочки</h2>
        
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;">
            
           
            <div style="background: #f8f9fa; border-radius: 10px; padding: 2rem; text-align: center; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
                <div style="font-size: 3rem; margin-bottom: 1rem;">🎯</div>
                <h3 style="color: #2c3e50; margin-bottom: 1rem;">Спиннинги Pro Cast</h3>
                <p style="color: #666; margin-bottom: 1.5rem;">
                    Идеальны для дальних забросов. Легкие и прочные, созданы для профессионалов.
                </p>
                <div style="font-size: 1.5rem; font-weight: bold; color: #007bff; margin-bottom: 1.5rem;">
                    от 2 490 ₽
                </div>
                <a href="#" class="btn">Подробнее</a>
            </div>
            
            <div style="background: #f8f9fa; border-radius: 10px; padding: 2rem; text-align: center; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
                <div style="font-size: 3rem; margin-bottom: 1rem;">🌊</div>
                <h3 style="color: #2c3e50; margin-bottom: 1rem;">Морские удочки Ocean Master</h3>
                <p style="color: #666; margin-bottom: 1.5rem;">
                    Для морской рыбалки. Устойчивы к соленой воде и большим нагрузкам.
                </p>
                <div style="font-size: 1.5rem; font-weight: bold; color: #007bff; margin-bottom: 1.5rem;">
                    от 5 990 ₽
                </div>
                <a href="#" class="btn">Подробнее</a>
            </div>
            
            <div style="background: #f8f9fa; border-radius: 10px; padding: 2rem; text-align: center; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
                <div style="font-size: 3rem; margin-bottom: 1rem;">❄️</div>
                <h3 style="color: #2c3e50; margin-bottom: 1rem;">Зимние удочки Frost Line</h3>
                <p style="color: #666; margin-bottom: 1.5rem;">
                    Специально для зимней рыбалки. Компактные и чувствительные.
                </p>
                <div style="font-size: 1.5rem; font-weight: bold; color: #007bff; margin-bottom: 1.5rem;">
                    от 1 290 ₽
                </div>
                <a href="#" class="btn">Подробнее</a>
            </div>
            
        </div>
        
        <div style="text-align: center; margin-top: 3rem;">
            <a href="#" class="btn" style="padding: 15px 40px; font-size: 1.1rem;">Весь каталог</a>
        </div>
    </div>
</section>