import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:finanzen/core/error/error.dart';
import 'package:finanzen/domain/usecases/usecase.dart';

// Example UseCase for testing
class GetExampleDataUseCase implements UseCase<String, NoParams> {
  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    // Simulate successful response
    return const Right('Example data');
  }
}

// Mock for the example UseCase
class MockGetExampleDataUseCase extends Mock implements UseCase<String, NoParams> {}

void main() {
  group('Domain Layer Tests', () {
    late GetExampleDataUseCase useCase;
    late MockGetExampleDataUseCase mockUseCase;

    setUp(() {
      useCase = GetExampleDataUseCase();
      mockUseCase = MockGetExampleDataUseCase();
      // Register fallback values
      registerFallbackValue(const NoParams());
    });

    group('GetExampleDataUseCase', () {
      test('should return Right when call is successful', () async {
        // Act
        final result = await useCase.call(const NoParams());

        // Assert
        expect(result, const Right<Failure, String>('Example data'));
      });

      test('should return data when mocked usecase is called', () async {
        // Arrange
        const expectedData = 'Mocked data';
        when(() => mockUseCase.call(any()))
            .thenAnswer((_) async => const Right(expectedData));

        // Act
        final result = await mockUseCase.call(const NoParams());

        // Assert
        result.fold(
          (failure) => fail('Expected Right but got Left'),
          (data) => expect(data, expectedData),
        );
        verify(() => mockUseCase.call(const NoParams())).called(1);
      });

      test('should return Failure when mocked usecase fails', () async {
        // Arrange
        const expectedFailure = ServerFailure('Server error');
        when(() => mockUseCase.call(any()))
            .thenAnswer((_) async => const Left(expectedFailure));

        // Act
        final result = await mockUseCase.call(const NoParams());

        // Assert
        result.fold(
          (failure) => expect(failure, expectedFailure),
          (data) => fail('Expected Left but got Right'),
        );
        verify(() => mockUseCase.call(const NoParams())).called(1);
      });
    });

    group('Failure Classes', () {
      test('ServerFailure should have correct message', () {
        // Arrange
        const message = 'Server error occurred';
        const failure = ServerFailure(message);

        // Assert
        expect(failure.message, message);
        expect(failure, isA<Failure>());
      });

      test('NetworkFailure should have correct message', () {
        // Arrange
        const message = 'Network error occurred';
        const failure = NetworkFailure(message);

        // Assert
        expect(failure.message, message);
        expect(failure, isA<Failure>());
      });

      test('CacheFailure should have correct message', () {
        // Arrange
        const message = 'Cache error occurred';
        const failure = CacheFailure(message);

        // Assert
        expect(failure.message, message);
        expect(failure, isA<Failure>());
      });
    });
  });
}
