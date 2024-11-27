import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // ESTE WIDGET ENVUELVE LA RAÍZ DE LA APLICACIÓN Y PROPORCIONA UN MODELO
      // SE USA PARA CREAR LA INSTANCIA DEL MODELO PARA QUE SE PUEDA ACCEDER A ÉL
      create: (context) => ContadorProvider(),
      // WIDGET QUE ESTARÁ ENVUELTO POR CHANGENOTIFIERPROVIDER
      child: ContadorApp(),
    ),
  );
}
/*DENTRO DE ContadorApp, TODOS LOS WIDGETS HIJOS (COMO ContadorDisplay
E IncrementarButton) PUEDEN ACCEDER AL MODELO ContadorProvider USANDO EL CONTEXTO.*/

// ESTA CLASE DEFINE LA ESTRUCTURA BÁSICA DE LA APLICACIÓN
class ContadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ProviderEjemplo')),
        body: ContadorDisplay(), // DEFINE EL CONTADOR
        floatingActionButton: IncrementarButton(), // DEFINE EL BOTÓN
      ),
    );
  }
}

/* MUESTRA EL VALOR ACTUAL DEL CONTADOR
 * ESCUCHA LOS CAMBIOS EN EL MODELO ContadorProvider CON context.watch<ContadorProvider>()
 * OBTIENE EL VALOR ACTUAL DE contador Y LO SETEA */
class ContadorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contador = context.watch<ContadorProvider>().contador;
    return Center(
      child: Text('Contador: $contador', style: TextStyle(fontSize: 24)),
    );
  }
}

class IncrementarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // ACCEDE AL METODO incrementar DEL MODELO
        context.read<ContadorProvider>().incrementar();
      },
      child: Icon(Icons.add),
    );
  }
}

/* CLASE QUE EXTIENDE DE CHANGENOTIFIER PARA PODER NOTIFICAR A LOS WIDGETS
 * DE CUALQUIER CAMBIO EN LA VARIABLE _contador */
class ContadorProvider extends ChangeNotifier {
  int _contador = 5;

  int get contador => _contador;

  void incrementar() {
    _contador++;
    notifyListeners();
  }
}
