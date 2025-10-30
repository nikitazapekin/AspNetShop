<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="WebApplication5.Controls.Footer" %>

<style>
.footer {
    background: #2c3e50;
    color: white;
    padding: 60px 0 20px;
}
 
.footer-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 30px;
    margin-bottom: 30px;
  justify-items:center;
 
}

.footer-title {
    color: #007bff;
    margin-bottom: 10px;
}

.footer-subtitle {
    margin-bottom: 10px;
}

.footer-text {
    opacity: 0.8;
}

.footer-contact-item {
    opacity: 0.8;
    margin-bottom: 5px;
}

.footer-link {
    color: white;
    opacity: 0.8;
    text-decoration: none;
}

.footer-divider {
    border-top: 1px solid rgba(255,255,255,0.1);
    padding-top: 20px;
    text-align: center;
}

.footer-copyright {
    opacity: 0.6;
    margin: 0;
}
</style>

<footer id="contact" class="footer">
    <div class="container">
      
            <div class="footer-grid">

            <div>
                <h3 class="footer-title">ProFishing</h3>
                <p class="footer-text">
                    Магазин качественных рыбацких снастей. 
                    Мы помогаем сделать каждую рыбалку успешной и запоминающейся.
                </p>
            </div>
            
            <div>
                <h4 class="footer-subtitle">Контакты</h4>
                <p class="footer-contact-item">+7 (999) 123-45-67</p>
                <p class="footer-contact-item">info@profishing.ru</p>
                <p class="footer-contact-item">Москва, ул. Рыбацкая, 15</p>
            </div>
            
            <div>
                <h4 class="footer-subtitle">Часы работы</h4>
                <p class="footer-contact-item">Пн-Пт: 9:00 - 20:00</p>
                <p class="footer-contact-item">Сб-Вс: 10:00 - 18:00</p>
            </div>
            
            <div>
                <h4 class="footer-subtitle">Быстрые ссылки</h4>
                <p><a href="#home" class="footer-link">Главная</a></p>
                <p><a href="#products" class="footer-link">Удочки</a></p>
                <p><a href="#about" class="footer-link">О нас</a></p>
                <p><a href="#contact" class="footer-link">Контакты</a></p>
            </div>
            
            </div>
       
        <div class="footer-divider">
            <p class="footer-copyright">
                &copy; 2025 ProFishing. Все права защищены.
            </p>
        </div>
    </div>
</footer>