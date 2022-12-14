// Esta es una prueba básica de Flutter.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:daiet_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Crea  aplicación y activa un marco.
    await tester.pumpWidget(MyApp());
  });
}
