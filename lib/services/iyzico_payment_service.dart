import 'package:dio/dio.dart';
import '../config/iyzico_config.dart';

/// İyzico Payment Service
/// 
/// Bu servis İyzico ödeme sistemi ile entegrasyonu sağlar.
class IyzicoPaymentService {
  late final Dio _dio;

  IyzicoPaymentService() {
    _dio = Dio(BaseOptions(
      baseUrl: IyzicoConfig.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // İyzico authentication interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add İyzico specific headers and authentication
          options.headers['Authorization'] = _generateAuthHeader();
          handler.next(options);
        },
      ),
    );
  }

  /// Generate İyzico authentication header
  String _generateAuthHeader() {
    // TODO: Implement İyzico specific authentication
    // This involves creating a signature with API key and secret
    return 'IYZWSv2 ${IyzicoConfig.apiKey}';
  }

  /// Initialize a payment request
  Future<Map<String, dynamic>> initializePayment({
    required double amount,
    required String orderId,
    required Map<String, dynamic> buyer,
    required List<Map<String, dynamic>> basketItems,
  }) async {
    try {
      final response = await _dio.post('/payment/iyzipos/checkoutform/initialize/auth/ecom', 
        data: {
          'locale': IyzicoConfig.locale,
          'conversationId': orderId,
          'price': amount.toString(),
          'paidPrice': amount.toString(),
          'currency': IyzicoConfig.currency,
          'basketId': orderId,
          'paymentGroup': 'PRODUCT',
          'callbackUrl': IyzicoConfig.callbackUrl,
          'enabledInstallments': [1, 2, 3, 6, 9],
          'buyer': buyer,
          'shippingAddress': buyer,
          'billingAddress': buyer,
          'basketItems': basketItems,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw PaymentException('Ödeme başlatılamadı: ${e.message}');
    }
  }

  /// Verify payment result
  Future<Map<String, dynamic>> verifyPayment({
    required String paymentId,
    required String conversationId,
  }) async {
    try {
      final response = await _dio.post('/payment/iyzipos/checkoutform/auth/ecom/detail',
        data: {
          'locale': IyzicoConfig.locale,
          'conversationId': conversationId,
          'token': paymentId,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw PaymentException('Ödeme doğrulanamadı: ${e.message}');
    }
  }
}

/// Custom exception for payment errors
class PaymentException implements Exception {
  final String message;
  PaymentException(this.message);
  
  @override
  String toString() => 'PaymentException: $message';
}