import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_imc_flutter/main.dart';

void main() {
  testWidgets('Verifica se os campos e botão estão presentes', (
    WidgetTester tester,
  ) async {
    // Monta o widget principal
    await tester.pumpWidget(const CalculadoraIMCApp());

    // Verifica se os campos de texto estão na tela
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.widgetWithText(TextField, 'Peso (kg)'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Altura (m)'), findsOneWidget);

    // Verifica se o botão está presente
    expect(find.text('Calcular IMC'), findsOneWidget);
  });

  testWidgets('Calcula IMC corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculadoraIMCApp());

    // Insere valores nos campos
    await tester.enterText(find.widgetWithText(TextField, 'Peso (kg)'), '70');
    await tester.enterText(
      find.widgetWithText(TextField, 'Altura (m)'),
      '1.75',
    );

    // Toca no botão
    await tester.tap(find.text('Calcular IMC'));
    await tester.pump();

    // Verifica se o resultado aparece
    expect(find.textContaining('IMC: 22.86'), findsOneWidget);
    expect(find.textContaining('Peso normal'), findsOneWidget);
  });
}
