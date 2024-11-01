import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
/*Crea una pantalla con varias tarjetas (Card) que tengan un título y una imagen.
Aplica “padding” y “margin” a cada tarjeta, y usa “Box Decoration” para añadir
bordes redondeados y una sombra.*/

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children:[
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red,
            border: Border.all(color: Colors.yellow,width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.yellow,
                  blurRadius: 10,
              ),
            ],
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  const Text("Titulo de tarjeta",style: TextStyle(color: Colors.black),
                  ),
                Expanded(
                  child:
                    Image.network("https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg"),
                ),
              ],
            ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
              border: Border.all(color: Colors.yellow,width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.yellow,
                  blurRadius: 10,
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Titulo de tarjeta",style: TextStyle(color: Colors.black),
              ),
              Expanded(
                child:
                Image.network("https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg"),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
              border: Border.all(color: Colors.yellow,width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.yellow,
                  blurRadius: 10,
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Titulo de tarjeta",style: TextStyle(color: Colors.black),
              ),
              Expanded(
                child:
                Image.network("https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg"),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
              border: Border.all(color: Colors.yellow,width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.yellow,
                  blurRadius: 10,
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Titulo de tarjeta",style: TextStyle(color: Colors.black),
              ),
              Expanded(
                child:
                Image.network("https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}