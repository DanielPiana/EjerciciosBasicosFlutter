import 'package:flutter/material.dart';

/// Flutter code sample for [LinearProgressIndicator].

void main() => runApp(const ProgressIndicatorApp());

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
      home: const ProgressBarPage(),
    );
  }
}

class ProgressBarPage extends StatefulWidget {
  const ProgressBarPage({super.key});

  @override
  State<ProgressBarPage> createState() => _ProgressBarPageState();
}

class _ProgressBarPageState extends State<ProgressBarPage> {
  // Variable para controlar el progreso (de 0.0 a 1.0)
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barra de Progreso'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostrar el porcentaje actual
            Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            // Barra de progreso
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 20, // Hacer la barra más gruesa
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            // Botón para incrementar el progreso
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Aumentar el progreso en 10% (0.1)
                  if (progress < 1.0) {
                    progress += 0.1;
                    // Asegurarnos de que no pase de 1.0
                    if (progress > 1.0) progress = 1.0;
                  }
                });
              },
              child: const Text('Aumentar Progreso'),
            ),
            // Botón para reiniciar el progreso
            ElevatedButton(
              onPressed: () {
                setState(() {
                  progress = 0.0;
                });
              },
              child: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
    );
  }
}