import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Welcome!", "Willkommen!", "Bem-vindo!", "¡Bienvenido!", "Bienvenue!", "Benvenuto!", "Добро пожаловать!", "いらっしゃいませ！", "歡迎！", "Bonvenon!", "ยินดีต้อนรับ!", "Hoş geldin!", "أهلا بك!", "Welkom!", "Velkommen!", "ښه راغلاست!", "Bine ati venit!", "Välkommen!", "Chào mừng!", "Uyemukelwa!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
