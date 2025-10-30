<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Hero.ascx.cs" Inherits="WebApplication5.Controls.Hero" %>

<style>
.hero {
    color: white;
    padding: 120px 0;
}

.hero-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 40px;
    align-items: center;
}

.hero-title {
    font-size: 36px;
    margin-bottom: 10px;
    color: black;
}

.hero-description {
    font-size: 18px;
    margin-bottom: 20px;
    opacity: 0.9;
    color: black;
}

.hero-buttons {
    display: flex;
    gap: 10px;
}

.btn-primary {
    background: #28a745;
    border-color: #28a745;
}

.hero-emoji {
    font-size: 80px;
    opacity: 0.7;
    text-align: center;
}

.hero-caption {
    font-size: 16px;
    margin-top: 10px;
}
</style>

<section id="home" class="hero">
    <div class="container">
        <div class="hero-grid">
            <div>
                <h2 class="hero-title">Профессиональные удочки для настоящих рыбаков</h2>
                <p class="hero-description">
                    Откройте для себя мир качественных рыболовных снастей. 
                    Наши удочки - это надежность, прочность и гарантия отличного улова.
                </p>
                <div class="hero-buttons">
                    <a href="#products" class="btn btn-primary">Каталог удочек</a>
                    <a href="#about" class="btn btn-outline">О компании</a>
                </div>
            </div>
            <div>
                <div class="hero-emoji">🎣</div>
                <p class="hero-caption">Лучшие снасти для вашей рыбалки</p>
            </div>
        </div>
    </div>
</section>