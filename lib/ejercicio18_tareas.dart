import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}
/*Implementa una lista de tareas en la que el usuario pueda marcar las tareas
como completadas utilizando Checkbox. En caso de que la marque, el texto
debe cambiar a color gris claro y tacharse.
1. Como extra, que el usuario pueda añadir tareas con algún tipo de Form.*/
class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Lista de tareas", style: TextStyle(fontSize: 40)),
        centerTitle: true,
      backgroundColor: Colors.blue
      ),
    );
  }
}