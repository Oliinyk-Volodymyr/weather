import 'package:dio/dio.dart';

final class AuthInterceptor extends Interceptor {
  const AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final updatedOptions = options.copyWith(
      queryParameters: {
        ...options.queryParameters,
        'appid': '2543bd2a818a65f52e1f1b659737d909',
      },
    );

    super.onRequest(updatedOptions, handler);
  }
}
