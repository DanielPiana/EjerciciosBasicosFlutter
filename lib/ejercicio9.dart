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

class HomePage extends StatelessWidget {
  const HomePage({super.key});
/*https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg
* https://img.freepik.com/foto-gratis/gato-futurista-gafas-proteccion_23-2150969319.jpg?semt=ais_hybrid*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        SizedBox(
          height: 200,
          width: 800,
          child:
          Stack(
            children: [
              Positioned.fill(
                child: Image.network("https://img.freepik.com/foto-gratis/retrato-gato-antropomorfico-vestido-ropa-humana_23-2151107462.jpg",
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              const Positioned(
                  top: 50,
                  left: 20,
                  child:
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage("https://img.freepik.com/foto-gratis/gato-futurista-gafas-proteccion_23-2150969319.jpg?semt=ais_hybrid"),
                  ),
              ),
              Positioned(
                right: 20,
                top: 90,
                child:
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text("Botón"),
                  ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}
