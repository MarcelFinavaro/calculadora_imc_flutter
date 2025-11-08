import 'package:flutter/material.dart';

class ReferenceScreen extends StatelessWidget {
  const ReferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> imcTable = [
      {'range': '> 18.5', 'label': 'Abaixo do peso'},
      {'range': '18.5 – 24.9', 'label': 'Normal'},
      {'range': '25 – 29.9', 'label': 'Sobrepeso'},
      {'range': '≥ 30', 'label': 'Obesidade'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tabela de Referência IMC')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Classificações de IMC:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 🧾 Tabela estilizada
            Column(
              children: imcTable.map((item) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item['range']!, style: const TextStyle(color: Colors.white, fontSize: 16)),
                      Text(item['label']!, style: const TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}