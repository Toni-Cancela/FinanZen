import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:finanzen/core/network/network.dart';
import 'package:finanzen/domain/usecases/usecase.dart';

/// Mock classes for testing

// Core mocks
class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockDio extends Mock implements Dio {}

// UseCase mock base
class MockUseCase<T, P> extends Mock implements UseCase<T, P> {}

// HTTP Response mock
class MockResponse extends Mock implements Response<dynamic> {}

// Request Options mock
class MockRequestOptions extends Mock implements RequestOptions {}

// Dio Error mock
class MockDioException extends Mock implements DioException {}

/// Helper function to register all fallback values
void registerTestFallbackValues() {
  // Register fallback values for Dio
  registerFallbackValue(RequestOptions(path: ''));
  registerFallbackValue(DioExceptionType.unknown);
  
  // Register fallback values for common types
  registerFallbackValue(const NoParams());
}

/// Setup mocks with common behaviors
class MockSetup {
  static void setupNetworkInfoMock(MockNetworkInfo mockNetworkInfo, {bool isConnected = true}) {
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => isConnected);
  }
  
  static void setupDioMock(MockDio mockDio) {
    // Setup common Dio responses here if needed
  }
}
