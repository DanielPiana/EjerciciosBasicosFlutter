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
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => CrearTarea()));
    });
  }
}

class ListaDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lista = context.watch<TareaProvider>()._listaTareas;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: lista.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final string = lista[index];
                return ListTile(
                    leading: Text(string)
                );
              }),
        )
      ],
    );
  }
}

class TareaProvider extends ChangeNotifier {
  late List<String> _listaTareas = [
    "Tarea 1"
  ];

  List<String> get listaTareas => _listaTareas;

  set listaTareas(List<String> value) {
    _listaTareas = value;
  }

  void agregarTarea(String nuevoLeading) {
    _listaTareas.add(nuevoLeading);
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
                context.read<TareaProvider>().agregarTarea(_controller.text.toString());
              },
              child: Text("Agregar"))
        ],
      ),
    );
  }
}
