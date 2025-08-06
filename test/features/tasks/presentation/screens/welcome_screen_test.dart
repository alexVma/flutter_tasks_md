import 'package:flutter/material.dart';
import 'package:flutter_tasks_md/features/home/presentation/screens/welcome_screen.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Muestra el mensaje de bienvenida', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));
    await tester.pumpAndSettle(); // espera a que cargue

    expect(find.text('¡Bienvenido a FlutterTasks!'), findsOneWidget);
  });
}
