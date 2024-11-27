import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Perfil(),
    );
  }
}
/*Diseña una pantalla de perfil de usuario usando Stack para mostrar una
imagen de portada (fondo), un avatar redondeado superpuesto a la izquierda,
y el nombre del usuario a la derecha.
1. Añade un formulario debajo que permita editar los textos, guardarlos y que
cambien.*/

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<StatefulWidget> createState() => PerfilState();
}

//CREO LA CLASE PERFIL STATE PARA MANEJAR EL ESTADO DE LA CLASE
class PerfilState extends State<Perfil> {
  final textfieldController = TextEditingController();
  String nombre="Daniel";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Ejercicio 15", style: TextStyle(fontSize: 40)),
          centerTitle: true),
      body: Center(
        child: Column(children: [
          Stack(
            children: [
              Positioned(
                child: Image.network(
                  "https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg",
                  fit: BoxFit.cover,
                ),
              ),
               Positioned(
                top: 60,
                left: 20,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/foto-gratis/gato-futurista-gafas-proteccion_23-2150969319.jpg?semt=ais_hybrid"),
                    ),
                    SizedBox(width: 100),
                    Text(nombre,
                        style: TextStyle(fontSize: 80, color: Colors.white))
                  ]
                ),
              ),
            ]
          ),
          TextField(
            controller: textfieldController,
          ),
          SizedBox(height: 100),
          ElevatedButton(onPressed: () {
            setState(() {
              nombre = textfieldController.text;
            });
          }, child: Text("Cambiar nombre"))
        ]
        ),
      ),
    );
  }
}
