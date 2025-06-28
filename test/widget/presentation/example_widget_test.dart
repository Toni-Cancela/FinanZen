import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Example widget for testing
class ExampleWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const ExampleWidget({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to FinanZen'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  group('Presentation Layer Tests', () {
    group('ExampleWidget', () {
      testWidgets('should display title in AppBar', (WidgetTester tester) async {
        // Arrange
        const title = 'Test Title';
        
        // Act
        await tester.pumpWidget(
          const MaterialApp(
            home: ExampleWidget(title: title),
          ),
        );

        // Assert
        expect(find.text(title), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
      });

      testWidgets('should display welcome message', (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(
          const MaterialApp(
            home: ExampleWidget(title: 'Test'),
          ),
        );

        // Assert
        expect(find.text('Welcome to FinanZen'), findsOneWidget);
      });

      testWidgets('should display Get Started button', (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(
          const MaterialApp(
            home: ExampleWidget(title: 'Test'),
          ),
        );

        // Assert
        expect(find.text('Get Started'), findsOneWidget);
        expect(find.byType(ElevatedButton), findsOneWidget);
      });

      testWidgets('should call onPressed when button is tapped', (WidgetTester tester) async {
        // Arrange
        bool wasPressed = false;
        void onPressed() => wasPressed = true;

        await tester.pumpWidget(
          MaterialApp(
            home: ExampleWidget(
              title: 'Test',
              onPressed: onPressed,
            ),
          ),
        );

        // Act
        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();

        // Assert
        expect(wasPressed, true);
      });

      testWidgets('should handle null onPressed callback', (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(
          const MaterialApp(
            home: ExampleWidget(
              title: 'Test',
              onPressed: null,
            ),
          ),
        );

        // Assert
        final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
        expect(button.onPressed, null);
      });
    });
  });
}
