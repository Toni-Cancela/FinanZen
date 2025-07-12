import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: 'https://api.finanzen.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}

// Network utilities
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkClient {
  // HTTP client configuration will be implemented here
}
