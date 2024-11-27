import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TareaProvider(),
      child: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "Lista de tareas",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              centerTitle: true,
            ),
            body: ListaDisplay(), //Devuelvo la lista
            floatingActionButton: ButtonDisplay() //Devuelvo el boton
            ));
  }
}
class ButtonDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => CrearTarea()));
    });
  }
}
class ListaDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leading = context.watch<TareaProvider>()._leading;
    return Column(
      children: [
        ListTile(
          leading: Text(leading),
        ),
      ],
    );
  }
}

class TareaProvider extends ChangeNotifier {
  String _leading = "leading";

  String get leading => _leading;

  set leading(String value) {
    _leading = value;
  }

  void cambiarLeading(String nuevoLeading) {
    _leading = nuevoLeading;
    notifyListeners();
  }
}

class CrearTarea extends StatelessWidget {
  CrearTarea({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Tarea",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Nueva Tarea"),
          TextField(
            controller: _controller,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<TareaProvider>().cambiarLeading(_controller.text.toString());
              },
              child: Text("Agregar"))
        ],
      ),
    );
  }
}
