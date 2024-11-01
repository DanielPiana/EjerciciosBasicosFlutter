import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
/*Crea una aplicación básica con un Scaffold que contenga una AppBar, un cuerpo de texto
y un FloatingActionButton.*/
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
        title:
        const Text("AppBar titulo", style: TextStyle(fontSize: 40),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Texto dentor de la columna")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){}, 
        child:
        const Text("Botón!!"),),
    );
  }
}