/// İyzico Payment Configuration
/// 
/// Bu dosya İyzico ödeme entegrasyonu için gerekli yapılandırmaları içerir.
/// Güvenlik için API anahtarlarını environment variables olarak kullanın.

class IyzicoConfig {
  // Test Environment
  static const String testApiKey = 'YOUR_TEST_API_KEY';
  static const String testSecretKey = 'YOUR_TEST_SECRET_KEY';
  static const String testBaseUrl = 'https://sandbox-api.iyzipay.com';
  
  // Production Environment  
  static const String prodApiKey = 'YOUR_PROD_API_KEY';
  static const String prodSecretKey = 'YOUR_PROD_SECRET_KEY';
  static const String prodBaseUrl = 'https://api.iyzipay.com';
  
  // Current Environment (change this for production)
  static const bool isProduction = false;
  
  // Get current API key based on environment
  static String get apiKey => isProduction ? prodApiKey : testApiKey;
  static String get secretKey => isProduction ? prodSecretKey : testSecretKey;
  static String get baseUrl => isProduction ? prodBaseUrl : testBaseUrl;
  
  // Currency and locale settings
  static const String currency = 'TRY';
  static const String locale = 'tr';
  
  // Callback URLs
  static const String callbackUrl = 'YOUR_CALLBACK_URL';
  static const String errorUrl = 'YOUR_ERROR_URL';
}

/// Güvenlik Notu:
/// Üretim ortamında API anahtarlarını aşağıdaki yöntemlerle saklayın:
/// 
/// 1. Environment Variables:
///    String.fromEnvironment('IYZICO_API_KEY')
/// 
/// 2. .env dosyası (flutter_dotenv paketi ile)
/// 
/// 3. Native platform'larda secure storage
/// 
/// Bu anahtarları asla git repository'sine commit etmeyin!