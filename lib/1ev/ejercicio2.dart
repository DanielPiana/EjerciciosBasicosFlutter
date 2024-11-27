import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // Widget raíz MaterialApp
      home: HomePage(), // Página principal
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Titulo"),
      ),
      body: Center(
        child: Column( // Column para cumplir con el requerimiento
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Texto 1"),
            const Text("Texto 2"),
            const Text("Texto 3"),
            ElevatedButton( // ElevatedButton como se pide
              onPressed: () {
                print('hola');
              },
              child: const Text("Botón"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}