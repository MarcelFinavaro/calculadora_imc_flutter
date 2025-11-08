import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_imc_flutter/main.dart';

void main() {
  testWidgets('App carrega corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculadoraIMCApp());
    expect(find.text('Calculadora de IMC'), findsOneWidget);
  });

  testWidgets('Exibe erro para altura zero', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculadoraIMCApp());
    await tester.enterText(find.widgetWithText(TextField, 'Peso (kg)'), '70');
    await tester.enterText(find.widgetWithText(TextField, 'Altura (m)'), '0');
    await tester.tap(find.text('Calcular IMC'));
    await tester.pump();
    expect(find.text('Por favor, insira valores válidos.'), findsOneWidget);
  });

  testWidgets('Exibe erro para entrada não numérica', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CalculadoraIMCApp());
    await tester.enterText(find.widgetWithText(TextField, 'Peso (kg)'), 'abc');
    await tester.enterText(
      find.widgetWithText(TextField, 'Altura (m)'),
      '1.75',
    );
    await tester.tap(find.text('Calcular IMC'));
    await tester.pump();
    expect(find.text('Por favor, insira valores válidos.'), findsOneWidget);
  });

  testWidgets('Classifica como obesidade', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculadoraIMCApp());
    await tester.enterText(find.widgetWithText(TextField, 'Peso (kg)'), '100');
    await tester.enterText(
      find.widgetWithText(TextField, 'Altura (m)'),
      '1.60',
    );
    await tester.tap(find.text('Calcular IMC'));
    await tester.pump();
    expect(find.textContaining('Obesidade'), findsOneWidget);
  });
}
