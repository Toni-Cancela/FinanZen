# 🧪 Testing Guide - FinanZen

Esta guía describe las convenciones y mejores prácticas para testing en el proyecto FinanZen.

## 📁 Estructura de Testing

```
test/
├── helpers/                 # Utilities comunes para tests
│   ├── test_helpers.dart   # Helpers para widget testing
│   └── test_mocks.dart     # Mocks reutilizables
├── unit/                   # Tests unitarios
│   ├── data/              # Tests para capa de datos
│   ├── domain/            # Tests para capa de dominio
│   └── core/              # Tests para utilities core
├── widget/                # Tests de widgets
│   └── presentation/      # Tests de UI components
└── integration/           # Tests de integración
    └── app_integration_test.dart
```

## 🎯 Tipos de Tests

### 1. Tests Unitarios (`test/unit/`)
- **Propósito**: Probar lógica de negocio aislada
- **Cobertura objetivo**: 90%+
- **Enfoque**: UseCase, Repositories, Utilities

```dart
// Ejemplo de test unitario
test('should return success when data is valid', () async {
  // Arrange
  const input = 'valid_data';
  
  // Act
  final result = await useCase.call(input);
  
  // Assert
  expect(result.isRight(), true);
});
```

### 2. Tests de Widget (`test/widget/`)
- **Propósito**: Probar componentes de UI
- **Cobertura objetivo**: 80%+
- **Enfoque**: Widgets, Interactions, State changes

```dart
// Ejemplo de widget test
testWidgets('should display error message when validation fails', (tester) async {
  // Arrange
  await tester.pumpWidget(TestHelpers.createMaterialApp(MyWidget()));
  
  // Act
  await tester.enterText(find.byType(TextField), 'invalid');
  await tester.pump();
  
  // Assert
  expect(find.text('Error message'), findsOneWidget);
});
```

### 3. Tests de Integración (`test/integration/`)
- **Propósito**: Probar flujos completos de usuario
- **Enfoque**: Navegación, E2E flows, API integration

```dart
// Ejemplo de integration test
testWidgets('should complete login flow', (tester) async {
  app.main();
  await tester.pumpAndSettle();
  
  // Complete login flow...
});
```

## 🛠️ Herramientas de Testing

### Dependencias utilizadas:
- `flutter_test`: Framework base de testing
- `mocktail`: Mocking framework
- `bloc_test`: Testing utilities para BLoC
- `integration_test`: Tests de integración

### Helpers disponibles:
- `TestHelpers`: Utilities para widget testing
- `TestMocks`: Mocks predefinidos comunes
- `MockSetup`: Configuración común de mocks

## 📊 Coverage

### Ejecutar tests con coverage:
```bash
# Ejecutar todos los tests con coverage
flutter test --coverage

# Generar reporte HTML de coverage
genhtml coverage/lcov.info -o coverage/html
```

### Objetivos de cobertura:
- **Unit tests**: 90%+
- **Widget tests**: 80%+
- **Overall**: 85%+

### Archivos excluidos del coverage:
- Archivos generados (`*.g.dart`, `*.freezed.dart`)
- Archivos de configuración
- `main.dart`

## 🎨 Convenciones

### Nomenclatura:
- Tests unitarios: `*_test.dart`
- Tests de widget: `*_widget_test.dart` 
- Tests de integración: `*_integration_test.dart`
- Mocks: `Mock*` prefix

### Estructura de tests:
```dart
group('Feature/Class Name', () {
  late VariableType variable;
  
  setUp(() {
    // Setup común
  });
  
  tearDown(() {
    // Cleanup si es necesario
  });
  
  group('Method/Scenario Name', () {
    test('should return expected result when valid input', () async {
      // Arrange
      
      // Act
      
      // Assert
    });
    
    test('should throw exception when invalid input', () async {
      // Arrange
      
      // Act & Assert
      expect(() => methodCall(), throwsA(isA<ExceptionType>()));
    });
  });
});
```

### Mejores prácticas:

1. **Arrange-Act-Assert**: Estructura clara en cada test
2. **Descriptive names**: Nombres descriptivos para tests
3. **Single responsibility**: Un test = una responsabilidad
4. **Mocking**: Mock dependencies, no implementation details
5. **Cleanup**: Reset mocks en tearDown si es necesario

## 🚀 Comandos útiles

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests específicos
flutter test test/unit/domain/

# Ejecutar tests con coverage
flutter test --coverage

# Ejecutar tests de integración
flutter test integration_test/

# Ejecutar tests en modo watch
flutter test --watch

# Ejecutar tests con verbose output
flutter test --verbose
```

## 🔧 Configuración IDE

### VS Code:
```json
{
  "dart.testAdditionalArgs": ["--coverage"],
  "dart.debugExtensionBackendProtocol": "dds"
}
```

### Android Studio:
- Configurar run configurations para different test types
- Habilitar coverage reporting en settings

## 🐛 Debugging Tests

### Tips para debugging:
1. Usar `debugDumpApp()` en widget tests
2. Usar `printOnFailure()` para debug output
3. Usar `tester.binding.addTime()` para timing issues
4. Verificar pumps y settles en widget tests

### Common issues:
- **Async timing**: Usar `pumpAndSettle()` apropiadamente
- **Mock setup**: Verificar que mocks están configurados
- **State management**: Reset state entre tests
- **Platform channels**: Mock platform específico

---

📚 **Recursos adicionales:**
- [Flutter Testing Guide](https://flutter.dev/docs/testing)
- [Mocktail Documentation](https://pub.dev/packages/mocktail)
- [BLoC Testing](https://bloclibrary.dev/#/testing)
