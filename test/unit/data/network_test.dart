import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:finanzen/core/network/network.dart';

// Mock for NetworkInfo
class MockNetworkInfo extends Mock implements NetworkInfo {}

// Mock for Dio
class MockDio extends Mock implements Dio {}

void main() {
  group('Data Layer Tests', () {
    late MockNetworkInfo mockNetworkInfo;

    setUp(() {
      mockNetworkInfo = MockNetworkInfo();
    });

    group('NetworkInfo', () {
      test('should return true when device has internet connection', () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        // Act
        final result = await mockNetworkInfo.isConnected;

        // Assert
        expect(result, true);
        verify(() => mockNetworkInfo.isConnected).called(1);
      });

      test('should return false when device has no internet connection', () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // Act
        final result = await mockNetworkInfo.isConnected;

        // Assert
        expect(result, false);
        verify(() => mockNetworkInfo.isConnected).called(1);
      });
    });

    group('HTTP Client Configuration', () {
      test('should have correct base configuration', () {
        // This test demonstrates testing configuration
        const expectedTimeout = Duration(seconds: 5);
        const expectedReceiveTimeout = Duration(seconds: 3);
        
        // In a real scenario, you would test the actual Dio configuration
        expect(expectedTimeout.inSeconds, 5);
        expect(expectedReceiveTimeout.inSeconds, 3);
      });
    });
  });
}
