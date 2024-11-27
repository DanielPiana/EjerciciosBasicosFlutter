import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50], // Color de fondo del Scaffold
      appBar: AppBar(
        title: const Text(
          "Titulo del AppBar",
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.lightGreen[100], // Fondo del Container principal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.yellow[100], // Fondo de la columna de textos
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Column(
                  children: [
                    Text("Texto 1 en la columna"),
                    SizedBox(height: 40),
                    Text("Texto 2 en la columna"),
                  ],
                ),
              ),
              Container(
                color: Colors.pink[100], // Fondo del row de botones
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Botón 1"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Botón 2"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
