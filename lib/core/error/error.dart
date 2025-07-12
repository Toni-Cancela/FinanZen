import 'package:dartz/dartz.dart';

// Error handling
abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  final String message;
  
  const ServerFailure(this.message);
}

class CacheFailure extends Failure {
  final String message;
  
  const CacheFailure(this.message);
}

class NetworkFailure extends Failure {
  final String message;
  
  const NetworkFailure(this.message);
}

// Type aliases for cleaner code
typedef FailureOr<T> = Either<Failure, T>;
