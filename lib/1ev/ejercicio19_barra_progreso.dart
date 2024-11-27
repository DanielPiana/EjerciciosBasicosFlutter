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
      home: const HomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

/*Crea una barra de progreso que se rellene al presionar un botón, simulando
una descarga. Usa LinearProgressIndicator y actualizado en función del
porcentaje que aumenta cada vez que se presione el botón.*/

class _HomepageState extends State<HomePage> with TickerProviderStateMixin {
  double progreso = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Barra de progreso", style: TextStyle(fontSize: 40)),
        centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: progreso,
              minHeight: 20,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
            ),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () {
              setState(() {
                progreso += 0.1;
              });
            },
                child: const Text("Aumentar progeso")),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: (){
              setState(() {
                progreso = 0;
              });
            },
                child: const Text("Reiniciar"))
          ],
        ),
      ),
    );
  }
}