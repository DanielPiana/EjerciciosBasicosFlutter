import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
/*/*.Crea una galería de imágenes en una cuadrícula usando GridView. Aplica
padding a cada imagen y un borde redondeado usando BoxDecoration.*/*/
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 12",
        style: TextStyle(fontSize: 40),),
      ),
      body: GridView.count(
          crossAxisCount: 2,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:
                  Image.network("https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg"),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:
                  Image.network("https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg"),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:
                  Image.network("https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg"),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:
                  Image.network("https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg"),
                ),
        ],
      ),
    );
  }

}


