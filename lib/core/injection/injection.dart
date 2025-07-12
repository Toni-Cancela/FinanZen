import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

// Dependency injection setup
class InjectionContainer {
  // Service locator will be configured here
  static void init() {
    configureDependencies();
  }
}
