<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="About.ascx.cs" Inherits="WebApplication5.Controls.About" %>

<style>
.section-about {
    background: #f8f9fa;
}

.about-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 40px;
    align-items: center;
}

.section-title-left {
    text-align: left;
    margin-bottom: 20px;
}

.about-text {
    font-size: 16px;
    margin-bottom: 15px;
}

.about-text-large {
    font-size: 16px;
    margin-bottom: 20px;
}

.stats-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-top: 30px;
}

.stat-item {
    text-align: center;
}

.stat-number {
    font-size: 28px;
    font-weight: bold;
    color: #007bff;
}

.stat-label {
    color: #666;
}

.about-emoji {
    font-size: 100px;
    opacity: 0.7;
    text-align: center;
}

.about-quote {
    font-size: 18px;
    color: #666;
    margin-top: 20px;
}
</style>

<section id="about" class="section section-about">
    <div class="container">
        <div class="about-grid">
            <div>
                <h2 class="section-title section-title-left">О компании ProFishing</h2>
                <p class="about-text">
                    Более 15 лет мы предоставляем рыбакам качественные снасти, которые 
                    помогают достигать выдающихся результатов на рыбалке.
                </p>
                <p class="about-text-large">
                    Наша миссия - сделать рыбалку доступной и приятной для каждого, 
                    от начинающих любителей до профессиональных рыбаков.
                </p>
                
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-number">15+</div>
                        <div class="stat-label">лет на рынке</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">5000+</div>
                        <div class="stat-label">довольных клиентов</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">100+</div>
                        <div class="stat-label">видов удочек</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">24/7</div>
                        <div class="stat-label">поддержка</div>
                    </div>
                </div>
            </div>
            
            <div>
                <div class="about-emoji">🐟</div>
                <p class="about-quote">
                    "Хорошая удочка - это не просто снасть, это продолжение руки рыбака"
                </p>
            </div>
        </div>
    </div>
</section>