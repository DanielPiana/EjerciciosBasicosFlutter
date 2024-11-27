import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        isDarkMode: _isDarkMode, //isDarkMode: false
        /*SE LLAMA A ESTA FUNCIÓN CUANDO EL TEMA CAMBIE, COMO EL SWITCH QUE
        HEMOS USADO TIENE OF Y OFF (TRUE Y FALSE), AL DARLE AL BOTON,
        VIENE A LA FUNCION onThemeChanged Y RECIBE EL PARAMETRO DEL SWITCH(TRUE O FALSE)
        Y CAMBIA EL BOOLEANO _isDarkMode AL VALOR DEL SWITCH
        */
        onThemeChanged: (value) {
          setState(() {
            _isDarkMode = value;
          });
        },
      ),
      //AQUI ESTABLECEMOS EL TEMA
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cambio entre modo oscuro y claro",
            style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Data"),
            const SizedBox(height: 40),
            const Text("Data"),
            const SizedBox(height: 40),
            const Text("Data"),
            const SizedBox(height: 40),
            const Text("Data"),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Data"),
                SizedBox(width: 40),
                Text("Data"),
                SizedBox(width: 40),
                Text("Data"),
                SizedBox(width: 40),
                Text("Data"),
              ],
            ),
            Switch(
              //SWITCH ACEPTA EL VALUE, QUE ES TRUE O FALSE
              value: isDarkMode,
              //Y ACEPTA LA ACCION A REALIZAR CUANDO CAMBIE
              onChanged: onThemeChanged,
            ),
          ],
        ),
      ),
    );
  }
}