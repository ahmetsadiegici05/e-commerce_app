/// Application Constants
/// 
/// Bu dosya uygulama genelinde kullanılan sabitleri içerir.

class AppConstants {
  // App Info
  static const String appName = 'İyzico E-Commerce';
  static const String appVersion = '1.0.0';
  
  // API Constants
  static const Duration apiTimeout = Duration(seconds: 30);
  static const int maxRetryAttempts = 3;
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;
  static const double maxContentWidth = 400.0;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 600);
  
  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String cartKey = 'shopping_cart';
  static const String userPreferencesKey = 'user_preferences';
  
  // Validation
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 50;
  static const String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
}