import 'package:flutter/material.dart';
import 'reference_screen.dart';
import 'input_screen.dart';

class ResultScreen extends StatelessWidget {
  final String gender;
  final int age;
  final int height;
  final String bmi;

  const ResultScreen({
    super.key,
    required this.gender,
    required this.age,
    required this.height,
    required this.bmi,
  });

  String getClassification(double bmiValue) {
    if (bmiValue < 18.5) return 'Abaixo do peso';
    if (bmiValue < 25) return 'Normal';
    if (bmiValue < 30) return 'Sobrepeso';
    return 'Obesidade';
  }

  @override
  Widget build(BuildContext context) {
    final bmiValue = double.tryParse(bmi) ?? 0;
    final classification = getClassification(bmiValue);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado do IMC')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 👤 Avatares com destaque
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: gender == 'Masculino' ? Colors.blue : Colors.grey[300],
                  child: Icon(Icons.man, size: 40, color: Colors.white),
                ),
                const SizedBox(width: 40),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: gender == 'Feminino' ? Colors.pink : Colors.grey[300],
                  child: Icon(Icons.woman, size: 40, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 📝 Informações centralizadas
            Text('Gênero: $gender', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
            Text('Idade: $age anos', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
            Text('Altura: $height cm', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Text('Seu IMC é: $bmi', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            Text('Classificação: $classification', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
            const SizedBox(height: 40),

            // 🔘 Botão azul
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const InputScreen()),
                  (route) => false,
                );
              },
              child: const Text('Calcular IMC novamente'),
            ),

            const SizedBox(height: 20),

            // 🔘 Botão cinza
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReferenceScreen()),
                );
              },
              child: const Text('Ver tabela de referência'),
            ),
          ],
        ),
      ),
    );
  }
}