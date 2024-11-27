import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
//Un stateful widget aparte de un build, necesita un state
  @override
  Estado createState() => Estado(); //Creas un estado para manejar el estado de los widget
}

class Estado extends State<MyApp> {
  int contador = 0;

  void sumarContador() { //Funcion que suma 1 al contador
    setState(() {
      contador++;
    });
  }
  @override //El build debe tener un MaterialApp y un Scaffold
  Widget build(BuildContext context) {
    return MaterialApp( //Widget raiz
      home: Scaffold( //Proporciona estructura base de la app
        appBar: AppBar(title: const Text("Titulo contador"),), //Barra superior con el titulo
        body: Center( //Centrar contenido
          child: Column( //Usamos child porque el body solo acepta un componente hijo
            children: [ //Si quieres agregar cosas dentro de otro widget,usamos child si acepta 1 componente hijo solo o children si acepta más
              const Text("Presiona el botón"), //Un simple texto
              ElevatedButton(onPressed: sumarContador, child: Text("Sumar")), //Un boton que cuando le presionas, llama a la función sumaContador, con un texto dentro del botón.
              Text("Has presionado el botón $contador veces") //Otro texto normal
            ],
          ),
        ),
      ),
    );
  }
}


