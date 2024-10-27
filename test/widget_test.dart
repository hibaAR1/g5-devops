import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app1/main.dart';

void main() {
  testWidgets('Products app test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());  // Changé en MyApp pour correspondre à votre classe

    // Test initial state
    expect(find.text('Liste des Produits'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}