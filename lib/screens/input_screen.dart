import 'package:flutter/material.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
    String selectedGender = 'Masculino';
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  void calculateBMI() {
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);
    final age = int.tryParse(ageController.text);

    if (weight != null && weight > 0 && height != null && height > 0 && age != null && age > 0) {
      final heightInMeters = height / 100;
      final bmi = (weight / (heightInMeters * heightInMeters)).toStringAsFixed(1);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            gender: selectedGender,
            age: age,
            height: height.toInt(),
            bmi: bmi,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos corretamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora IMC')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() => selectedGender = 'Masculino'),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: selectedGender == 'Masculino' ? Colors.blue : Colors.grey[300],
                        child: Icon(Icons.man, size: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      const Text('Homem'),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: () => setState(() => selectedGender = 'Feminino'),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: selectedGender == 'Feminino' ? Colors.pink : Colors.grey[300],
                        child: Icon(Icons.woman, size: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      const Text('Mulher'),
                    ],
                  ),
                ),
              ],
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Idade'),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Altura (cm)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Cor de fundo azul
                foregroundColor: Colors.white, // Texto branco
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: calculateBMI,
              child: const Text('Calcular seu IMC'),
            ),
          ],
        ),
      ),
    );
  }
}