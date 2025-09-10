# İyzico Flutter E-Commerce App

Flutter ile geliştirilmiş ve İyzico ödeme entegrasyonu içeren modern e-ticaret uygulaması.

## 📱 Proje Hakkında

Bu proje, Flutter framework'ü kullanılarak geliştirilmiş ve İyzico ödeme sistemi entegrasyonu içeren kapsamlı bir e-ticaret uygulamasıdır. Uygulama, kullanıcı dostu arayüzü ve güvenli ödeme altyapısı ile modern e-ticaret deneyimi sunmaktadır.

### ✨ Özellikler

- 🛍️ Ürün katalog ve detay sayfaları
- 🛒 Alışveriş sepeti yönetimi
- 👤 Kullanıcı kayıt ve giriş sistemi
- 💳 İyzico ile güvenli ödeme entegrasyonu
- 📱 Responsive tasarım (iOS ve Android)
- 🔍 Ürün arama ve filtreleme
- ⭐ Ürün değerlendirme sistemi
- 📦 Sipariş takip sistemi

## 🚀 Kurulum

### Gereksinimler

- Flutter SDK (3.0.0 veya üzeri)
- Dart SDK (2.17.0 veya üzeri)
- Android Studio / VS Code
- iOS için: Xcode (macOS)
- İyzico API anahtarları

### Adım Adım Kurulum

1. **Projeyi klonlayın:**
   ```bash
   git clone https://github.com/ahmetsadiegici05/iyzico-flutter-ecommerce.git
   cd iyzico-flutter-ecommerce
   ```

2. **Bağımlılıkları yükleyin:**
   ```bash
   flutter pub get
   ```

3. **İyzico API anahtarlarını yapılandırın:**
   - `lib/config/` klasöründe `iyzico_config.dart` dosyasını oluşturun
   - API anahtarlarınızı ekleyin (güvenlik için environment variables kullanın)

4. **Uygulamayı çalıştırın:**
   ```bash
   flutter run
   ```

## 📁 Proje Yapısı

```
lib/
├── config/          # Yapılandırma dosyaları
├── models/          # Veri modelleri
├── screens/         # Uygulama ekranları
├── widgets/         # Özel widget'lar
├── services/        # API ve servis katmanları
├── providers/       # State management (Provider)
└── utils/           # Yardımcı fonksiyonlar
```

## 🔧 Teknolojiler

- **Framework:** Flutter
- **Programlama Dili:** Dart
- **State Management:** Provider / Riverpod
- **Ödeme Sistemi:** İyzico Payment Gateway
- **HTTP İstekleri:** Dio
- **Yerel Depolama:** SharedPreferences / Hive
- **Navigasyon:** Go Router

## 📄 İyzico Entegrasyonu

Bu uygulama İyzico'nun güvenli ödeme altyapısını kullanmaktadır. İyzico entegrasyonu için:

1. [İyzico Developer Portal](https://dev.iyzipay.com/)'dan API anahtarlarınızı alın
2. Test ve canlı ortam anahtarlarını yapılandırın
3. Ödeme callback URL'lerini ayarlayın

## 🤝 Katkıda Bulunma

1. Bu repository'yi fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📝 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasını inceleyin.

## 📞 İletişim

Proje Sahibi: Ahmet Sadi Egici
- GitHub: [@ahmetsadiegici05](https://github.com/ahmetsadiegici05)

## 🌟 GitHub'a Yükleme Adımları

### Yeni bir GitHub repository'si oluşturma:

1. **GitHub'da yeni repo oluşturun:**
   - GitHub.com'a gidin ve giriş yapın
   - Sağ üst köşedeki "+" butonuna tıklayın
   - "New repository" seçin
   - Repository adını `iyzico-flutter-ecommerce` olarak girin
   - "Public" seçin
   - "Initialize this repository with a README" işaretini KALDIRIN
   - "Create repository" butonuna tıklayın

2. **Yerel projenizi GitHub'a bağlayın:**
   ```bash
   # Projenizi klonladığınız klasöre gidin
   cd iyzico-flutter-ecommerce
   
   # Git'i başlatın (eğer başlatılmamışsa)
   git init
   
   # Tüm dosyaları ekleyin
   git add .
   
   # İlk commit'i yapın
   git commit -m "Initial commit: Flutter e-commerce app with İyzico integration"
   
   # GitHub repository'sini remote olarak ekleyin
   git remote add origin https://github.com/KULLANICI_ADINIZ/iyzico-flutter-ecommerce.git
   
   # Ana branch'i main olarak ayarlayın
   git branch -M main
   
   # GitHub'a push edin
   git push -u origin main
   ```

3. **Repository ayarlarını kontrol edin:**
   - GitHub'da repository'niz açıldıktan sonra
   - "Settings" sekmesine gidin
   - "General" bölümünde repository'nin public olduğundan emin olun
   - "Pages" bölümünden GitHub Pages'i etkinleştirirebilirsiniz

### Gelecekteki güncellemeler için:

```bash
# Değişiklikleri ekleyin
git add .

# Commit mesajı ile kaydedin
git commit -m "Açıklayıcı commit mesajınız"

# GitHub'a gönderin
git push origin main
```

## 🔗 Faydalı Bağlantılar

- [Flutter Documentation](https://docs.flutter.dev/)
- [İyzico Developer Docs](https://dev.iyzipay.com/tr)
- [Dart Language Guide](https://dart.dev/guides)
- [Material Design Guidelines](https://material.io/design)