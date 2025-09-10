import 'package:dio/dio.dart';
import '../models/product.dart';
import '../utils/app_constants.dart';

/// API Service for E-commerce operations
/// 
/// Bu servis e-ticaret API çağrıları için kullanılır.
class ApiService {
  late final Dio _dio;

  ApiService({String? baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl ?? 'https://api.example.com',
      connectTimeout: AppConstants.apiTimeout,
      receiveTimeout: AppConstants.apiTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors for logging and error handling
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add authentication token if available
          // options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
        onResponse: (response, handler) {
          // Handle successful responses
          handler.next(response);
        },
        onError: (error, handler) {
          // Handle errors
          _handleError(error);
          handler.next(error);
        },
      ),
    );
  }

  /// Get all products
  Future<List<Product>> getProducts({
    int page = 1,
    int limit = AppConstants.defaultPageSize,
    String? category,
    String? search,
  }) async {
    try {
      final response = await _dio.get('/products', queryParameters: {
        'page': page,
        'limit': limit,
        if (category != null) 'category': category,
        if (search != null) 'search': search,
      });

      final List<dynamic> productsJson = response.data['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ApiException('Ürünler yüklenemedi: ${e.message}');
    }
  }

  /// Get product by ID
  Future<Product> getProductById(String id) async {
    try {
      final response = await _dio.get('/products/$id');
      return Product.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException('Ürün detayları yüklenemedi: ${e.message}');
    }
  }

  /// Get product categories
  Future<List<String>> getCategories() async {
    try {
      final response = await _dio.get('/categories');
      return List<String>.from(response.data['categories']);
    } on DioException catch (e) {
      throw ApiException('Kategoriler yüklenemedi: ${e.message}');
    }
  }

  /// Search products
  Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await _dio.get('/products/search', queryParameters: {
        'q': query,
      });

      final List<dynamic> productsJson = response.data['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ApiException('Arama yapılamadı: ${e.message}');
    }
  }

  /// Create order
  Future<Map<String, dynamic>> createOrder({
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> shippingAddress,
    required Map<String, dynamic> billingAddress,
  }) async {
    try {
      final response = await _dio.post('/orders', data: {
        'items': items,
        'shipping_address': shippingAddress,
        'billing_address': billingAddress,
      });

      return response.data;
    } on DioException catch (e) {
      throw ApiException('Sipariş oluşturulamadı: ${e.message}');
    }
  }

  /// Handle API errors
  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        throw ApiException('Bağlantı zaman aşımına uğradı');
      case DioExceptionType.connectionError:
        throw ApiException('İnternet bağlantısını kontrol edin');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode == 401) {
          throw ApiException('Oturum süreniz dolmuş, lütfen tekrar giriş yapın');
        } else if (statusCode == 404) {
          throw ApiException('İstenen kaynak bulunamadı');
        } else if (statusCode == 500) {
          throw ApiException('Sunucu hatası, lütfen daha sonra tekrar deneyin');
        }
        break;
      default:
        throw ApiException('Beklenmeyen bir hata oluştu');
    }
  }
}

/// Custom exception for API errors
class ApiException implements Exception {
  final String message;
  ApiException(this.message);
  
  @override
  String toString() => 'ApiException: $message';
}