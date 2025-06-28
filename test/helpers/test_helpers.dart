import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Test helpers and utilities for FinanZen app
class TestHelpers {
  /// Creates a basic Material app wrapper for widget testing
  static Widget createMaterialApp(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  /// Creates a Material app with theme for widget testing
  static Widget createThemedMaterialApp(Widget child, {ThemeData? theme}) {
    return MaterialApp(
      theme: theme,
      home: child,
    );
  }

  /// Pumps and settles a widget for testing
  static Future<void> pumpWidget(
    WidgetTester tester,
    Widget widget, {
    Duration? duration,
  }) async {
    await tester.pumpWidget(widget);
    if (duration != null) {
      await tester.pumpAndSettle(duration);
    } else {
      await tester.pumpAndSettle();
    }
  }
}

/// Base class for mock objects to ensure reset functionality
class BaseMock extends Mock {
  void resetMock() => reset(this);
}

/// Mock call back for void functions
class MockCallBack extends Mock {
  void call();
}

/// Registers fallback values for commonly used types in tests
void registerFallbackValues() {
  // Register fallback values for common types
  // This prevents "Bad state: No fallback value was provided" errors
  registerFallbackValue(<String>[]);
  registerFallbackValue(<int>[]);
  registerFallbackValue(Container());
}

/// Setups common test configurations
void setupTestEnvironment() {
  // Register fallback values
  registerFallbackValues();
  
  // Setup any global test configurations here
}

/// Cleans up after tests
void tearDownTestEnvironment() {
  // Reset any global state here
}

/// Extension methods for easier testing
extension TestExtensions on WidgetTester {
  /// Finds a widget by its key
  Finder findByKey(Key key) => find.byKey(key);
  
  /// Finds a widget by its text
  Finder findByText(String text) => find.text(text);
  
  /// Finds a widget by its type
  Finder findByType<T>() => find.byType(T);
  
  /// Taps a widget and settles
  Future<void> tapAndSettle(Finder finder) async {
    await tap(finder);
    await pumpAndSettle();
  }
  
  /// Enters text and settles
  Future<void> enterTextAndSettle(Finder finder, String text) async {
    await enterText(finder, text);
    await pumpAndSettle();
  }
}
