import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
/*Crea una interfaz que muestre un texto dinámico que cambie al presionar un botón (dentro
de build(), muestra un texto y un botón que actualice el texto cada vez que se pulse).*/
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  Estado createState() => Estado();
}

class Estado extends State<MyApp> {

  String cadena = "Este es el texto que se cambia";

  void cambiarTexto() {
    setState(() {
      cadena = "Texto cambiado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Titulo de la App"),),
        body: Center(
          child: Column(
            children: [
              const Text("Este botón cambia el texto de abajo"),
              ElevatedButton(onPressed: cambiarTexto, child: const Text("Cambiar")),
              Text(cadena)
            ],
          ),
        ),
      ),
    );
  }
}